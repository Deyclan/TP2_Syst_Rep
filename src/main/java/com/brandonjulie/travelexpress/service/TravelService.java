package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.TravelEntity;

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
            travelEntities = (List<TravelEntity>) entityManager.createQuery("select t from TravelEntity t where t.fromAdress like :fromAdress and t.toAdress like :toAdress").getResultList();
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return travelEntities;
    }

    public List<TravelEntity> getTravels(String from, String to, float maxPrice){
        List<TravelEntity> travelEntities = null;
        try {
            startTransaction();
            begin();
            String fromAdress = new StringBuilder().append("%").append(from).append("%").toString();
            String toAdress = new StringBuilder().append("%").append(to).append("%").toString();
            travelEntities = (List<TravelEntity>) entityManager.createQuery("select t from TravelEntity t where t.fromAdress like :fromAdress and t.toAdress like :toAdress and t.cost <= :maxPrice").getResultList();
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return travelEntities;
    }

    public List<TravelEntity> getTravels(int idOfferer) {
        List<TravelEntity> travelEntities = null;
        try {
            startTransaction();
            begin();
            travelEntities = (List<TravelEntity>) entityManager.createQuery("select t from TravelEntity t where t.idOfferer =:idOfferer").getResultList();
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return travelEntities;

    }
}
