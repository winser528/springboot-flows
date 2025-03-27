package com.fit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.fit", "org.snaker"})
public class FlowsApplication {

    public static void main(String[] args) {
        SpringApplication.run(FlowsApplication.class, args);
    }

}