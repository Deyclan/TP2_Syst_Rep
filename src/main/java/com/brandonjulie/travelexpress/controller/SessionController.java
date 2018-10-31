package com.brandonjulie.travelexpress.controller;

import com.brandonjulie.travelexpress.service.ConnectionService;
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
        Boolean canConnect;
        String destinationPage;
        try {
            ConnectionService unService = new ConnectionService();
            String username = request.getParameter("username");
            canConnect = unService.connect(username, request.getParameter("password"));
            if(canConnect){
                request.getSession().setAttribute("username", username);
                destinationPage = "index";
            } else {
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
            // TODO: gérer l'inscription
            destinationPage = "seConnecter";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }

        /*------------------------------------------ PROFIL ------------------------------------------*/

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public ModelAndView showProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("profile");
    }

        /*------------------------------------------ DECONNEXION ------------------------------------------*/

    @RequestMapping(value = "seDeconnecter", method = RequestMethod.GET)
    public ModelAndView deconnexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO: gérer la déconnexion
        return new ModelAndView("index");
    }
}
