package carDealer.dao;

import carDealer.CarBean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

public class CarInfoDAOImpl implements CarInfoDAO {

    public void saveCarInfo(CarBean car, DataSource dataSource) {

        try {

            Connection conn = null;

            try {
                conn = dataSource.getConnection();

                PreparedStatement pstmt = conn.prepareStatement(
                        "INSERT INTO pojazd(id, make, type, year, distance, capacity) VALUES (?,?,?,?,?,?)");

                pstmt.setInt(1, generateId());
                pstmt.setString(2, car.getMake());
                pstmt.setString(3, car.getType());
                pstmt.setInt(4, car.getYear());
                pstmt.setString(5, car.getDistance());
                pstmt.setString(6, car.getCapacity());

                pstmt.executeUpdate();
                pstmt.close();
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    private int generateId() {
        return ((int) (System.currentTimeMillis() % 100000)) + 100000;
    }
}