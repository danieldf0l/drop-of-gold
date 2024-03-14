
package dao_tabela_atributos;

import java.sql.Connection;
import conexaomysql.Conexao;
import tabelas_atributos.Vendas;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class Dao_Tabela_Vendas {
    
    private Conexao conexao;
    private Connection conectar;

    public Dao_Tabela_Vendas() {
        this.conexao = new Conexao();
        this.conectar = this.conexao.getConexao();
    }
    
       public void Inserir_Dados(Vendas Vendas) {
        String sql = "INSERT INTO venda" + "(id_venda, valor, valor_final, forma_pagamento, data_venda)" + "VALUES(?,?,?,?,?)";
        try {
            PreparedStatement stmt = this.conectar.prepareStatement(sql);
            stmt.setInt(1, Vendas.getId_venda());
            stmt.setDouble(2, Vendas.getValor());
            stmt.setDouble(3, Vendas.getValor_final());
            stmt.setString(4, Vendas.getForma_pagamento());
            stmt.setString(5, Vendas.getData_venda());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados no BD_MySQL" + e.getMessage());
        }  
    }
    public Vendas getId_venda(int id_venda) {
        String sql = "SELECT * FROM cursos WHERE id_venda = ?";
        try {
            PreparedStatement stmt = this.conectar.prepareStatement(sql);
            stmt.setInt(1, id_venda);
            ResultSet rs_Vendas = stmt.executeQuery();
            Vendas vendas = new Vendas();
            rs_Vendas.first();
            vendas.setId_venda(id_venda);
            vendas.setValor(rs_Vendas.getDouble("valor"));
            vendas.setValor_final(rs_Vendas.getDouble("valor_final"));
            vendas.setForma_pagamento(rs_Vendas.getString("forma_pagamento"));
            vendas.setData_venda(rs_Vendas.getString("data_venda"));
            return vendas;
        } catch (SQLException e) {
            System.out.println("Id não encontrado" + e.getMessage());
            return null;
        }

    }   
       
}
