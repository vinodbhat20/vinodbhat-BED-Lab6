package com.gl.student.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gl.student.entity.Student;
import com.gl.student.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentRepository studentRepository;

	@Override
	public Student findById(int id) {
		return studentRepository.findById(id).get();
	}

	@Override
	public List<Student> findAll() {
		return studentRepository.findAll();
	}

	@Override
	public void save(Student student) {
		studentRepository.save(student);
	}

	@Override
	public void deleteById(int id) {
		studentRepository.deleteById(id);
	}

}
