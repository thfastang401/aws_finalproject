package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication //내가 설정클래스 파일 + 스프링시작 tomcat시작
@ComponentScan
@ComponentScan(basePackages = {"upload","board.spring.mybatis"})
@ComponentScan(basePackages = "dbsecure")
@ComponentScan(basePackages = "spring.mybatis")
//@ComponentScan(basePackages = "websocket")
@MapperScan(basePackages = {"spring.mybatis","board.spring.mybatis"})
public class SecondApplication {

	public static void main(String[] args) {
	//	User user = new User();
		SpringApplication.run(SecondApplication.class, args);
	}

}


 

