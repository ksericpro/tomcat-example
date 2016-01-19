package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.User;

public interface UserDAO {
	User findById(int id);

	void saveUser(User user);
	
	void deleteUser(int id);
	
	List<User> list();
	
	User findUserbyEmail(String email);
}
