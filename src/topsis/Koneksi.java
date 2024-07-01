/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package topsis;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author yaseru
 */
public class Koneksi {
    public static Connection Go() {
        try {
            MysqlDataSource mds = new MysqlDataSource();
            mds.setServerName("localhost");
            mds.setDatabaseName("nb_spk");
            mds.setUser("root");
            mds.setPassword("");
            mds.setPortNumber(3306);
            mds.setServerTimezone("Asia/Jakarta");
            Connection k = mds.getConnection();
            return k;
        } catch (SQLException e) {
            //
        }

        return null;
    }

}
