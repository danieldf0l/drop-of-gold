package principal;
import conexaomysql.Conexao;
public class Principal {
    public static void main(String[] args) {
        Conexao connect =  new Conexao();
        connect.getConexao();
    }
}
