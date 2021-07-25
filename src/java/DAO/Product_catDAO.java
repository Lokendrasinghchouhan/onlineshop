
package DAO;

import bean.Product_cat_bean;
import bean.Signup;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;


public class Product_catDAO {
Connection con;
    public Product_catDAO(Connection con) {
        this.con = con;
    }
    public boolean insert(Product_cat_bean pcb){
        try{
       String sql="insert into product_category(title) values('"+pcb.getTitle()+"')";
        Statement st = con.createStatement();
        st.executeUpdate(sql);
        st.close();
        return true;
    }catch (Exception ex) {
          System.err.println(ex.getMessage());
    }
        return false; 
    }
    
   public List getAll(){
        
        String sql="SELECT * FROM `product_category";
        List li=new ArrayList();
        try{
        Statement st = con.createStatement();
         ResultSet res = st.executeQuery(sql);
       
         while(res.next()){
             Product_cat_bean pcb=new Product_cat_bean();
            pcb.setId(res.getInt("id"));
             pcb.setStatus(res.getInt("status"));
              pcb.setTitle(res.getString("title"));
             li.add(pcb);//bean
            
         }
         return li;
        }
        catch(Exception ex){
         System.out.println(ex.getMessage());   
        }
        return null;
    }
  public boolean delete(int id){
       try{
           String sql="delete from product_category where id="+id;
       Statement st=con.createStatement();
     int status=  st.executeUpdate(sql);
     if(status>0){
        return true; 
     }
       }catch(Exception ex){
           System.err.println(ex.getMessage());
       }
       return false;
   }
}
