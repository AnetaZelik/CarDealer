package carDealer.servlets;

import carDealer.Client;
import carDealer.dao.ClientDataDAO;
import carDealer.dao.ClientDataDAOImpl;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/add_user")
public class SaveClientDataServlet extends HttpServlet {

    @Resource(name="jdbc:carDealer")
    private DataSource ds;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Client client = new Client();

        client.setFirstName(req.getParameter("firstName"));
        client.setLastName(req.getParameter("lastName"));
        String ageString = req.getParameter("age");
        client.setAge(Integer.parseInt(ageString));
        client.setRegion(req.getParameter("region"));
        client.setSex(req.getParameter("sex"));

        ClientDataDAO dao = new ClientDataDAOImpl();
        try {
            dao.saveClientData(client, ds);
            req.setAttribute("sampleString", client);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error", e);
        }

        PrintWriter out = resp.getWriter();
        out.println("<html><head><title>success</title></head>");
        out.println("<body>");
        out.println("<h1>The user has been added!</h1>");
        out.println("<a href=\"userForm.jsp\">Add next user</a>");
        out.println("</body></html>");

    }
}
