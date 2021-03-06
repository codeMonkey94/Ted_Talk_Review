package tedtalkDB.Controller;
import java.util.ArrayList;

import tedtalkDB.model.*;
import tedtalkDB.persist.*;

public class ProfessorController {
	private Professor professorModel;
	private ArrayList<Review> revs;
	private DerbyDatabase derby = new DerbyDatabase();
	
	//NOTE: JAVA CREATES A DEFAULT CONSTRUCTOR JUST AS IT DOES GARBAGE COLLECTION
	public void setModel(Professor professorModel) {
		this.professorModel = professorModel;
	}
	boolean verified() {
		//USING DERBY'S CHECK CREDIT METHOD TO AUTHENTICATE USER:
		return (derby.checkCredentials(professorModel.getUserName(), professorModel.getPassword()));
	}
	public void createLogin(String user) {
		Account login = derby.setLogin(user);
		professorModel.setEmail(login.getEmail());
		professorModel.setPassword(login.getPassword());
		professorModel.setprofID(login.getprofID());
		professorModel.setUsername(login.getUserName());		
		//ENABLE OR DISABLE MODERATING SETTINGS:
	//******	professorModel.setModStat(derby.getModStat());//FUNCTIONALITY NOT COMPLETE YET
		
		//CREATES NEW ADMIN IN THE DATABASE:
		derby.addProfessor(professorModel.getUserName(),professorModel.getPassword(),professorModel.getEmail(), derby.getMod(professorModel.getMod()));
				
	}
	public void addStudents(String user, String pass, String email, String section, String major) {
		derby.addStudent(user, pass, email, section, major);
	}
	
	public void verifyReview(Review rev, int approve) {
		if(approve == 1) {//INDICATES ADMIN APPROVED REVIEW
			//TOGGLE STATUS IN DB TO 1
		}
		//ELSE NOT NEEDED STATUS IS LEFT ON DENIED 			
	}
	public void removeAccount(String student) {
		// TODO Auto-generated method stub
		derby.removeAccount(student, 1);
	}
	public void addStudent(String user, String pass, String email, String section, String major) {
		derby.addNewStudent(user, pass, email, section, major);
	}
	
	public void approveStudent(String user) {
		derby.approveStudent(user);
	}
	
	public int switchMod(String user) {
		int mod = derby.getMod(derby.getProfID(user));
		int globalMod = derby.getGlobalMod();
		
		if(globalMod <= 0) {
			switch(mod) {
			case 0: 
				mod = 1;
				break;
			case 1: 
				mod = 0;
				break;
			default:
				mod = 0;
			}
		}
		else {
			mod = 1;
		}
		
		derby.updateMod(derby.getProfID(user), mod);
		return mod;
  }
  public ArrayList<Review> getReviewsBetweenDates(String searchName, String year1, String month1, String day1, String year2, String month2, String day2){
		
		int tempProfID = derby.getProfID(searchName);
		
		String date1 = year1+"/"+month1+"/"+day1;
		//String date1 = "2019/04/26";
		java.util.Date utilDate1 = new java.util.Date(date1);
	    java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
		
		String date2 = year2+"/"+month2+"/"+day2;
	    //String date2 = "2019/04/28";
		java.util.Date utilDate2 = new java.util.Date(date2);
	    java.sql.Date sqlDate2 = new java.sql.Date(utilDate2.getTime());
		
		return derby.getReviewsBetweenDates(tempProfID, sqlDate1, sqlDate2);
		
	}
	public ArrayList<Review> getReviewByStatus(int status){
		revs = new ArrayList<Review>();
		revs.addAll(derby.getReviewByStatus(0));	//0 is the default has not been reviewed
		return revs;
	}
	public void changeReviewStatus(int status, int revID) {
		derby.changeReviewStatus(status, revID);
	}
	public void approvalAllReviews() {
		revs = new ArrayList<Review>();
		revs.addAll(derby.getReviewByStatus(0));
		for(int i = 0; i < revs.size(); i++) {
			derby.changeReviewStatus(2, revs.get(i).getRevID());
		}
	}
	public ArrayList<Review> search(String input) {
		revs = new ArrayList<Review>();
		ArrayList<String> keys = derby.parseTitle(input);
		ArrayList<Integer> revIDS = new ArrayList<Integer>();
		keys.add(input);
		revs.addAll(derby.findReview(input));
		for(int i = 0; i < keys.size(); i++) {
			revIDS.addAll(derby.getRevID(keys.get(i)));
		}
		for(int i = 0; i <revIDS.size(); i++) {
			revs.addAll(derby.getReviews(revIDS.get(i))); 
		}
		return revs;
	}
	
}
