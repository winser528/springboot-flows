package com.fit.config;

import org.hibernate.FlushMode;
import org.hibernate.SessionFactory;
import org.springframework.aop.framework.autoproxy.BeanNameAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/3/26
 */
@Configuration
public class HibernateConfig {

    private static final String PROPAGATION_REQUIRED = "PROPAGATION_REQUIRED,-Throwable";
    private static final String PROPAGATION_REQUIRED_READ = "PROPAGATION_REQUIRED,-Throwable,readOnly";
    private static final String[] REQUIRED_RULE_TRANSACTION = {"add*", "create*", "del*", "insert*", "update*", "*"};
    private static final String[] READ_RULE_TRANSACTION = {"count*", "find*", "get*", "query*", "select*"};

    @Bean
    public LocalSessionFactoryBean sessionFactory(DataSource dataSource) {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setPackagesToScan("com.fit.entity", "org.snaker.engine.entity"); // 替换为你的实体类包
        Properties hibProp = new Properties();
        hibProp.put("hibernate.current_session_context_class", "org.springframework.orm.hibernate5.SpringSessionContext");
        hibProp.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        hibProp.put("hibernate.format_sql", "true");
        hibProp.put("hibernate.hbm2ddl.auto", "update");
        hibProp.put("hibernate.query.sql.jdbc_style_params_base", "update");
        hibProp.put("hibernate.show_sql", "true");
        sessionFactory.setHibernateProperties(hibProp);

        return sessionFactory;
    }

    @Bean
    public PlatformTransactionManager transactionManager(SessionFactory sessionFactory) {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory);
        return transactionManager;
    }

    /**
     * aop
     *
     * @param platformTransactionManager 自动注入 无需手动
     * @return
     */
    @Bean(name = "customTransactionInterceptor")
    public TransactionInterceptor transactionInterceptor(PlatformTransactionManager platformTransactionManager) {
        TransactionInterceptor interceptor = new TransactionInterceptor();
        Properties properties = new Properties();
        for (String s : REQUIRED_RULE_TRANSACTION) {
            properties.setProperty(s, PROPAGATION_REQUIRED);
        }
        for (String s : READ_RULE_TRANSACTION) {
            properties.setProperty(s, PROPAGATION_REQUIRED_READ);
        }
        interceptor.setTransactionManager(platformTransactionManager);
        interceptor.setTransactionAttributes(properties);
        return interceptor;
    }

    @Bean
    public BeanNameAutoProxyCreator getBeanNameAutoProxyCreator() {
        BeanNameAutoProxyCreator proxyCreator = new BeanNameAutoProxyCreator();
        proxyCreator.setProxyTargetClass(true);
        proxyCreator.setBeanNames("*Service", "*Controller");
        proxyCreator.setInterceptorNames("customTransactionInterceptor");
        return proxyCreator;
    }
}