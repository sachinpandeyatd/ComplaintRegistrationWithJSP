package com.complaint_register;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {
	Connection connection;
	PreparedStatement preparedStatement;
	
	public String complaintID() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "SELECT ComplaintID FROM Complaint ORDER BY ComplaintID DESC LIMIT 1";
		preparedStatement = connection.prepareStatement(cmd);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		resultSet.next();
		String id = String.format("%03d", Integer.parseInt(resultSet.getString("ComplaintID").substring(1))+1);
		String complaintID = "C"+ id;
		return complaintID;
	}
	
	public String addComplaint(Complaint complaint) throws ClassNotFoundException, SQLException {
		String complaintID = complaintID();
		connection = ConnectionHelper.getConnection();
		preparedStatement = connection.prepareStatement("Insert into complaint (ComplaintID, complaintType, cDescription, severity, status) values (?, ?, ?, ?, ?)");
		preparedStatement.setString(1, complaintID);
		preparedStatement.setString(2, complaint.getComplaintType());
		preparedStatement.setString(3, complaint.getcDescription());
		preparedStatement.setString(4, complaint.getSeverity());
		preparedStatement.setString(5, Status.PENDING.toString());
		preparedStatement.executeUpdate();
		return "Complaint Added Successfully.";
	}
	
	public Complaint searchComplaint(String complaintID) throws ClassNotFoundException, SQLException {
		Complaint complaint = null;
		connection = ConnectionHelper.getConnection();
		preparedStatement = connection.prepareStatement("Select * from Complaint where ComplaintId=?");
		preparedStatement.setString(1, complaintID);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next()) {
			complaint = new Complaint();
			complaint.setId(complaintID);
			complaint.setComplaintType(resultSet.getString("complaintType"));
			complaint.setcDescription(resultSet.getString("cDescription"));
			complaint.setComplaintDate(resultSet.getDate("complaintDate"));
			complaint.setSeverity(resultSet.getString("severity"));
			complaint.setStatus(Status.valueOf(resultSet.getString("status")));
		}
		return complaint;
	}
	
	
	//Resolved
	public String resolved(Complaint complain) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd="insert into resolve(ComplaintID,ResolvedBy, complaintDate, Comments)values(?,?,?,?)";
		preparedStatement = connection.prepareStatement(cmd);
		preparedStatement.setString(1,complain.getId());
		preparedStatement.setString(2, complain.getResolvedBy());
		preparedStatement.setDate(3, (Date)complain.getComplaintDate());
		preparedStatement.setString(4, complain.getComments());
		preparedStatement.executeUpdate();
		
		String cmds="update complaint set Status=? where ComplaintID=?";
		preparedStatement = connection.prepareStatement(cmds);
		preparedStatement.setString(1, Status.APPROVED.toString());
		preparedStatement.setString(2, complain.getId());
		preparedStatement.executeUpdate();
		
		return "Complaint Resolved Successfully.";
		
	}
	
	public Complaint[] showResolved() throws SQLException, ClassNotFoundException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select * from resolve";
		preparedStatement = connection.prepareStatement(cmd);
		List<Complaint> complainList = new ArrayList();
		ResultSet rs = preparedStatement.executeQuery();
		Complaint complains = null;
		while(rs.next()) {
			complains= new Complaint();
			int tat = tat(rs.getDate("ComplaintDate"), rs.getDate("ResolveDate"));
			complains.setId(rs.getString("ComplaintID"));
			complains.setComplaintDate(rs.getDate("ComplaintDate"));
			complains.setResolveDate(rs.getDate("ResolveDate"));
			complains.setResolvedBy(rs.getString("ResolvedBy"));
			complains.setComments(rs.getString("comments"));
			complains.setTat(tat);
			complainList.add(complains);
			
		}
		return complainList.toArray(new Complaint[complainList.size()]);
	
	}
	
	public int tat(Date complaintDate, Date resolvedDate) {
		Date today=(Date)complaintDate ;
		Date today1=(Date) resolvedDate;
		long day1=today1.getTime()-today.getTime();
		 long m = day1 / (1000 * 24 * 60 * 60);
		 int tat=(int)m;
		return tat;
	}
}
