package com.brandonjulie.travelexpress.controler;

import com.brandonjulie.travelexpress.service.ConnectionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MultiControler {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView printIndex1(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView printIndex2(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView printIndex3(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("index");
    }

    // /
    // / Affichage de la page d'accueil oeuvre suite à une connexion
    // /
    @RequestMapping(value = "seConnecter", method = RequestMethod.POST)
    public ModelAndView connexion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Boolean canConnect = false;
        String destinationPage = "";
        try {
            ConnectionService connectionService = new ConnectionService();
            canConnect = connectionService.connect(request.getParameter("username"), request.getParameter("password"));
            destinationPage = canConnect ? "accueil" : "seConnecter"; // TODO : Change page names
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView(destinationPage);
    }

}
