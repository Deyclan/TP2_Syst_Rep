package com.brandonjulie.travelexpress.service;

import javax.persistence.*;

/**
 * Created by Valentin on 06/04/2016.
 */
public abstract class EntityService {

    protected EntityManager entityManager;
    protected EntityManagerFactory emf;

    EntityTransaction transaction;

    public EntityTransaction startTransaction() throws Exception {
        emf = Persistence.createEntityManagerFactory("travel_express");
        entityManager = emf.createEntityManager();

        return entityManager.getTransaction();
    }

    public void begin() throws Exception {
        this.transaction = startTransaction();
        this.transaction.begin();
    }

    public void commit() throws Exception {
        this.transaction.commit();
    }

    public void close() throws Exception {
        this.entityManager.close();
    }

    public void commitAndClose() throws Exception {
        commit();
        close();
    }
}