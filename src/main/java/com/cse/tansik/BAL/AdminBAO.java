package com.cse.tansik.BAL;

import com.cse.tansik.DTO.Department;
import com.cse.tansik.DTO.EduYear;
import com.cse.tansik.DTO.Prequistes;
import com.cse.tansik.DTO.Student;

import com.cse.tansik.DTO.User;

import java.util.Date;
import java.util.HashMap;
import java.util.List;


public interface AdminBAO extends UserBAO {
    // remove beacause of dublication in getstudent
    // Student getStudentData(User user);
    //
    public boolean setRequsetsForStudent(List<Request> requests, Student student);
    
    public Request getRequsetsForStudent(Student student);

    /**
     *
     * @param text
     * @param student
     * @return
     * 
     */
    //boolean sendMessage(String text, Student student);
    //Message getMessage();
    /**
     *note by AbdAlla AboElmagd && Mostafa Gamal
     * this method create the start&end Date of tansiq
     * @param start
     * @param end
     * @return boolean
     */

    public boolean setDate(Date start, Date end);

    public Student getStudent(User user); // implement
    
    public boolean editStudent(Student student);
    
    public List<Student> getAllStudents();



    boolean editPrequistes(Prequistes preq, Department dep);
    List<Prequistes> getPrequsites(Department dep);

    // add addDespartments
    boolean addDepartments(List<Department> Department);

    // remove gitdepartment cause it is not useful
    // Department getDespartment(EduYear year ,String name);
    List<Department> getDespartments(EduYear year);
    
    
    /**
     *string is key of 
     * @param
     * @return
     */
    HashMap<Student,String>  solveWishes(EduYear eduyear);
    
}
