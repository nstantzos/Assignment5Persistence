package mypackage.jsp;

import javax.persistence.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PersistenceTest
{
    public static void WebMain()
    {
        // Initialize entity manager factory, entity manager, and connect to the database specified in persistence.xml
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        // Start new to-do list and initialize objects used to store and manage the list
        System.out.println("Starting a new to-do list.");

        // Pass the entity manager into the Facade object for database modifications
        // Control passes to this object, where user input is handled
        WebFacade manageUserList = new WebFacade(entityManager);

        System.out.println("A job well done!");

        // Committing the entity manager to the database to write the above client/bank object tables
        entityManager.getTransaction().commit();

        entityManagerFactory.close();
    }
}
