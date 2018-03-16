package lab.task.manager.dao;

import java.util.List;
import lab.task.manager.entity.Task;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Andrew
 */
@Repository
@Transactional
public class TaskDao implements ITaskDao<Task> {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Task task) {
        sessionFactory.getCurrentSession().save(task);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Task> findAll() {
        return sessionFactory.getCurrentSession().createCriteria(Task.class).list();
    }

    @Override
    public Task findByName(String taskName, String taskDescription) {
        return (Task) sessionFactory.getCurrentSession().createCriteria(Task.class)
                .add(Restrictions.eq("taskName", taskName).ignoreCase())
                .add(Restrictions.eq("taskDescription", taskDescription).ignoreCase())
                .uniqueResult();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Task> findByFirstName(String taskName) {
        return sessionFactory.getCurrentSession().createCriteria(Task.class)
                .add(Restrictions.like("taskName", taskName + "%").ignoreCase())
                .list();
    }

}
