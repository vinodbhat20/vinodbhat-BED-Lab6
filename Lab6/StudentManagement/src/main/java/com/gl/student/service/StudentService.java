package com.gl.student.service;

import java.util.List;

import com.gl.student.entity.Student;

public interface StudentService {
	
	public void save(Student student);

	public List<Student> findAll();

	public Student findById(int id);

	public void deleteById(int id);

}
