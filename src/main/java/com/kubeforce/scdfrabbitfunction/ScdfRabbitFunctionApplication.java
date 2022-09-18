package com.kubeforce.scdfrabbitfunction;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@EnableRabbit
@SpringBootApplication
public class ScdfRabbitFunctionApplication {


    public static void main(String[] args) {
        SpringApplication.run(ScdfRabbitFunctionApplication.class, args);


    }

}
