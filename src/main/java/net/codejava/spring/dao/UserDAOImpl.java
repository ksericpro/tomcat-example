package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.User;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

public class UserDAOImpl extends AbstractDao<Integer, User>  implements UserDAO {
	private SessionFactory sessionFactory;

	public UserDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public List<User> list() {
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) sessionFactory.getCurrentSession()
				.createCriteria(User.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listUser;
	}
	
	public User findById(int id) {
		return getByKey(id);
	}

	public void saveUser(User employee) {
		persist(employee);
	}
	
	public void deleteUser(int id) {
		Query query = getSession().createSQLQuery("delete from Users where user_id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
	}

	public User findUserbyEmail(String email) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("email", email));
		return (User) criteria.uniqueResult();
	}
}
