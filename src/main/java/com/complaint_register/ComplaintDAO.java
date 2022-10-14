package com.complaint_register;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
