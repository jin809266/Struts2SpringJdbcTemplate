package com.lin.user.dao.impl;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import com.lin.user.dao.UserDao;
import com.lin.user.model.UserVo;

public class UserDaoImpl implements UserDao {
	private JdbcTemplate jdbcTemplate;

	@Override
	// @SuppressWarnings({"unchecked"}) --> 抑制單一類型的警告
	@SuppressWarnings({ "unchecked", "rawtypes" }) // 抑制多類型的警告
	public UserVo queryByEname(String ename) {
		String sql = "SELECT * FROM EMP2 WHERE ENAME = ?";
		// queryForObject方法需要三個參數 -- > 1.SQL-Syntax 2.new
		// Object[]{前台傳遞parameter參數} 3.The simplest solution(最簡單的解決方案)-->new
		// BeanPropertyRowMapper(回傳型態.class)
		// queryForObject方法第三個參數 -->如果直接寫String.class or Integer.class
		// 是可以的，因dbcTemplate判讀知道JVM反射機制快照
		// queryForObject方法第三個參數 -->若直接回傳型態.class 會噴exception expected 1 actual
		// 6 因為JdbcTemplate的反射機制無法直接判讀JVM快照
		try {
			UserVo userDto = (UserVo) jdbcTemplate.queryForObject(sql, new Object[] { ename },
					new BeanPropertyRowMapper(UserVo.class));
			return userDto;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	/**
	 * queryForObject 另類寫法 需要額外撰寫一隻類別實作RowMapper的mapRow方法 方法內需撰寫你將要回傳的型態物件
	 * 以下為官方網站的範例 public class CustomerRowMapper implements RowMapper{ public
	 * Object mapRow(ResultSet rs, int rowNum) throws SQLException { Customer
	 * customer = new Customer(); customer.setCustId(rs.getInt("CUST_ID"));
	 * customer.setName(rs.getString("NAME"));
	 * customer.setAge(rs.getInt("AGE")); return customer; } } Pass it to
	 * queryForObject() method, the returned result will call your custom
	 * mapRow() method to match the value into the properly. // the returned
	 * result will call your custom mapRow() method to match the value into the
	 * properly 表示最後會依照撰實作RowMapper的類別內mapRow方法 將值塞入ValueObject的property內 public
	 * Customer findByCustomerId(int custId){
	 * 
	 * String sql = "SELECT * FROM CUSTOMER WHERE CUST_ID = ?";
	 * 
	 * Customer customer = (Customer)getJdbcTemplate().queryForObject(sql, new
	 * Object[] { custId }, new CustomerRowMapper());
	 * 
	 * return customer; }
	 **/

	@Override
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<UserVo> queryByJob(String job) {
		String sql = "SELECT * FROM EMP2 WHERE JOB = ?";
		try {
			List<UserVo> list = (List<UserVo>) jdbcTemplate.query(sql, new Object[] { job },
					new BeanPropertyRowMapper(UserVo.class));
			return list;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public void deleteByDeptNo(String deptno) {
		String sql = "DELETE FROM EMP2 WHERE DEPTNO = ?";
		jdbcTemplate.update(sql, new Object[] { deptno });
	}

	@Override
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public UserVo queryBySal(String sal) {
		String sql = "SELECT * FROM EMP2 WHERE SAL = ?";
		try {
			UserVo userDto = (UserVo) jdbcTemplate.queryForObject(sql, new Object[] { sal },
					new BeanPropertyRowMapper(UserVo.class));
			return userDto;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
