package Member;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MemberDAO extends JDBConnect{
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	public MemberDTO InsertUser(String userId, String userPass) {
		MemberDTO dto = new MemberDTO();
		try {
			String query = "INSERT INTO member(userid, pass) VALUES(?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, userPass);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setUserID(userId);
				dto.setUserPass(userPass);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public MemberDTO SelectUser(String userId, String userPass) {
		MemberDTO dto = new MemberDTO();
		
		try {
			String query = "select * from member where userid = ? and pass = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, userPass);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setUserID(userId);
				dto.setUserPass(userPass);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
