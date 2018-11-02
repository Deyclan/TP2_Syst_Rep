package com.brandonjulie.travelexpress.service;

import com.brandonjulie.travelexpress.entities.UserEntity;

import javax.persistence.EntityTransaction;
import java.util.List;

public class ConnectionService extends EntityService {

/* Connexion selon user et password*/

    public int connect(String userName, String password) {
        List<UserEntity> rs;
        int userID =-1;

        try {
            if (userName != null && password != null) {
                EntityTransaction transac = startTransaction();
                transac.begin();
                rs = entityManager.createQuery("SELECT u FROM UserEntity u WHERE u.username ='" + userName + "' AND u.password ='" + password + "'").getResultList();
                if (rs.size() > 0) {
                    userID = rs.get(0).getId();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userID;
    }

}
