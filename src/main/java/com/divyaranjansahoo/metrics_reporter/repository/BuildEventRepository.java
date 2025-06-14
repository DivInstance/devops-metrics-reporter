package com.divyaranjansahoo.metrics_reporter.repository;

import com.divyaranjansahoo.metrics_reporter.model.CICDEvent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuildEventRepository extends JpaRepository<CICDEvent, Long> {
}
