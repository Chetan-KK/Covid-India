/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.users.dao;

import com.users.model.userModel;
import com.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Chetan
 */
public class userDao {

    public boolean addUser(userModel um) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction t = session.getTransaction();

        try {
            t.begin();
            session.save(um);
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
    
    
    public List<userModel> getAllUser() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction tx = session.beginTransaction();
        try {

            Query query = session.createQuery("FROM userModel");
            List<userModel> clist = query.list();
            tx.commit();
            return clist;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }

        return null;

    }

    public boolean deleteuser(userModel um) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction tx = session.getTransaction();

        try {
            tx.begin();
            session.delete(um);
            tx.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {

            session.close();
        }

        return false;

    }

    public userModel getByUserId(Long id) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.getTransaction();

        try {

            tx.begin();

            Query query = session.createQuery("FROM userModel where id=:id");

            query.setParameter("id", id);
            userModel umds = (userModel) query.uniqueResult();
            tx.commit();
            return umds;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {

            session.close();

        }

        return null;

    }

    public boolean updateUser(userModel um) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction txu = session.getTransaction();
        try {
            txu.begin();
            session.update(um);
            txu.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            txu.rollback();
        } finally {

            session.close();
        }

        return false;

    }

    //DINAMIC login
    public userModel userLogin(userModel um) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            Query query = session.createQuery("FROM userModel where email=:email and password=:password");
            query.setParameter("email", um.getEmail());
            query.setParameter("password", um.getPassword());

            userModel umd = (userModel) query.uniqueResult();
            return umd;

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }

        return null;
    }
    
    //user email chk
    
    public userModel userEmailCheck(userModel um) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            Query query = session.createQuery("FROM userModel where email=:email");
            query.setParameter("email", um.getEmail());

            userModel umd = (userModel) query.uniqueResult();
            return umd;

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }

        return null;
    }
}
