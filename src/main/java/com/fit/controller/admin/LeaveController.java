package com.fit.controller.admin;

import com.fit.config.shiro.UserManager;
import com.fit.entity.User;
import com.fit.service.FlowManager;
import com.fit.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 请假流程Controller
 * 流程特点:多级审批流程、decision节点的表达式写法->${day > 2 ? 'transition5' : 'transition4'}
 * 业务数据:
 * 所有节点的业务数据均以json格式保存在order、task表的variable字段中
 * 建议业务数据以独立的表保存，通过orderId来关联
 *
 * @author yuqs
 * @since 0.1
 */
@Controller
@RequestMapping(value = "admin/flow/leave")
public class LeaveController {

    @Autowired
    private FlowManager facets;
    @Autowired
    private UserManager userManager;
    @Autowired
    private UserService userService;

    /**
     * 请假申请路由方法
     */
    @RequestMapping(value = "apply", method = RequestMethod.GET)
    public String apply(Model model, String processId, String orderId, String taskId, String taskName) {
        //将请求参数继续传递给视图页面
        model.addAttribute("processId", processId);
        model.addAttribute("orderId", orderId);
        model.addAttribute("taskId", taskId);
        //设置操作人为当前登录用户，请假流程演示时，将申请人、部门经理审批人、总经理审批人都设置为当前用户
        //可通过修改申请页面的部门经理、总经理输入框来改变下一步的处理人
        User user = userManager.getUser();
        model.addAttribute("operator", user.getUsername());
        model.addAttribute("operatorM", userService.findLeader(user.getId()).getUsername());
        //根据taskId是否为空来标识当前请求的页面是否为活动任务的节点页面
        if (StringUtils.isEmpty(orderId) || StringUtils.isNotEmpty(taskId)) {
            //如果实例id为空或者驳回情况下，返回apply.jsp
            return "admin/flow/leave/apply";
        } else {
            //如果orderId非空、taskId为空，则表示申请步骤已提交，此时可获取申请数据
            //由于请假流程中的业务数据，是保存在任务表的variable字段中，所以通过flowData方法获取
            //如果业务数据保存在业务表中，需要业务表的orderId字段来关联流程，进而根据orderId查询出业务数据
            model.addAllAttributes(facets.flowData(orderId, taskName));
            //返回申请的查看页面
            return "admin/flow/leave/applyView";
        }
    }

    /**
     * 部门经理审批路由方法
     */
    @RequestMapping(value = "approveDept", method = RequestMethod.GET)
    public String approveDept(Model model, String processId, String orderId, String taskId, String taskName) {
        model.addAttribute("processId", processId);
        model.addAttribute("orderId", orderId);
        model.addAttribute("taskId", taskId);
        if (StringUtils.isNotEmpty(taskId)) {
            return "admin/flow/leave/approveDept";
        } else {
            model.addAllAttributes(facets.flowData(orderId, taskName));
            return "admin/flow/leave/approveDeptView";
        }
    }

    /**
     * 总经理审批路由方法
     */
    @RequestMapping(value = "approveBoss", method = RequestMethod.GET)
    public String approveBoss(Model model, String processId, String orderId, String taskId, String taskName) {
        model.addAttribute("processId", processId);
        model.addAttribute("orderId", orderId);
        model.addAttribute("taskId", taskId);
        if (StringUtils.isNotEmpty(taskId)) {
            return "admin/flow/leave/approveBoss";
        } else {
            model.addAllAttributes(facets.flowData(orderId, taskName));
            return "admin/flow/leave/approveBossView";
        }
    }
}
