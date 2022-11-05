package com.gl.student.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gl.student.entity.Student;
import com.gl.student.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	StudentService studentServiceImpl;

	

	@RequestMapping("/save")
	public String save(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("course") String course,
			@RequestParam("country") String country) {
		Student student;
		if (id != 0) {
			student = studentServiceImpl.findById(id);
			student.setFirstName(firstName);
			student.setLastName(lastName);
			student.setCourse(course);
			student.setCountry(country);
		} else {
			student = new Student(firstName, lastName, course, country);
		}
		studentServiceImpl.save(student);
		return "redirect:/student/list";
	}
	
	@RequestMapping("/list")
	public String listStudents(Model model) {
		List<Student> students = studentServiceImpl.findAll();
		model.addAttribute("Students", students);
		return "student-list";
	}

	@RequestMapping("/showFormAdd")
	public String showFormForAdd(Model model) {
		Student student = new Student();
		model.addAttribute("Student", student);
		return "student-display";
	}

	@RequestMapping("/showFormUpdate")
	public String showFormForUpdate(@RequestParam("studentId") int id, Model model) {
		Student student = studentServiceImpl.findById(id);
		model.addAttribute("Student", student);
		return "student-display";
	}


	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int id) {
		studentServiceImpl.deleteById(id);
		return "redirect:/student/list";
	}

	@RequestMapping(value = "/403")
	public ModelAndView accessDenied(Principal user) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", "You dont have necessary permissions to access this page");
		modelAndView.setViewName("error-403");
		return modelAndView;

	}

}
