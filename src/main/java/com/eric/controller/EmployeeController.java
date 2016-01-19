package com.eric.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.eric.model.Employee;
import com.eric.service.EmployeeService;

@Controller
public class EmployeeController {
	//Logger
	private static final Logger logger = Logger.getLogger(EmployeeController.class);
		
	@Autowired
	EmployeeService service;
	
    @RequestMapping(value="/employee/list")
	public ModelAndView listOfTeams() {
    	//System.out.println("AppController::List Employee");
		ModelAndView modelAndView = new ModelAndView("allemployees");
		List<Employee> list = service.findAllEmployees();
		//System.out.println("Employee = " + list.size());
		logger.info("Employee Size = " + list.size());
		//modelAndView.addObject("name", "eric");
		modelAndView.addObject("employees", list);

		return modelAndView;
	}
    
  
}
