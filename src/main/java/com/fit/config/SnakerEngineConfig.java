package com.fit.config;

import com.fit.dao.Hibernate4Access;
import org.snaker.engine.access.dialect.MySqlDialect;
import org.snaker.engine.cache.CacheManager;
import org.snaker.engine.cache.memory.MemoryCacheManager;
import org.snaker.engine.core.*;
import org.snaker.engine.impl.LogInterceptor;
import org.snaker.engine.impl.SurrogateInterceptor;
import org.snaker.engine.spring.SpelExpression;
import org.snaker.engine.spring.SpringSnakerEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/3/26
 */
@Configuration
public class SnakerEngineConfig {

    @Autowired
    private org.hibernate.SessionFactory sessionFactory;

    @Bean
    public SpringSnakerEngine snakerEngine(ProcessService processService, OrderService orderService, TaskService taskService, QueryService queryService, ManagerService managerService) {
        SpringSnakerEngine engine = new SpringSnakerEngine();
        engine.setProcessService(processService);
        engine.setOrderService(orderService);
        engine.setTaskService(taskService);
        engine.setQueryService(queryService);
        engine.setManagerService(managerService);
        return engine;
    }

    @Bean
    public Hibernate4Access dbAccess() {
        Hibernate4Access access = new Hibernate4Access();
        access.setSessionFactory(sessionFactory);
        return access;
    }

    @Bean
    public ProcessService processService(Hibernate4Access dbAccess, CacheManager cacheManager) {
        ProcessService service = new ProcessService();
        service.setAccess(dbAccess);
        service.setCacheManager(cacheManager);
        return service;
    }

    @Bean
    public OrderService orderService(Hibernate4Access dbAccess) {
        OrderService service = new OrderService();
        service.setAccess(dbAccess);
        return service;
    }

    @Bean
    public TaskService taskService(Hibernate4Access dbAccess) {
        TaskService service = new TaskService();
        service.setAccess(dbAccess);
        return service;
    }

    @Bean
    public ManagerService managerService(Hibernate4Access dbAccess) {
        ManagerService service = new ManagerService();
        service.setAccess(dbAccess);
        return service;
    }

    @Bean
    public QueryService queryService(Hibernate4Access dbAccess) {
        QueryService service = new QueryService();
        service.setAccess(dbAccess);
        return service;
    }

    @Bean
    public CacheManager snakerCacheManager() {
        return new MemoryCacheManager();
    }

    /**
     * 配置 MySQL 方言
     */
    @Bean
    public MySqlDialect mySqlDialect() {
        return new MySqlDialect();
    }

    /**
     * 日志拦截器
     */
    @Bean
    public LogInterceptor logInterceptor() {
        return new LogInterceptor();
    }

    /**
     * Spring EL 表达式支持
     */
    @Bean
    public SpelExpression spelExpression() {
        return new SpelExpression();
    }

    /**
     * 委托拦截器
     */
    @Bean
    public SurrogateInterceptor surrogateInterceptor() {
        return new SurrogateInterceptor();
    }
}