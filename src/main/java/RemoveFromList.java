import javax.persistence.EntityManager;
import java.util.Map;

public class RemoveFromList
{
    /**
     * Method for removing items from the to-do list
     * @param entityManager The database connection used for storing the user's items.
     * @param itemKey The primary key identifier for each to do list item.
     */
    public RemoveFromList(EntityManager entityManager, int itemKey)
    {
        // Use the item key to remove the to-do list item
        ToDo toDoToDelete = entityManager.find(ToDo.class, itemKey);
        //System.out.println("Deleting the item: " + toDoToDelete.getToDoItem());
        entityManager.remove(toDoToDelete);
        entityManager.getTransaction().commit();
        entityManager.getTransaction().begin();
        //userList.remove(itemKey);
    }

}
