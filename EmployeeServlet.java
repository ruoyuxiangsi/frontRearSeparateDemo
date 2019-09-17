package com.red.servlet.core;

import com.google.gson.Gson;
import com.red.servlet.dao.UserDao;
import com.red.servlet.dao.impl.UserDaoImpl;
import com.red.servlet.entity.Employee;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author ljh
 * @create 2019-09-17 15:05
 */
public class EmployeeServlet extends HttpServlet {

    private UserDao userDao;

    public EmployeeServlet() {
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            List<Employee> emps = userDao.getAllOfEmployee();

            Gson gson = new Gson();

            // 将对象转化为json字符串
            String empsJsonStr = gson.toJson(emps);

            resp.setContentType("text/html;charset=utf-8");

            resp.getWriter().write(empsJsonStr);

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
