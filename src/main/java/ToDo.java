import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ToDoList")
public class ToDo
{
    // Primary key for each object in the database. Automatically increments
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    // To do list item itself, stored as a string
    @Column(name = "ToDoItem")
    private String toDoItem;

    // ID associated with each item in the list
    @Column(name = "itemID")
    private Integer itemID;

    // Getter and Setter methods
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getToDoItem()
    {
        return toDoItem;
    }

    public void setToDoItem(String toDoItem) {
        this.toDoItem = toDoItem;
    }

    public Integer getItemID() {
        return itemID;
    }

    public void setItemID(Integer itemID) {
        this.itemID = itemID;
    }
}