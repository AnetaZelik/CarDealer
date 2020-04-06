package carDealer.dao;

import carDealer.CarBean;

import javax.sql.DataSource;

public interface CarInfoDAO {

    public void saveCarInfo(CarBean car, DataSource dataSource);

}
