package com.eric.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import com.eric.model.Employee;
import com.eric.model.User;

@Controller
public class AppController {

	//Logger
	private static final Logger logger = Logger.getLogger(EmployeeController.class);
		
	@RequestMapping("/about")
	public ModelAndView welcomeMessage(
			@RequestParam(value = "name", required = false) String name) {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("about");
		view.addObject("name", name);
		return view;
	}
	
	@RequestMapping("/login")
	public ModelAndView loginPage() {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("login");
		//view.addObject("name", name);
		return view;
	}
	
	// * This method will be called on form submission, handling POST request for
	// * updating employee in database. It also validates the user input		 
	@RequestMapping(value = { "/login/process" }, method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute User user) 
	{
	 	logger.info("Authenticating User "+user.getEmail());
	 	//userService.updateUser(user, false);
	 	//String message = "User " + user.getUsername() + " was successfully updated.";
	    ModelAndView view = new ModelAndView("about");
	 	return view;
	}	
	
}