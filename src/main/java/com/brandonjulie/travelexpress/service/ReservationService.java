package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.ReservationEntity;

import java.util.List;

public class ReservationService extends EntityService {

    public void insertReservation(ReservationEntity reservationEntity){
        try{
            startTransaction();
            begin();
            entityManager.persist(reservationEntity);
            commitAndClose();
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

    public ReservationEntity getReservationByID(int idReservation){
        ReservationEntity reservationEntity = null;
        try{
            startTransaction();
            begin();
            reservationEntity = entityManager.find(ReservationEntity.class, idReservation);
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reservationEntity;
    }
}
