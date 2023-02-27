package com.angu.bs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BsApplication {

    public static void main(String[] args) {

        System.exit(SpringApplication.exit(SpringApplication.run(BsApplication.class, args)));
    }

    private static void printArgs(String[] args) {
        for (int i = 0; i < args.length; i++) {
            System.out.println(i + ":[" + args[i] + "]");
        }
    }

}
