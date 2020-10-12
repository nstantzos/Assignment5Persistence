package mypackage.jsp;

import javax.persistence.EntityManager;

public class WebFacade
{
    /**
     * Facade accepts a Map of type Integer,String as the to-do list.
     * @param entityManager The database connection used for storing the user's items. This connection
     *                      gets passed to all other objects.
     */
    public WebFacade(EntityManager entityManager)
    {
        // Initialize the object's primary key
        int itemKey = 1;
        System.out.println("I'm in the WebFacade class now.");

        // Pass the primary key and connection to the input handler method
        //ParseUserInput(entityManager, itemKey);
    }
}
