package com.netcracker.hritsay.dao;


import com.netcracker.hritsay.entity.Student;

import java.util.List;

public interface DAOConnection {
    void connect();
    void disconnect();
    List<Student> selectAllStudents();
}
