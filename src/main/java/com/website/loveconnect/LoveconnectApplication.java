package com.website.loveconnect;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class LoveconnectApplication {

	public static void main(String[] args) {
		SpringApplication.run(LoveconnectApplication.class, args);
	}

}
