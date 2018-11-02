package com.brandonjulie.travelexpress.controller;

import com.brandonjulie.travelexpress.entities.UserEntity;
import com.brandonjulie.travelexpress.service.ConnectionService;
import com.brandonjulie.travelexpress.service.TravelService;
import com.brandonjulie.travelexpress.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SessionController {

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
            ConnectionService unService = new ConnectionService();
            idUser = unService.connect(request.getParameter("username"), request.getParameter("password"));
            if(idUser != -1){
                // TODO : see if it works
                request.setAttribute("connectedUserID", idUser);
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
        String destinationPage;
        try {
            UserService userService = new UserService();
            UserEntity userEntity = new UserEntity();
            userEntity.setFirstname(request.getParameter("firstname"));
            userEntity.setName(request.getParameter("lastname"));
            userEntity.setEmail(request.getParameter("email"));
            userEntity.setPhone(request.getParameter("phone"));
            userEntity.setUsername(request.getParameter("username"));
            userEntity.setPassword(request.getParameter("password"));
            // TODO: are the other parameters nullable?
            userService.insertUser(userEntity);
            destinationPage = "seConnecter";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }

        /*------------------------------------------ PROFIL ------------------------------------------*/

    @RequestMapping(value = "profil", method = RequestMethod.GET)
    public ModelAndView showProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserService userService = new UserService();
        UserEntity userEntity = userService.getUserById(Integer.parseInt(request.getParameter("connectedUserID")));
        request.setAttribute("user", userEntity);
        TravelService travelService = new TravelService();
        request.setAttribute("travelsProposed",travelService.getTravels(userEntity.getId()));
        // TODO : see how works those collections in UserEntity
        return new ModelAndView("profil");
    }

    @RequestMapping(value = "updateProfil", method = RequestMethod.GET)
    public ModelAndView updateProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserService userService = new UserService();
        UserEntity userEntity = userService.getUserById(Integer.parseInt(request.getParameter("connectedUserID")));
        userEntity.setPhone(request.getParameter("phone"));
        userEntity.setEmail(request.getParameter("email"));
        userService.updateUser(userEntity);
        return this.showProfile(request,response);
    }

        /*------------------------------------------ DECONNEXION ------------------------------------------*/

    @RequestMapping(value = "seDeconnecter", method = RequestMethod.GET)
    public ModelAndView deconnexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
       // TODO : make sure it works
        request.setAttribute("connectedUserID", "-1");
        return new ModelAndView("index");
    }
}
