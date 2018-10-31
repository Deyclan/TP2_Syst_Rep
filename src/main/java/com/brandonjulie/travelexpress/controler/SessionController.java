package com.brandonjulie.travelexpress.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @RequestMapping(value = "seConnecter", method = RequestMethod.GET)
    public ModelAndView showConnexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("seConnecter");
    }

    @RequestMapping(value = "connexion", method = RequestMethod.POST)
    public ModelAndView connexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Boolean canConnect = false;
        String destinationPage;
        try {
            ServiceConnexion unService = new ServiceConnexion();
            canConnect = unService.seConnecter(request.getParameter("username"), request.getParameter("password"));
            destinationPage = canConnect ? "accueil" : "seConnecter";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }

    @RequestMapping(value = "seDeconnecter", method = RequestMethod.GET)
    public ModelAndView deconnexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("index");
    }
}
