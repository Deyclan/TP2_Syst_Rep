package com.brandonjulie.travelexpress.controller;

import com.brandonjulie.travelexpress.entities.ReservationEntity;
import com.brandonjulie.travelexpress.entities.TransactionEntity;
import com.brandonjulie.travelexpress.entities.TravelEntity;
import com.brandonjulie.travelexpress.service.ReservationService;
import com.brandonjulie.travelexpress.service.TransactionService;
import com.brandonjulie.travelexpress.service.TravelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

@Controller
public class ReservationController {

    TravelService travelService = new TravelService();
    ReservationService reservationService = new ReservationService();
    TransactionService transactionService = new TransactionService();
    private int possibleSeatsLeft;

    @RequestMapping(value = "ajouterReservation", method = RequestMethod.POST)
    public ModelAndView addReservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TravelEntity travelEntity = travelService.getTravelByID(Integer.parseInt(request.getParameter("reserv")));
        request.setAttribute("travel", travelEntity);
        request.setAttribute("user", travelEntity.getUserByIdOfferer());
        int numberOfSeatsReserved = 0;
        List<ReservationEntity> reservationEntities = reservationService.getReservationsByTravelID(travelEntity.getId());
        if (reservationEntities.size()>0){
            for (ReservationEntity reservationEntity: reservationEntities ) {
                TransactionEntity transactionEntity = transactionService.getTransactionByID(reservationEntity.getIdTransaction());
                numberOfSeatsReserved+= transactionEntity.getAmont().divide(BigDecimal.valueOf(5)).intValueExact();
            }
        }
        possibleSeatsLeft = travelEntity.getSeatsNumber() - numberOfSeatsReserved;
        request.setAttribute("seats", possibleSeatsLeft);
        return new ModelAndView("reserverTrajet");
    }

    @RequestMapping(value = "insererReservation", method = RequestMethod.POST)
    public ModelAndView insertReservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            ReservationEntity aReservation = new ReservationEntity();
            TransactionEntity aTransaction = new TransactionEntity();
            TravelEntity aTravel = travelService.getTravelByID(Integer.parseInt(request.getParameter("payBtn")));

            if(request.getSession().getAttribute("connectedUserID") != null){
                aReservation.setIdReserver((Integer) request.getSession().getAttribute("connectedUserID"));
            } else {
                // The ones reserving without an account will be attributed the id 1
                aReservation.setIdReserver(1);
            }
            aReservation.setIdTravel(aTravel.getId());
            aReservation.setConfirmed((byte)1);

            aTransaction.setIdPayer(aReservation.getIdReserver());
            aTransaction.setAmont( aTravel.getCost().multiply(new BigDecimal(request.getParameter("seatsReserved"))));
            aTransaction.setIdReceiver(aTravel.getIdOfferer());
            transactionService.insertTransaction(aTransaction);

            aReservation.setIdTransaction(transactionService.getTransactionIDByContent(aTransaction));
            reservationService.insertReservation(aReservation);

            // Setting travel's state to 1 = full.
            if(Integer.parseInt(request.getParameter("seatsReserved")) == possibleSeatsLeft){
                aTravel.setState(1);
                travelService.updateTravel(aTravel);
            }

            request.setAttribute("successMsg", "Réservation réussie");
            destinationPage = "index";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }
}
