package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.UserEntity;

import javax.persistence.Entity;
import javax.persistence.EntityTransaction;

public class UserService extends EntityService {

    public void insertUser(UserEntity userEntity){
        try{
            begin();
            entityManager.persist(userEntity);
            commitAndClose();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public UserEntity getUserById(int id){
        UserEntity user = null;
        try{
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
            begin();
            entityManager.merge(userEntity);
            commitAndClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
