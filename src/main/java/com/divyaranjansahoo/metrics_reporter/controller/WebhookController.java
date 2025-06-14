package com.divyaranjansahoo.metrics_reporter.controller;

import com.divyaranjansahoo.metrics_reporter.model.CICDEvent;
import com.divyaranjansahoo.metrics_reporter.repository.BuildEventRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.Map;

@RestController
@RequestMapping("/webhook")
@RequiredArgsConstructor
public class WebhookController {

    private final BuildEventRepository repository;

    @PostMapping("/github")
    public String receiveWebhook(@RequestBody Map<String, Object> payload) {

        // Simplified version. You'll later map full GitHub payload structure.
        CICDEvent event = CICDEvent.builder()
                .repo("test-repo")
                .branch("main")
                .status("success")
                .trigger("push")
                .timestamp(Instant.now())
                .duration(25.0)
                .build();

        repository.save(event);
        return "Webhook Received";
    }
}
