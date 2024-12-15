package com.kubeforce.scdfrabbitfunction;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.function.Function;

public class SenderFunction implements Function<String,String> {
    @Autowired
    private QueueSender queueSender;
    @Override
    public String apply(String s) {
        queueSender.send("Vehicle:SUV,Make:Ford,Model:Edge,Year:2021");
        return "ok. done";
    }
}
