package lab.task.manager.dao;

import lab.task.manager.entity.Task;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Andrew
 */
public interface ITaskDao<T extends Serializable> {

    void save(Task task);

    List<Task> findAll();

    Task findByName(String taskName, String taskDescription);

    List<Task> findByFirstName(String taskName);
}
