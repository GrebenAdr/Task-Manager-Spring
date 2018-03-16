package lab.task.manager.controller;

import lab.task.manager.dao.ITaskDao;
import lab.task.manager.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Andrew
 */

@Controller
@RequestMapping("task")
public class TaskController {
    
    @Autowired
    private ITaskDao dao;
    
    @RequestMapping("/home")
    public ModelAndView home(ModelMap model) {
        model.put("tasks", dao.findAll());
        return new ModelAndView("task", model);
    }
    
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Task saveTask(Task task) {
        dao.save(task);
        
        return task;
    }
    
    @RequestMapping(value = "/getJSON/{taskName}/{taskDescription}", method = RequestMethod.GET)
    @ResponseBody
    public Task findByName(@PathVariable("taskName") String tName, @PathVariable("taskDescription") String tDescription) {
        Task task = dao.findByName(tName, tDescription);
        return task;
    }
    
    @RequestMapping(value = "/load", method = RequestMethod.GET)
    public ModelAndView load() {
        return new ModelAndView("/table");
    }
    
    @RequestMapping(value = "/load/{taskName}", method = RequestMethod.GET)
    public ModelAndView loadByName(@PathVariable("taskName") String taskName, ModelMap model) {
        model.put("tasks", dao.findByFirstName(taskName));
        return new ModelAndView("/search", model);
    }
}
