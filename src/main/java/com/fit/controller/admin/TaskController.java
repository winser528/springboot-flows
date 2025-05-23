package com.fit.controller.admin;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.fit.config.shiro.UserManager;
import com.fit.service.FlowManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.snaker.engine.access.Page;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.HistoryOrder;
import org.snaker.engine.entity.Task;
import org.snaker.engine.entity.WorkItem;
import org.snaker.engine.model.TaskModel.TaskType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Snaker流程引擎常用Controller
 *
 * @author yuqs
 * @since 0.1
 */
@Slf4j
@Controller
@RequestMapping(value = "admin/snaker/task")
public class TaskController {

    @Autowired
    private FlowManager flowManager;
    @Autowired
    private UserManager userManager;

    @RequestMapping(value = "active", method = RequestMethod.GET)
    public String homeTaskList(Model model) {
        List<String> list = new LinkedList<>();
        list.add(userManager.getUsername());
        // log.info(list.toString());
        String[] assignees = new String[list.size()];
        list.toArray(assignees);
        Page<WorkItem> majorPage = new Page<WorkItem>(5);
        Page<WorkItem> aidantPage = new Page<WorkItem>(3);
        Page<HistoryOrder> ccorderPage = new Page<HistoryOrder>(3);
        List<WorkItem> majorWorks = flowManager.getEngine().query().getWorkItems(majorPage, new QueryFilter().setOperators(assignees).setTaskType(TaskType.Major.ordinal()));
        List<WorkItem> aidantWorks = flowManager.getEngine().query().getWorkItems(aidantPage, new QueryFilter().setOperators(assignees).setTaskType(TaskType.Aidant.ordinal()));
        List<HistoryOrder> ccWorks = flowManager.getEngine().query().getCCWorks(ccorderPage, new QueryFilter().setOperators(assignees).setState(1));

        model.addAttribute("majorWorks", majorWorks);
        model.addAttribute("majorTotal", majorPage.getTotalCount());
        model.addAttribute("aidantWorks", aidantWorks);
        model.addAttribute("aidantTotal", aidantPage.getTotalCount());
        model.addAttribute("ccorderWorks", ccWorks);
        model.addAttribute("ccorderTotal", ccorderPage.getTotalCount());
        return "admin/flow/task_active";
    }

    /**
     * 根据当前用户查询待办任务列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String userTaskList(Model model, Page<WorkItem> page) {
        flowManager.getEngine().query().getWorkItems(page, new QueryFilter().setOperator(userManager.getUsername()));
        model.addAttribute("page", page);
        return "snaker/userTask";
    }

    @RequestMapping(value = "actor/add", method = RequestMethod.GET)
    public String addTaskActor(Model model, String orderId, String taskName) {
        model.addAttribute("orderId", orderId);
        model.addAttribute("taskName", taskName);
        return "snaker/actor";
    }

    @RequestMapping(value = "actor/add", method = RequestMethod.POST)
    @ResponseBody
    public String addTaskActor(Model model, String orderId, String taskName, String operator) {
        List<Task> tasks = flowManager.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        for (Task task : tasks) {
            if (task.getTaskName().equalsIgnoreCase(taskName) && StringUtils.isNotEmpty(operator)) {
                flowManager.getEngine().task().addTaskActor(task.getId(), operator);
            }
        }
        return "success";
    }

    @RequestMapping(value = "tip", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> addTaskActor(String orderId, String taskName) {
        List<Task> tasks = flowManager.getEngine().query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        StringBuilder builder = new StringBuilder();
        String createTime = "";
        for (Task task : tasks) {
            if (task.getTaskName().equalsIgnoreCase(taskName)) {
                String[] actors = flowManager.getEngine().query().getTaskActorsByTaskId(task.getId());
                for (String actor : actors) {
                    builder.append(actor).append(",");
                }
                createTime = task.getCreateTime();
            }
        }
        if (builder.length() > 0) {
            builder.deleteCharAt(builder.length() - 1);
        }
        Map<String, String> data = new HashMap<String, String>();
        data.put("actors", builder.toString());
        data.put("createTime", createTime);
        return data;
    }

    /**
     * 活动任务查询列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "active/more", method = RequestMethod.GET)
    public String activeTaskList(Model model, Page<WorkItem> page, Integer taskType) {
        // List<String> list = userManager.getGroups();
        // list.add(userManager.getUsername());
        // log.info(list.toString());
        // String[] assignees = new String[list.size()];
        // list.toArray(assignees);
        // flowManager.getEngine().query().getWorkItems(page,
        // new QueryFilter().setOperators(assignees).setTaskType(taskType));
        // model.addAttribute("page", page);
        // model.addAttribute("taskType", taskType);
        log.info("活动任务查询列表");
        return "snaker/activeTaskMore";
    }

    /**
     * 活动任务查询列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "active/ccmore", method = RequestMethod.GET)
    public String activeCCList(Model model, Page<HistoryOrder> page) {
        // List<String> list = userManager.getGroups();
        // list.add(userManager.getUsername());
        // log.info(list.toString());
        // String[] assignees = new String[list.size()];
        // list.toArray(assignees);
        // flowManager.getEngine()
        // .query()
        // .getCCWorks(page, new QueryFilter()
        // .setOperators(assignees)
        // .setState(1));
        // model.addAttribute("page", page);
        return "snaker/activeCCMore";
    }

    /**
     * 测试任务的执行
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "exec", method = RequestMethod.GET)
    public String activeTaskExec(Model model, String taskId) {
        flowManager.execute(taskId, userManager.getUsername(), null);
        return "redirect:/snaker/task/active";
    }

    /**
     * 活动任务的驳回
     *
     * @param model
     * @param taskId
     * @return
     */
    @RequestMapping(value = "reject", method = RequestMethod.GET)
    public String activeTaskReject(Model model, String taskId) {
        String error = "";
        try {
            flowManager.executeAndJump(taskId, userManager.getUsername(), null, null);
        } catch (Exception e) {
            error = "?error=1";
        }
        return "redirect:/snaker/task/active" + error;
    }

    /**
     * 历史完成任务查询列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "history", method = RequestMethod.GET)
    public String historyTaskList(Model model, Page<WorkItem> page) {
        flowManager.getEngine().query().getHistoryWorkItems(page, new QueryFilter().setOperator(userManager.getUsername()));
        model.addAttribute("page", page);
        return "snaker/historyTask";
    }

    /**
     * 历史任务撤回
     *
     * @param taskId
     * @return
     */
    @RequestMapping(value = "undo", method = RequestMethod.GET)
    public String historyTaskUndo(Model model, String taskId) {
        String returnMessage = "";
        try {
            flowManager.getEngine().task().withdrawTask(taskId, userManager.getUsername());
            returnMessage = "任务撤回成功.";
        } catch (Exception e) {
            returnMessage = e.getMessage();
        }
        model.addAttribute("returnMessage", returnMessage);
        return "redirect:/snaker/task/history";
    }
}
