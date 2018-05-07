package kr.ac.hansung.cse.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import kr.ac.hansung.cse.model.User;

@Repository
public class UserDao {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<User> getUsers() {
		
		String sqlStatement = "select * from users"; // record -> object mapping
		return jdbcTemplate.query(sqlStatement, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				
				user.setToken(rs.getString("token"));
				
				return user;
			}

		});
	}
	
	public void insert(User user) {
		
		String token = user.getToken();
		
		String sqlstatement = "insert into users (token) values (?)";
				
		jdbcTemplate.update( sqlstatement, new Object[] {token} );
	}
}
