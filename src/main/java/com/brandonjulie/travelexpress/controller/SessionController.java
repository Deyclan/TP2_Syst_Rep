package com.brandonjulie.travelexpress.controller;

import com.brandonjulie.travelexpress.entities.ReservationEntity;
import com.brandonjulie.travelexpress.entities.TransactionEntity;
import com.brandonjulie.travelexpress.entities.TravelEntity;
import com.brandonjulie.travelexpress.entities.UserEntity;
import com.brandonjulie.travelexpress.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SessionController {

    //TODO: fix UTF8 problem
    ConnectionService unService = new ConnectionService();
    ReservationService reservationService = new ReservationService();
    TravelService travelService = new TravelService();
    UserService userService = new UserService();
    TransactionService transactionService = new TransactionService();


        /*------------------------------------------ CONNEXION ------------------------------------------*/

    @RequestMapping(value = "seConnecter", method = RequestMethod.GET)
    public ModelAndView showConnexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("seConnecter");
    }

    @RequestMapping(value = "connexion", method = RequestMethod.POST)
    public ModelAndView connexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int idUser;
        String destinationPage;
        try {
            idUser = unService.connect(request.getParameter("username"), request.getParameter("password"));
            if(idUser != -1){
                request.getSession().setAttribute("connectedUserID", idUser);
                request.setAttribute("successMsg", "Vous êtes bien connecté");
                destinationPage = "index";
            } else {
                request.setAttribute("errorMsg", "Identifiant ou mot de passe incorrect");
                destinationPage = "seConnecter";
            }
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }

        /*------------------------------------------ INSCRIPTION ------------------------------------------*/

    @RequestMapping(value = "sInscrire", method = RequestMethod.GET)
    public ModelAndView showInscription(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("sInscrire");
    }

    @RequestMapping(value = "inscription", method = RequestMethod.POST)
    public ModelAndView inscription(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            UserEntity userEntity = new UserEntity();
            userEntity.setFirstname(request.getParameter("firstname"));
            userEntity.setName(request.getParameter("lastname"));
            userEntity.setEmail(request.getParameter("email"));
            userEntity.setPhone(request.getParameter("phone"));
            userEntity.setUsername(request.getParameter("username"));
            userEntity.setPassword(request.getParameter("password"));
            userEntity.setReservationsById(new ArrayList<>());
            userEntity.setTravelsById(new ArrayList<>());
            userService.insertUser(userEntity);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
        }
        return this.connexion(request,response);
    }

        /*------------------------------------------ PROFIL ------------------------------------------*/

    @RequestMapping(value = "profil", method = RequestMethod.GET)
    public ModelAndView showProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int userID = Integer.parseInt(request.getSession().getAttribute("connectedUserID").toString());
        UserEntity userEntity = userService.getUserById(userID);
        if(userEntity.getPhone() == null || userEntity.getPhone() == ""){
            userEntity.setPhone("Non défini");
        }
        request.setAttribute("user", userEntity);
        request.setAttribute("travelsProposed",travelService.getTravelsByOffererID(userID));
        List<TravelEntity> reservedTravels = new ArrayList<>();
        List<Integer> reservedTravelsID = reservationService.getReservationsTravelIDByReserverID(userID);
        for (Integer travelID : reservedTravelsID) {
            reservedTravels.add(travelService.getTravelByID(travelID));
        }
        request.setAttribute("travelsReserved", reservedTravels);
        return new ModelAndView("profil");
    }

    @RequestMapping(value = "updateProfil", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserEntity userEntity = userService.getUserById(Integer.parseInt(request.getSession().getAttribute("connectedUserID").toString()));
        if(request.getParameter("phone") != "Non défini")
            userEntity.setPhone(request.getParameter("phone"));
        userEntity.setEmail(request.getParameter("email"));
        userService.updateUser(userEntity);
        return this.showProfile(request,response);
    }

        /*------------------------------------------ INFOS TRAJETS ------------------------------------------*/

    @RequestMapping(value = "infoTrajetPropose", method = RequestMethod.POST)
    public ModelAndView showProposedTravels(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TravelEntity travelEntity = travelService.getTravelByID(Integer.parseInt(request.getParameter("infoProposedBtn")));
        request.setAttribute("travel", travelEntity);
        List<ReservationEntity> reservationEntities = reservationService.getReservationsByTravelID(travelEntity.getId());
        StringBuilder stringBuilder = new StringBuilder("");
        int numberOfSeatsReserved = 0;
        for (ReservationEntity reservationEntity: reservationEntities) {
            UserEntity userEntity = userService.getUserById(reservationEntity.getIdReserver());
            stringBuilder.append(userEntity.getFirstname());
            stringBuilder.append(" ");
            TransactionEntity transactionEntity = transactionService.getTransactionByID(reservationEntity.getIdTransaction());
            numberOfSeatsReserved+= transactionEntity.getAmont().divide(BigDecimal.valueOf(5)).intValueExact();
        }
        if (stringBuilder.length() > 0) {
            request.setAttribute("reservers", stringBuilder.toString());
        } else {
            request.setAttribute("reservers", "Aucune personne");
        }
        if(travelEntity.getState()==1){
            request.setAttribute("seats", "aucune");
        } else {
            request.setAttribute("seats", travelEntity.getSeatsNumber() - numberOfSeatsReserved);
            if(travelEntity.getState()==2){
                request.setAttribute("hidden", "hidden");
            }
        }

        return new ModelAndView("infoTrajetPropose");
    }

    @RequestMapping(value ="updateProposedTravel", method = RequestMethod.POST)
    public ModelAndView updateProposedTravel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TravelEntity travelEntity = travelService.getTravelByID(Integer.parseInt(request.getParameter("validateTravelBtn")));
        if (request.getParameter("luggage") != null) {
            travelEntity.setLuggage((byte) 1);
        } else { travelEntity.setLuggage((byte) 0); }
        if (request.getParameter("smoke") != null) {
            travelEntity.setSmoke((byte) 1);
        } else { travelEntity.setSmoke((byte) 0); }
        travelService.updateTravel(travelEntity);
        return this.showProfile(request,response);
    }

    @RequestMapping(value = "infoTrajetReserve", method = RequestMethod.POST)
    public ModelAndView showReservedTravels(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TravelEntity travelEntity = travelService.getTravelByID(Integer.parseInt(request.getParameter("infoReservedBtn")));
        request.setAttribute("travel", travelEntity);
        request.setAttribute("user", travelEntity.getUserByIdOfferer());
        return new ModelAndView("infoTrajetReserve");
    }

    @RequestMapping(value ="updateReservedTravel", method = RequestMethod.POST)
    public ModelAndView updateReservedTravel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserEntity userEntity = userService.getUserById(Integer.parseInt(request.getParameter("validateNoteBtn")));
        if (request.getParameter("note") != null && request.getParameter("note") != "") {
            if (userEntity.getRating() == null || userEntity.getRating().compareTo(BigDecimal.valueOf(0)) != 1) {
                userEntity.setRating(new BigDecimal(request.getParameter("note")));
            } else {
                userEntity.setRating(userEntity.getRating().add(new BigDecimal(request.getParameter("note"))).divide(BigDecimal.valueOf(2)));
            }
            userService.updateUser(userEntity);
        }
        return this.showProfile(request,response);
    }

        /*------------------------------------------ DECONNEXION ------------------------------------------*/

    @RequestMapping(value = "seDeconnecter", method = RequestMethod.GET)
    public ModelAndView deconnexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getSession().removeAttribute("connectedUserID");
        request.setAttribute("successMsg", "Déconnexion réussie");
        return new ModelAndView("index");
    }
}
