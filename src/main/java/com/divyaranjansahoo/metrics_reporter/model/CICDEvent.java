package com.divyaranjansahoo.metrics_reporter.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.Instant;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CICDEvent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String repo;
    private String branch;
    private String status; // success/failure
    private String trigger; // push/pr
    private Instant timestamp;
    private double duration;
    private String commitId;
    private String author;

}
