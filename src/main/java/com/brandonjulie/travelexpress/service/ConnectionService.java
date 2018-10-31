package com.brandonjulie.travelexpress.service;

import javax.persistence.EntityTransaction;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConnectionService extends EntityService {

/* Connexion selon user et password*/

    public boolean connect(String userName, String password) {
        Map mParams = new HashMap();
        Map mParam;
        List<Object> rs;
        Boolean canLogin = false;

        try {
            if (userName != null && password != null) {
                EntityTransaction transac = startTransaction();
                transac.begin();
                rs = entityManager.createQuery("SELECT u FROM UserEntity u WHERE u.username ='" + userName + "' AND u.password ='" + password + "'").getResultList();
                if (rs.size() > 0) {
                    canLogin = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return canLogin;
    }

}
