package carDealer.servlets;

import carDealer.CarBean;
import carDealer.dao.CarInfoDAO;
import carDealer.dao.CarInfoDAOImpl;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/add_car_info")
public class SaveCarInfoServlet extends HttpServlet {
    @Resource(name = "jdbc:carDealer")
    private DataSource dataSource;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CarBean car = (CarBean) req.getSession().getAttribute("car");
        CarInfoDAO dao = new CarInfoDAOImpl();
        dao.saveCarInfo(car, dataSource);
        req.getSession().removeAttribute("car");

        req.getRequestDispatcher("redirect").forward(req, resp);
    }
}
