/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletHanler;

import Connections.ConnectionUtils;
import beans.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.UserDb;

/**
 *
 * @author lap11105-local
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get parameters inside request
        UserAccount user = new UserAccount();
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        user.setUserName(userName);
        user.setPassword(password);
        user.setEmail(email);
//        System.out.println(user.getUserName() + user.getPassword()+user.getEmail());
        boolean hasErr = false;
        String errorString = "";
        UserAccount secondUser = null;
        Connection conn = null;
        try {
            conn = ConnectionUtils.getMyConnection();
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            //check if account exists in DB
            secondUser = UserDb.findUser(conn, userName);
            if (secondUser != null) {
                hasErr = true;
                System.out.println("tên đăng nhập tồn tại");
                errorString = "Tên đăng nhập đã tồn tại";
            } else {
                UserDb.addAcount(conn, user);
                //get account after inserted
                user = UserDb.findUser(conn, userName, password);
            }
        } catch (SQLException ex) {
            hasErr = true;
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //if register successfully
        if (!hasErr) {
            System.out.println(user.getId());
            request.setAttribute("userid", user.getId());
            request.setAttribute("user", user);
            RequestDispatcher dispatcher
                    = this.getServletContext().
                            getRequestDispatcher("/WEB-INF/pages/chatDasboard.jsp");

            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorString", errorString);
            RequestDispatcher dispatcher //
                    = this.getServletContext().
                            getRequestDispatcher("/index.jsp");

            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
