package net.codejava.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.codejava.spring.dao.UserDAO;
import net.codejava.spring.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	public User findById(int id) {
		return dao.findById(id);
	}

	public void saveUser(User user) {
		dao.saveUser(user);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateUser(User user, boolean update_password) {
		User entity = dao.findById(user.getId());
		if(entity!=null){
			entity.setUsername(user.getUsername());
			entity.setEmail(user.getEmail());
			if (update_password)
				entity.setPassword(user.getPassword());
		}
	}

	public void deleteUser(int id) {
		dao.deleteUser(id);
	}
	
	public List<User> findAllUsers() {
		return dao.list();
	}

	public User findUserbyEmail(String email) {
		return dao.findUserbyEmail(email);
	}
//
//	public boolean isEmployeeSsnUnique(Integer id, String ssn) {
//		Employee employee = findEmployeeBySsn(ssn);
//		return ( employee == null || ((id != null) && (employee.getId() == id)));
//	}
	
}
