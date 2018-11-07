package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.TransactionEntity;

import java.math.BigDecimal;

public class TransactionService extends EntityService {

    public void insertTransaction(TransactionEntity transactionEntity){
        try {
            startTransaction();
            begin();
            entityManager.persist(transactionEntity);
            commitAndClose();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public TransactionEntity getTransactionByID(int idTransaction) {
        TransactionEntity travelEntity = null;
        try {
            startTransaction();
            transaction.begin();
            travelEntity = entityManager.find(TransactionEntity.class, idTransaction);
            entityManager.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return travelEntity;
    }

    public int getTransactionIDByContent(TransactionEntity transactionEntity){
        return this.getTransactionIDByContent(transactionEntity.getAmont(), transactionEntity.getIdPayer(), transactionEntity.getIdReceiver());
    }

    public int getTransactionIDByContent(BigDecimal amont, int idPayer, int idReceiver){
        int transactionID = -1;
        try{
            startTransaction();
            begin();
            transactionID = (int) entityManager.createQuery("select t.id from TransactionEntity t where t.amont ="+amont+" and t.idPayer="+idPayer+" and t.idReceiver="+ idReceiver).getSingleResult();
            close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return transactionID;
    }
}
