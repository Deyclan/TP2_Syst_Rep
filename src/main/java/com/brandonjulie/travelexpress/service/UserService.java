package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.UserEntity;

import javax.persistence.EntityTransaction;

public class UserService extends EntityService {

    public void insertUser(UserEntity userEntity){
        try{
            EntityTransaction entityTransaction = startTransaction();
            entityTransaction.begin();
            entityManager.persist(userEntity);
            entityTransaction.commit();
            entityManager.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public UserEntity getUserById(int id){
        UserEntity user = null;
        try{
            startTransaction();
            begin();
            user = entityManager.find(UserEntity.class, id);
            close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public void updateUser(UserEntity userEntity) {
        try {
            startTransaction();
            begin();
            entityManager.merge(userEntity);
            commitAndClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
