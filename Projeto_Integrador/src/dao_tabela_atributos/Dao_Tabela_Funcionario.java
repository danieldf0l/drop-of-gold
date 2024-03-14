
package dao_tabela_atributos;

import java.sql.Connection;
import conexaomysql.Conexao;
import tabelas_atributos.Funcionario;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import tabelas_atributos.Vendas;

public class Dao_Tabela_Funcionario {
    
    private Conexao conexao;
    private Connection conectar;

    public Dao_Tabela_Funcionario() {
        this.conexao = new Conexao();
        this.conectar = this.conexao.getConexao();
    }
    
    public void Inserir_Dados(Funcionario Funcionario) {
        String sql = "INSERT INTO funcionario" + "(id, cargo, horario_entrada, horario_saida, nome)" + "VALUES(?,?,?,?,?)";
        try {
            PreparedStatement stmt = this.conectar.prepareStatement(sql);
            stmt.setInt(1, Funcionario.getId());
            stmt.setString(2, Funcionario.getCargo());
            stmt.setString(3, Funcionario.getHorario_entrada());
            stmt.setString(4, Funcionario.getHorario_saida());
            stmt.setString(5, Funcionario.getNome());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados no BD_MySQL" + e.getMessage());
        }  
    }
    public Funcionario getId(int id) {
        String sql = "SELECT * FROM cursos WHERE id = ?";
        try {
            PreparedStatement stmt = this.conectar.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs_Funcionario = stmt.executeQuery();
            Funcionario funcionario = new Funcionario();
            rs_Funcionario.first();
            funcionario.setId(id);
            funcionario.setCargo(rs_Funcionario.getString("valor"));
            funcionario.setHorario_entrada(rs_Funcionario.getString("horario_entrada"));
            funcionario.setHorario_saida(rs_Funcionario.getString("horario_saida"));
            funcionario.setNome(rs_Funcionario.getString("nome"));
            return funcionario;
        } catch (SQLException e) {
            System.out.println("Id não encontrado" + e.getMessage());
            return null;
        }

    }   
    
}
