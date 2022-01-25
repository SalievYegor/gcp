package com.hkb.gcp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello-world")
    public String helloWorld() {
        return "hello idi nahuy";
    }

    @GetMapping("/")
    public String start() {
        return "pizduy na /hello-world";
    }
}
