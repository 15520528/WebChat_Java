package servletHanler;

/**
 *
 * @author lap11105-local
 */
import beans.UserAccount;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.MyUtils;

@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public HomeServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("get Url");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //if user pass Authentication
        Cookie[] cookies = request.getCookies();
//        System.out.println(cookies);
        String token = "";
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/pages/login.jsp");
        dispatcher.forward(request, response);

//        for (int i = 0; i < cookies.length; i++) {
//            String name = cookies[i].getName();
//            String value = cookies[i].getValue();
//            if (name.equalsIgnoreCase("Authorization")) {
//                token = value;
//            }
//        }
//        if (token != null) {
//            UserAccount user = verifyToken(token);
//            if (user != null) {
//                System.out.println("đã đăng nhập: userid= " + user.getId());
//
//                request.setAttribute("userid", user.getId());
//                request.setAttribute("user", user);
//
//                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/pages/chatDasboard.jsp");
//                dispatcher.forward(request, response);
//            } else {
//                System.out.println(token);
//                System.out.println("chưa đăng nhập");
//                RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/pages/login.jsp");
//                dispatcher.forward(request, response);
//            }
//        }
    }

    public static UserAccount verifyToken(String token) {
        UserAccount user = new UserAccount();
        try {
            Algorithm algorithm = Algorithm.HMAC256("secret");
            JWTVerifier verifier = JWT.require(algorithm)
                    .build(); //Reusable verifier instance
            DecodedJWT jwt = verifier.verify(token);

            System.out.println(jwt.getClaim("username").asString());
            System.out.println(jwt.getClaim("isLogin").asBoolean());

            Boolean isLogin = jwt.getClaim("isLogin").asBoolean();
            //if user is pass through Authentication 
            if (isLogin && jwt.getClaim("userId").asString() != null) {
                user.setUserName(jwt.getClaim("username").asString());
                user.setId(jwt.getClaim("userId").asString());
                return user;
            }
        } catch (JWTVerificationException exception) {
            //Invalid signature/claims
            System.out.println("authentication is fail with user");
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
