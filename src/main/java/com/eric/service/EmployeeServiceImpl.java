package com.eric.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.websystique.springmvc.dao.EmployeeDao;
import com.eric.model.Employee;
import com.eric.dao.EmployeeDao;

@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	//@Autowired
	//private EmployeeDao dao;
	
	public List<Employee> findAllEmployees() {
		//return dao.findAllEmployees();
		System.out.println("EmployeeServiceImpl::findAllEmployees");
		List<Employee> list = new ArrayList();
		Employee e = new Employee();
		e.setId(1);
		e.setName("Eric See");
		BigDecimal bg = BigDecimal.valueOf(9000);
		e.setSalary(bg);
		e.setSsn("S7521381F");
		list.add(e);
		
		e = new Employee();
		e.setId(1);
		e.setName("Fiona Teo");
		bg = BigDecimal.valueOf(13);
		e.setSalary(bg);
		e.setSsn("S7612431J");
		list.add(e);
		return list;		
	}

}
