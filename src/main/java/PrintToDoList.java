import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;

public class PrintToDoList
{
    /**
     * Method for printing the to-do list to the console
     * @param entityManager The database connection used for storing the user's items.
     */
    public void PrintList (EntityManager entityManager)
    {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<ToDo> query = builder.createQuery(ToDo.class);
        Root<ToDo> root = query.from(ToDo.class);
        query.select(root);
        Query q = entityManager.createQuery(query);
        List<ToDo> toDoList = q.getResultList();

        System.out.println("To-Do List:");
        System.out.println("ID\t| To-Do List Item");
        System.out.println("***************************");

        // Loop through the map and print each item and key
        for(ToDo i:toDoList)
        {
            System.out.println(i.getId() + "\t| " + i.getToDoItem());
        }
    }
}
