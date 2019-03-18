package bbs;

// (���� ������ ���� ��ü�� ����) ������ DB�� �����ؼ� � �����͸� ���� �� �ֵ��� �ϴ� ������ �ϴ� Ŭ����
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// �����ͺ��̽� ���� ��ü�� ���� (���������� �����ͺ��̽����� ȸ�� ������ �ҷ����ų� �ְ��� �� �� ���)
public class BbsDAO {
	// Ctrl+Shift+O ������ �Ʒ� ��ü �߰�
	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {
		try {
			//String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			//String dbID = "root";
			//String dbPassword = "root";
			
			String dbURL = "jdbc:mysql://localhost/ahndouzone?serverTimezone=UTC";
			String dbID = "ahndouzone";
			String dbPassword = "dlqtkwldnjsdyd12";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// �Խ��ǿ� ���� �ۼ��� �� ���� ������ �ð��� �����ͼ� �־���
	public String getDate() {
		String SQL = "SELECT NOW()";  // ���� �ð��� ������
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";  // �����ͺ��̽� ����
	}
	
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";  // ���� �ð��� ������
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù��° �Խù��� ���
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  // �����ͺ��̽� ����
	}
	
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());  //getNext() : �������� ������ �� �Խù� ��ȣ
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);  // 1: ������ �Ǹ� 0���� �ٲ�� �κ�
			return pstmt.executeUpdate();  // ���������� �����ߴٸ� 0�̻��� ����� ��ȯ
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  // �����ͺ��̽� ����
	}
	
	
	// Ư���� �������� ���� �� 10���� �Խñ��� ������
	public ArrayList<Bbs> getList(int pageNumber) {
		// bbsAvailable = 1 : ������ ���� �ʾƼ� Available�� 1�� �۸� ������
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);  
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;  // �Խñ� ����Ʈ 10�� �����ֱ�
	}
	
	
	// ����¡ ó���� ���� �����ϴ� �Լ�
	public boolean nextPage(int pageNumber) {
		// bbsAvailable = 1 : ������ ���� �ʾƼ� Available�� 1�� �۸� ������
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);  
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;  // ���� �������� �Ѿ �� ������ �˷��ִ� �Լ� (���� �������� �����ϴ°�?)
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	// �ϳ��� �� ������ �ҷ����� �Լ�
	public Bbs getBbs(int bbsID) {
		// bbsAvailable = 1 : ������ ���� �ʾƼ� Available�� 1�� �۸� ������
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);  
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	
	// �� ����
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);  //getNext() : �������� ������ �� �Խù� ��ȣ
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();  // ���������� �����ߴٸ� 0�̻��� ����� ��ȯ
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  // �����ͺ��̽� ����
	}
	
	
	// �� ����
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);  //getNext() : �������� ������ �� �Խù� ��ȣ
			return pstmt.executeUpdate();  // ���������� �����ߴٸ� 0�̻��� ����� ��ȯ
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  // �����ͺ��̽� ����
	}
}