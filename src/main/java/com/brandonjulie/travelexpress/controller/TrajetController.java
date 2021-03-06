package com.brandonjulie.travelexpress.controller;

import com.brandonjulie.travelexpress.entities.TravelEntity;
import com.brandonjulie.travelexpress.entities.UserEntity;
import com.brandonjulie.travelexpress.service.TravelService;
import com.brandonjulie.travelexpress.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TrajetController {

    TravelService travelService = new TravelService();
    UserService userService = new UserService();

            /*------------------------------------------ CREER TRAJET ------------------------------------------*/

    @RequestMapping(value = "annoncerTrajet")
    public ModelAndView addTrip(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            boolean isConnected = false;
            if (request.getSession().getAttribute("connectedUserID") != null) {
                isConnected = true;
            }
            if(isConnected){
                destinationPage = "ajouterTrajet";
            }
            else {
                request.setAttribute("errorMsg", "Veuillez vous connecter pour proposer un trajet");
                destinationPage = "seConnecter";
            }
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }

    @RequestMapping(value = "insererTrajet")
    public ModelAndView insertTrip(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            UserEntity userEntity = userService.getUserById((Integer) request.getSession().getAttribute("connectedUserID"));
            TravelEntity aTravel = new TravelEntity();
            aTravel.setCost(new BigDecimal(Float.parseFloat(request.getParameter("priceTravel"))));
            aTravel.setDate(Date.valueOf(request.getParameter("dateTravel")));
            aTravel.setFromAdress(request.getParameter("fromAdressTravel"));
            aTravel.setToAdress(request.getParameter("toAdressTravel"));
            aTravel.setSeatsNumber(Integer.parseInt(request.getParameter("seatTravel")));
            aTravel.setState(0);
            aTravel.setIdOfferer(userEntity.getId());
            if (request.getParameter("luggage") != null) {
                aTravel.setLuggage((byte) 1);
            } else { aTravel.setLuggage((byte) 0); }
            if (request.getParameter("smoke") != null) {
                aTravel.setSmoke((byte) 1);
            } else { aTravel.setSmoke((byte) 0); }
            aTravel.setReservationsById(new ArrayList<>());
            if(userEntity.getPhone()==null || userEntity.getPhone()==""){
                aTravel.setPhone((byte)0);
            } else {
                aTravel.setPhone((byte)1);
            }
            travelService.insertTravel(aTravel);
            request.setAttribute("successMsg", "Création d'un trajet réussie");
            destinationPage = "index";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }

            /*------------------------------------------ RECHERCHER TRAJET ------------------------------------------*/

    @RequestMapping(value = "rechercherTrajet", method = RequestMethod.GET)
    public ModelAndView searchTravel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("rechercherTrajet");
    }

    @RequestMapping(value = "listerResultatsTrajet", method = RequestMethod.POST)
    public ModelAndView listResults(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<TravelEntity> travelEntities;
        if(request.getParameter("dateTravel") == null || request.getParameter("dateTravel") == ""){
            travelEntities = travelService.getTravels(request.getParameter("fromAdressTravel"), request.getParameter("toAdressTravel"));
            for (TravelEntity travelEntity: travelEntities) {
                travelEntity.setUserByIdOfferer(userService.getUserById(travelEntity.getIdOfferer()));
            }
        }
        else{
            Date dateTravel = Date.valueOf(request.getParameter("dateTravel"));
            travelEntities = travelService.getTravelsWithDate(request.getParameter("fromAdressTravel"), request.getParameter("toAdressTravel"), dateTravel);
            for (TravelEntity travelEntity: travelEntities) {
                travelEntity.setUserByIdOfferer(userService.getUserById(travelEntity.getIdOfferer()));
            }
        }
        if(travelEntities.size()>0){
            //Update travel's state to 2 = passed, so we can't reserve anymore
            Date todayDate = new Date(new java.util.Date().getTime());
            for (TravelEntity travelEntity: travelEntities ) {
                if(travelEntity.getDate().before(todayDate)){
                    travelEntity.setState(2);
                    travelService.updateTravel(travelEntity);
                }
            }
            request.setAttribute("resultedTravels", travelEntities);
        }
        return new ModelAndView("listerResultatsTrajet");
    }


}
