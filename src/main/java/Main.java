/*
Program written by Nick Stantzos, 9-27-2020
This program will allow the user to create a to-do list, add items to the list, remove items from the list, and print
the list to the console window. The to-do list will be sent to an SQL database and persisted after the program finishes
execution. The program is structured as having a Main.java class that begins a session with an SQL database, then
quickly passes control to a facade which then directs control to three different objects (depending on the user's
input). The console will continuously prompt the user for input until the exit key is specified. Each action that the
user can take (add or remove from the list) will commit an action to the SQL database. The database connection is only
closed when the exit action is taken by the user.
*/


import javax.persistence.*;

public class Main
{
    public static void main(String[] args)
    {
        // Initialize entity manager factory, entity manager, and connect to the database specified in persistence.xml
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("org.hibernate.tutorial.jpa");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        // Start new to-do list and initialize objects used to store and manage the list
        System.out.println("Starting a new to-do list.");

        // Pass the entity manager into the Facade object for database modifications
        // Control passes to this object, where user input is handled
        Facade manageUserList = new Facade(entityManager);

        System.out.println("A job well done!");

        // Committing the entity manager to the database to write the above client/bank object tables
        entityManager.getTransaction().commit();

        entityManagerFactory.close();
    }
}
