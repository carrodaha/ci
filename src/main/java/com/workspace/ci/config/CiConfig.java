package com.workspace.ci.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * Created by yujie on 2017/6/30.
 */
@Component
@ConfigurationProperties(prefix = "config")
@PropertySource("classpath:/config/config.properties")
public class CiConfig {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
