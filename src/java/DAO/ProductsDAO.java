/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;
import bean.Products_bean;
import bean.Signup;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author NG_tailor
 */
public class ProductsDAO {

    Connection con;

    public ProductsDAO(Connection con) {
        this.con = con;
    }

    public boolean insert(Products_bean s) {                   //bean
        try {
            String sql = "insert into products(title,cost,quantity,description,product_category_id,image) values('" + s.getTitle() + "','" + s.getCost() + "','" + s.getQuantity() + "','" + s.getDescription() + "','"+ s.getProduct_category_id() +"','"+s.getFilename() +"')";
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

public List getAll() {

        String sql = "select * from products ";
        List li = new ArrayList();
        try {
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery(sql);

            while (res.next()) {
                Products_bean sb = new Products_bean();//bean
                sb.setId(res.getInt("id"));
                sb.setTitle(res.getString("title"));
                sb.setCost(res.getFloat("cost"));
                sb.setQuantity(res.getInt("quantity"));
                sb.setDescription(res.getString("description"));
                sb.setStatus(res.getInt("status"));
                sb.setFilename(res.getString("image"));
                sb.setProduct_category_id(res.getInt("product_category_id"));


                
                li.add(sb);//bean

            }
            return li;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    
public Products_bean getOne(int id) {

        String sql = "select * from products where id="+id;
        List li = new ArrayList();
        try {
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery(sql);
            Products_bean sb = new Products_bean();//bean
            while (res.next()) {
                
                sb.setId(res.getInt("id"));
                sb.setTitle(res.getString("title"));
                sb.setCost(res.getFloat("cost"));
                sb.setQuantity(res.getInt("quantity"));
                sb.setDescription(res.getString("description"));
                sb.setStatus(res.getInt("status"));
                sb.setFilename(res.getString("image"));
                sb.setProduct_category_id(res.getInt("product_category_id"));

            }
            return sb;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }    

    public boolean delete(int id) {
        try {
            String sql = "delete from products where id=" + id;
            Statement st = con.createStatement();
            int status = st.executeUpdate(sql);
            if (status > 0) {
                return true;
            }
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
