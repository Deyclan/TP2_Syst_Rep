package com.brandonjulie.travelexpress.controller;

import com.brandonjulie.travelexpress.entities.TravelEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Date;

@Controller
public class TrajetController {

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
            TravelEntity aTravel = new TravelEntity();
            aTravel.setCost(new BigDecimal(Float.parseFloat(request.getParameter("priceTravel"))));
            aTravel.setDate(Date.valueOf(request.getParameter("dateTravel")));
            aTravel.setFromAdress(request.getParameter("fromAdressTravel"));
            aTravel.setToAdress(request.getParameter("toAdressTravel"));
            aTravel.setSeatsNumber(Integer.parseInt(request.getParameter("seatTravel")));
            aTravel.setState(0);
            // TODO: compléter le travel avec les infos de la personne connectée + mettre en BDD
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
        //TODO : get list of trajet corresponding to criterias
        return new ModelAndView("listerResultatsTrajet");
    }


}
