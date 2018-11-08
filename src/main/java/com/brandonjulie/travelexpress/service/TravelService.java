package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.TravelEntity;

import javax.persistence.EntityTransaction;
import java.sql.Date;
import java.util.List;

public class TravelService extends EntityService {

    public void insertTravel(TravelEntity travelEntity){
        try {
            startTransaction();
            begin();
            entityManager.persist(travelEntity);
            commitAndClose();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<TravelEntity> getTravels(String from, String to){
        List<TravelEntity> travelEntities = null;
        try {
            startTransaction();
            begin();
            String fromAdress = new StringBuilder().append("%").append(from).append("%").toString();
            String toAdress = new StringBuilder().append("%").append(to).append("%").toString();
            travelEntities = (List<TravelEntity>) entityManager.createQuery("select t from TravelEntity t where t.fromAdress like '"+fromAdress+"' and t.toAdress like '"+ toAdress+"'").getResultList();
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return travelEntities;
    }

    public List<TravelEntity> getTravelsWithDate(String from, String to, Date dateTravel){
        List<TravelEntity> travelEntities = null;
        try {
            startTransaction();
            begin();
            String fromAdress = new StringBuilder().append("%").append(from).append("%").toString();
            String toAdress = new StringBuilder().append("%").append(to).append("%").toString();
            travelEntities = (List<TravelEntity>) entityManager.createQuery("select t from TravelEntity t where t.fromAdress like '"+fromAdress+"' and t.toAdress like '"+ toAdress +"' and t.date ="+dateTravel).getResultList();
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return travelEntities;
    }

    public List<TravelEntity> getTravelsByOffererID(int idOfferer) {
        List<TravelEntity> travelEntities = null;
        try {
            startTransaction();
            begin();
            travelEntities = (List<TravelEntity>) entityManager.createQuery("select t from TravelEntity t where t.idOfferer ="+idOfferer).getResultList();
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return travelEntities;
    }

    public TravelEntity getTravelByID(int idTravel) {
        TravelEntity travelEntity = null;
        try {
            EntityTransaction transaction = startTransaction();
            transaction.begin();
            travelEntity = entityManager.find(TravelEntity.class, idTravel);
            entityManager.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return travelEntity;
    }

    public void updateTravel(TravelEntity travel) {
        try {
            startTransaction();
            begin();
            entityManager.merge(travel);
            commit();
            entityManager.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
