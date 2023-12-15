package Board;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	public BoardDTO Wirte(String userId, String content, String date, String title) {
		BoardDTO dto = new BoardDTO();

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			java.util.Date parsedDate = sdf.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

			String query = "INSERT INTO board VALUES (?, ?, TO_DATE(?, 'yy/mm/dd'), ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, content);
			psmt.setDate(3, sqlDate);
			psmt.setString(4, title);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setUserID(userId);
				dto.setContent(content);
				dto.setDate(sqlDate);
				dto.setTitle(title);
				dto.setDate(rs.getDate(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public BoardDTO UpdateWrite(String userId, String title, String upTitle, String content) {
		BoardDTO dto = new BoardDTO();

		try {
			String query = "UPDATE Board SET title = ?, content =? WHERE userID=? and title=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, upTitle);
			psmt.setString(2, content);
			psmt.setString(3, userId);
			psmt.setString(4, title);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setTitle(upTitle);
				dto.setContent(content);
				dto.setUpdate("(수정됨)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public ArrayList<BoardDTO> list(String userId, String date) throws ParseException {
		ArrayList<BoardDTO> list = new ArrayList<>();

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			java.util.Date parsedDate = sdf.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

			String query = "SELECT * FROM board WHERE TRUNC(writedate) = ? and userID=?";
			psmt = con.prepareStatement(query);
			psmt.setDate(1, sqlDate);
			psmt.setString(2, userId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setUserID(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setDate(rs.getDate(3));
				dto.setTitle(rs.getString(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public BoardDTO selectView(String userID, String date) {
		BoardDTO dto = new BoardDTO();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			java.util.Date parsedDate = sdf.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

			String query = "SELECT * FROM board WHERE TRUNC(writedate) = ? and userID=?";
			psmt = con.prepareStatement(query);
			psmt.setDate(1, sqlDate);
			psmt.setString(2, userID);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(2));
				dto.setDate(rs.getDate(3));
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public BoardDTO SelectDay(String date, String userId) {
		BoardDTO dto = new BoardDTO();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			java.util.Date parsedDate = sdf.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

			String query = "SELECT * FROM board WHERE TRUNC(writedate) = ? and userid=?";
			psmt = con.prepareStatement(query);
			psmt.setDate(1, sqlDate);
			psmt.setString(2, userId);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setUserID(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setDate(rs.getDate(3));
				dto.setTitle(rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public BoardDTO DeleteWrite(String date, String userId, String title) {
		BoardDTO dto = new BoardDTO();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			java.util.Date parsedDate = sdf.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

			String query = "delete board where userid = ? and title =?"
					+ " and writedate = TO_DATE(?, 'YY/MM/DD')";
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, title);
			psmt.setDate(3, sqlDate);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setUpdate(userId);
			}
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

}
