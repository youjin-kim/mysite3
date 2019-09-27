package kr.co.itcen.mysite.repository;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.mysite.exception.UserDaoException;
import kr.co.itcen.mysite.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;
	
	public Boolean insert(UserVo vo) throws UserDaoException {
		int count = sqlSession.insert("user.insert", vo);
		return count == 1;
	}
	
	public UserVo get(UserVo vo) {
		UserVo result = sqlSession.selectOne("user.getByEmailAndPassword1", vo);
		return result;
	}
	
	public UserVo get(String email, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", password);
		
		UserVo result = sqlSession.selectOne("user.getByEmailAndPassword2", map);
		return result;
	}

	public UserVo get(Long no) {
		/*Map<String, Long> map = new HashMap<String, Long>();
		map.put("no", no);
		UserVo result = sqlSession.selectOne("user.getByNo", map);
		return result;*/
		
		return sqlSession.selectOne("user.getByNo", no);
	}

	
	public Boolean update(UserVo vo ) {
		int count = sqlSession.update("user.update", vo);
		return count == 1;
	}

}
