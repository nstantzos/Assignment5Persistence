import javax.persistence.EntityManager;
import java.util.Map;

public class AddToList
{
    /**
     * Method for adding strings to the to-do list. The primary key is updated here with each added item
     * @param itemToAdd The user defined string to be added to the to-do list.
     * @param entityManager The database connection used for storing the user's items.
     * @param itemKey The primary key identifier for each to do list item.
     * @return
     */
    public int AddItemToList(String itemToAdd, EntityManager entityManager, int itemKey)
    {
        // Add the primary key and the to do item
        ToDo itemAddition = new ToDo();
        itemAddition.setToDoItem(itemToAdd);
        itemAddition.setItemID(itemKey);

        // Add item to database
        entityManager.persist(itemAddition);
        entityManager.getTransaction().commit();
        entityManager.getTransaction().begin();

        //userList.put(itemKey,itemToAdd);

        // Increment and return the primary key so that each item gets a unique key
        itemKey++;
        return itemKey;
    }

}
