/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.users.dao;

import com.users.model.userResultModel;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Chetan
 */
public class userResultDao {
    
    public boolean addUserResult(userResultModel urm) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction t = session.getTransaction();

        try {
            t.begin();
            session.save(urm);
            t.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }

        return false;
    }
}
