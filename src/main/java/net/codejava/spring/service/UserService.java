package net.codejava.spring.service;

import java.util.List;
import net.codejava.spring.model.User;

public interface UserService {

	User findById(int id);
	
	void saveUser(User user);
	
	void updateUser(User user, boolean update_password);
	
	void deleteUser(int id);

	List<User> findAllUsers(); 	
	
	User findUserbyEmail(String email);
	//boolean isUserEmailUnique(String email);
}
