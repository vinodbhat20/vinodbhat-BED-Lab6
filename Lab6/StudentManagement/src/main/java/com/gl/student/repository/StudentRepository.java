package com.gl.student.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gl.student.entity.Student;


public interface StudentRepository extends JpaRepository<Student, Integer> {

}
