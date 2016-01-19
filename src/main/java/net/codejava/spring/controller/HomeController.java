package net.codejava.spring.controller;

import java.util.List;
import java.util.Locale;

//import net.codejava.spring.dao.UserDAO;
import net.codejava.spring.service.UserService;
import net.codejava.spring.model.User;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */
@Controller
@Scope("session")
public class HomeController {
	
	@Autowired
	private User LoggedInUser;
	
	//Logger
	private static final Logger logger = Logger.getLogger(HomeController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value={"/"})
	public ModelAndView loginPage(String message) {
		ModelAndView model = new ModelAndView("login");
		
		if (message!=null) 
			model.addObject("message", message);
		
		model.addObject("user", new User());
		return model;
	}
	
	@RequestMapping(value={"/user/list"})
	public ModelAndView homePage(String message) {
		if (!checkLoggedIn()) return loginPage();
		
		List<User> listUsers = userService.findAllUsers();
		ModelAndView model = new ModelAndView("user_list");
		if (listUsers!=null) 
			model.addObject("userList", listUsers);

		if (message!=null)
			model.addObject("message", message);
		if(LoggedInUser!=null)
			logger.info("Logged in Name = "+LoggedInUser.getUsername());
		logger.info("User List count="+listUsers.size());
		return model;
	}

	@RequestMapping(value="/user/add")
	public ModelAndView addUserPage() {
		if (!checkLoggedIn()) return loginPage();
		
		ModelAndView modelAndView = new ModelAndView("user_new");
		modelAndView.addObject("user", new User());
		modelAndView.addObject("action", "/user/add/process");
		return modelAndView;
	}
	
	@RequestMapping(value="/user/add/process",  method = RequestMethod.POST)
	public ModelAndView addingUser(@ModelAttribute User user) {
		if (!checkLoggedIn()) return loginPage();
		
		if (userService.findUserbyEmail(user.getEmail())!=null)
		{
			String message = user.getEmail() + " is duplicate";
			logger.info(message);
			ModelAndView modelAndView = new ModelAndView("user_new");
			modelAndView.addObject("user", user);
			modelAndView.addObject("message", message);
			return modelAndView;
		}
		logger.info("Adding User");
		userService.saveUser(user);
		String message = "User " + user.getUsername() + " was successfully added.";
		return homePage(message);
	}
	
	@RequestMapping(value="/user/delete/{id}", method=RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable Integer id) {
		if (!checkLoggedIn()) return loginPage();
		
		logger.info("Delete User "+id);
		userService.deleteUser(id);
		String message = "User was successfully deleted.";
		return homePage(message);
	}
	
	// * This method will provide the medium to update an existing employee.
	@RequestMapping(value="/user/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable Integer id) {
		if (!checkLoggedIn()) return loginPage();
		
		ModelAndView modelAndView = new ModelAndView("user_new");
		User user = userService.findById(id);
		modelAndView.addObject("user", user);
		modelAndView.addObject("edit", true);
		modelAndView.addObject("action", "/user/edit/process");
		return modelAndView;
	}
	
	// * This method will be called on form submission, handling POST request for
	// * updating employee in database. It also validates the user input		 
	@RequestMapping(value = { "/user/edit/process" }, method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute User user) 
	{
		if (!checkLoggedIn()) return loginPage();
		logger.info("Editing User");
		userService.updateUser(user, false);
		String message = "User " + user.getUsername() + " was successfully updated.";
		return homePage(message);
	}
	
	@RequestMapping("/login")
	public ModelAndView loginPage() {
		LoggedInUser = null;
		return loginPage("");
	}
	
	// * This method will be called on form submission, handling POST request for
	// * updating employee in database. It also validates the user input		 
	@RequestMapping(value = { "/login/process" }, method = RequestMethod.POST)
	public ModelAndView loginProcesss(@ModelAttribute User user) 
	{
	 	logger.info("Authenticating User = "+user.getEmail() + ", Password = "+user.getPassword());
	 	User finduser = userService.findUserbyEmail(user.getEmail());
	 	String message="";
	 	boolean login_ok = true;
	 	if (finduser==null)
	 	{
	 		message = "Cannot find user "+user.getEmail();
	 		login_ok = false;	
	 	}
	 	else {
	 		if (finduser.getPassword().compareTo(user.getPassword())!=0)
	 		{
	 			message = "Wrong password for user "+user.getEmail();
	 			login_ok = false;
	 		}
	 		else
	 		{
	 			LoggedInUser = finduser;
	 		}
	 	}
	 	
	 	if(!login_ok)
	 	{
	 		logger.info(message);
	 		return loginPage(message);
	 	}

	 	return homePage("");
	}
	
	private boolean checkLoggedIn()
	{
		if ((LoggedInUser==null) || (LoggedInUser.getUsername()==null))
		{
			logger.info("checkLoggedIn::Not Logged In");
			return false;
		}
		return true;
	}
}
