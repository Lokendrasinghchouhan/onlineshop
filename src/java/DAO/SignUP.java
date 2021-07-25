
package DAO;

import bean.Signup;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;


public class SignUP {
Connection con;
    public SignUP(Connection con) {
        this.con = con;
    }
    public boolean insert(Signup s){
        try{
       String sql="insert into signup(name,contact,email,password) values('"+s.getName()+"','"+s.getContact()+"','"+s.getEmail()+"','"+s.getPassword()+"')";
        Statement st = con.createStatement();
        st.executeUpdate(sql);
        st.close();
        return true;
    }catch (Exception ex) {
          System.err.println(ex.getMessage());
    }
        return false; 
    }
    public Signup signiin(Signup s){
        String sql="select * from signup where email ='" + s.getEmail()+"'";
        try{
        Statement st = con.createStatement();
         ResultSet res = st.executeQuery(sql);
         Signup sb = new Signup();
         while (res.next()){
             System.err.println(res.getString("email"));
          sb.setId(res.getInt("id"));
           sb.setName(res.getString("name"));
            sb.setEmail(res.getString("email"));
             sb.setContact(res.getString("contact"));
              sb.setPassword(res.getString("password"));
               sb.setRole(res.getString("role"));
         }
      boolean b = BCrypt.checkpw(s.getPassword(),sb.getPassword());
      if(true){
          return sb;
      }else{
      
      return null;
      }
        }catch (Exception ex){
        System.err.println(ex.getMessage());
    
        }
   
     return null;     
    }
    
   public List getAll(){
        
        String sql="select * from signup ";
        List li=new ArrayList();
        try{
        Statement st = con.createStatement();
         ResultSet res = st.executeQuery(sql);
       
         while(res.next()){
             Signup sb=new Signup();//bean
             sb.setId(res.getInt("id"));
             sb.setName(res.getString("name"));
             sb.setContact(res.getString("contact"));
             sb.setEmail(res.getString("email"));
             sb.setRole(res.getString("role"));
            
             li.add(sb);//bean
            
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
           String sql="delete from signup where id="+id;
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
