package conexaomysql;
import java.sql.Connection;
import java.sql.DriverManager;
public class Conexao {
    public Connection getConexao(){
        try {
            String endereco = "jdbc:mysql://localhost:3306/adega2";
            String usuario = "root";
            String senha = "root";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conectar = DriverManager.getConnection(endereco, usuario, senha);
            return conectar;
        } 
        catch(Exception e){
            System.out.println("erro ao tentar conectar-se" + e);
        }
        
        return null;
    }
}
