package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.ReservationEntity;

import javax.persistence.EntityTransaction;
import java.util.List;

public class ReservationService extends EntityService {

    public void insertReservation(ReservationEntity reservationEntity){
        try{
            EntityTransaction entityTransaction = startTransaction();
            entityTransaction.begin();
            entityManager.persist(reservationEntity);
            entityTransaction.commit();
            entityManager.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Integer> getReservationsTravelIDByReserverID(int idReserver){
        List<Integer> reservationEntities = null;
        try {
            startTransaction();
            begin();
            reservationEntities = (List<Integer>) entityManager.createQuery("select r.idTravel from ReservationEntity r where r.idReserver ="+idReserver).getResultList();
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return reservationEntities;
    }

    public List<ReservationEntity> getReservationsByTravelID(int idTravel){
        List<ReservationEntity> reservationEntities = null;
        try {
            startTransaction();
            begin();
            reservationEntities = (List<ReservationEntity>) entityManager.createQuery("select r from ReservationEntity r where r.idTravel ="+idTravel).getResultList();
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return reservationEntities;
    }
}
