package com.brandonjulie.travelexpress.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MultiController {

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

}
