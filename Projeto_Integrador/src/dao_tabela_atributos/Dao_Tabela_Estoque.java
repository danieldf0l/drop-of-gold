package dao_tabela_atributos;

import java.sql.Connection;
import conexaomysql.Conexao;
import tabelas_atributos.Estoque;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class Dao_Tabela_Estoque {

    private Conexao conexao;
    private Connection conectar;

    public Dao_Tabela_Estoque() {
        this.conexao = new Conexao();
        this.conectar = this.conexao.getConexao();
    }

    public void Inserir_Dados(Estoque Estoque) {
        String sql = "INSERT INTO estoque" + "(fk_id_produto, quantidade, data_validade, numero_lote)" + "VALUES(?,?,?,?)";
        try {
            PreparedStatement stmt = this.conectar.prepareStatement(sql);
            stmt.setInt(1, Estoque.getId_produto());
            //stmt.setString(2, Estoque.getNome());
            //stmt.setString(3, Estoque.getTipo());
            stmt.setInt(2, Estoque.getQuantidade());
            stmt.setString(3, Estoque.getData_validade());
            stmt.setString(4, Estoque.getNumero_lote());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados no BD_MySQL " + e.getMessage());
        }  
    }    
    public Estoque getId_produto(int id_produto) {
        String sql = "SELECT * FROM cursos WHERE id = ?";
        try {
            PreparedStatement stmt = this.conectar.prepareStatement(sql);
            stmt.setInt(1, id_produto);
            ResultSet rs_Estoque = stmt.executeQuery();
            Estoque estoques = new Estoque();
            rs_Estoque.first();
            estoques.setId_produto(id_produto);
            estoques.setNome(rs_Estoque.getString("nome"));
            estoques.setTipo(rs_Estoque.getString("tipo"));
            estoques.setQuantidade(rs_Estoque.getInt("quantidade"));
            estoques.setData_validade(rs_Estoque.getString("data_validade"));
            estoques.setNumero_lote(rs_Estoque.getString("numero_lote"));
            return estoques;
        } catch (SQLException e) {
            System.out.println("Id não encontrado" + e.getMessage());
            return null;
        }

    }
}

