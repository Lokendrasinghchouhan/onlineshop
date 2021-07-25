package common;

import java.sql.*;

public class MyConnection {

    /**
     *
     * @return
     */
    public static Connection connectTo() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ ", "root", "");
            if (con != null) {
                System.err.println("Conection Established");
                return con;
            } else {
                System.err.println("Conection not Established");
            }
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        } catch (SQLException ex) {

        }
        return null;
    }

    public static void main(String[] args) {

        Connection connectTo = MyConnection.connectTo();
    }

}
