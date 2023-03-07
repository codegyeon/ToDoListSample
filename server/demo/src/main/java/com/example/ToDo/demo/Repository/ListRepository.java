package com.example.ToDo.demo.Repository;

import com.example.ToDo.demo.domain.Lists;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ListRepository extends JpaRepository<Lists , Long> {
}
