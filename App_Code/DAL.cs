using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
    protected string connString = @"Data Source=MAIKO-NOTE\SQLEXPRESS;Initial Catalog=ListaCompartilhada;Integrated Security=False;User ID=IHC;Password=fatec;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
    protected SqlConnection conn;
    public DAL()
    {   
    }

    public void AbreConexao()
    {
        try
        {
            conn = new SqlConnection(connString);
            conn.Open();            
        }
        catch (Exception)
        {
            throw;
        }
    }
    protected void FechaConexao()
    {
        try
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
            
        }
        catch
        {
            throw;
        }
    }

    public List<TipoUnidade> ListaTipoUnidade()
    {
        string sql = "select [ID_TipoUnidade],[Nome_Unidade],[Sigla_Unidade] from TipoUnidade";
        List<TipoUnidade> lista = new List<TipoUnidade>();
        TipoUnidade tu;
        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                tu = new TipoUnidade();
                tu.ID_TipoUnidade = Convert.ToInt32(dr.GetValue(0));
                tu.Nome_Unidade = Convert.ToString(dr.GetValue(1));
                tu.Sigla_Unidade = Convert.ToString(dr.GetValue(2));
                lista.Add(tu);

            }

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
       

        return lista;
    }

    public List<Categoria> ListaCategoria()
    {
        string sql = "SELECT [ID_Categoria],[Nome_Categoria] FROM [Categoria] order by Nome_Categoria";
        List<Categoria> lista = new List<Categoria>();
        Categoria cat;
        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cat = new Categoria();
                cat.ID_Categoria = Convert.ToInt32(dr.GetValue(0));
                cat.Nome_Categoria = Convert.ToString(dr.GetValue(1));
                
                lista.Add(cat);

            }

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }


        return lista;
    }

    public void CadastrarProduto(string nome,int unidade, int categoria)
    {
        string sql = @"INSERT INTO [Produto]
                           ([Nome_Produto]
                           ,[ID_TipoUnidade]
                           ,[ID_Categoria])
                     VALUES
                           ('" + nome + "'," + unidade + "," + categoria + ")";

        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
    }

    public bool VerificarSeExiste(string table, string campo,string value,string cond)
    {
        string sql = @"Select count(1) from " + table + " where UPPER(" + campo + ")='" + value.ToUpper()+"'";

        if(!String.IsNullOrEmpty(cond))
        {
            sql += " and " + cond;
        }

        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            return Convert.ToBoolean( cmd.ExecuteScalar());

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
    }

    public List<Usuario> ListaUsuario(int id_usua,string filtro)
    {
        string sql = "SELECT [ID_Usuario],[codlogin],[Nome_Usuario],[Senha],[Online] FROM [Usuario] where ID_Usuario<>"+id_usua+" order by Nome_Usuario";

        if (!String.IsNullOrEmpty(filtro))
        {
            sql=sql.Replace("where", " where UPPER(Nome_Usuario) LIKE '%"+filtro.ToUpper() +"%' and ");
        }
        List<Usuario> lista = new List<Usuario>();
        Usuario usua;
        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                usua = new Usuario();
                usua.ID_Usuario = Convert.ToInt32(dr.GetValue(0));
                usua.Cod_Login = Convert.ToString(dr.GetValue(1));
                usua.Nome_Usuario = Convert.ToString(dr.GetValue(2));
                usua.Senha = Convert.ToString(dr.GetValue(3));
                usua.Online = Convert.ToInt32(dr.GetValue(4));
                
                lista.Add(usua);
            }
            return lista;

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
        
    }

    public void AddUsuaGrupoLista(int id_usua, int id_lista)
    {
        string sql0 = "Select count(1) from Grupo_Usuario where [ID_Usuario]=" + id_usua + " and [ID_Lista]=" + id_lista;

        string sql = @"INSERT INTO [Grupo_Usuario]
                       ([ID_Lista]
                       ,[ID_Usuario])
                         VALUES
                           (" + id_lista + "," + id_usua + ")";

        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sql0;
            int tem_usua = (int)cmd.ExecuteScalar();
            if(tem_usua==0)
            {
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
            
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
    }

    public int CriarLista(int id_usua, string nomelista)
    {        
        string sql = @"INSERT INTO [Lista]
           ([Nome_Lista]
           ,[ID_Usuario_Dono]
           ,[Data_Criacao])
            VALUES
            ('" + nomelista + "'," + id_usua + ",getdate())";

        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            if (!VerificarSeExiste("Lista","Nome_Lista",nomelista, "ID_Usuario_Dono="+id_usua))
            {
                cmd.CommandText= sql;
                cmd.ExecuteNonQuery();
            }
            else
            {
                throw new Exception("Você ja tem uma lista com esse nome");
            }
            

            sql = "select id_lista from Lista where ID_Usuario_Dono="+id_usua+" order by Data_Criacao desc";
            cmd.CommandText = sql;
            return (int)cmd.ExecuteScalar();
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
    }

    public List<Usuario> ListaGrupoUsuario(int id_lista)
    {        
        string sql = @"Select u.[ID_Usuario],[Nome_Usuario] from Usuario u
                        inner join Grupo_Usuario g on g.ID_Usuario = u.ID_Usuario
                        where g.ID_Lista = "+id_lista;
                
        List<Usuario> lista = new List<Usuario>();
        Usuario usua;
        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                usua = new Usuario();
                usua.ID_Usuario = Convert.ToInt32(dr.GetValue(0));                
                usua.Nome_Usuario = Convert.ToString(dr.GetValue(1));                

                lista.Add(usua);
            }
            return lista;

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }

    }

    public List<ListaItem> ListaItens(int id_lista)
    {
        string sql = @"Select p.id_produto,p.Nome_Produto, u.Nome_Unidade,i.Quantidade from produto p
                        inner join TipoUnidade u on u.ID_TipoUnidade=p.ID_TipoUnidade
                        inner join Lista_Item i on i.ID_Produto = p.ID_Produto
                        where i.ID_Lista=" + id_lista;
        
        List<ListaItem> lista = new List<ListaItem>();
        ListaItem item;
        try
        {
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                item = new ListaItem();
                item.ID_Item = Convert.ToInt32(dr.GetValue(0));
                item.Nome_Produto = Convert.ToString(dr.GetValue(1));
                item.Nome_TipoUnidade = Convert.ToString(dr.GetValue(2));
                item.Quantidade = Convert.ToInt32(dr.GetValue(3));

                lista.Add(item);
            }
            return lista;

        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }

    }

    public List<Listas> ListasDoUsuario(int id_usua)
    {
        string sql = "select id_lista,nome_lista,id_usuario_dono,data_criacao from Lista where ID_Usuario_Dono=" + id_usua + " order by Data_Criacao desc";

        try
        {
            List<Listas> lista = new List<Listas>();
            Listas item;
            
            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                item = new Listas();
                item.ID_Lista = Convert.ToInt32(dr.GetValue(0));
                item.Nome_lista = Convert.ToString(dr.GetValue(1));
                item.ID_Usua_dono = Convert.ToInt32(dr.GetValue(2));
                item.Data_Criacao = Convert.ToDateTime(dr.GetValue(3));

                lista.Add(item);
            }
            return lista;

            
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
    }

    //*********************************************Continuar a partir daqui para 2017***********************************************************************************

    public List<ListaProdutos> ListaDeProdutos(string nome_procura, string categoria)
    {
        string sql = "select p.id_produto,p.Nome_Produto, u.Nome_Unidade from produto p inner join TipoUnidade u on u.ID_TipoUnidade = p.ID_TipoUnidade";

        if (!String.IsNullOrEmpty(nome_procura) || !String.IsNullOrEmpty(categoria))
        {
            sql += " where 1=1 ";//gambis feia mas ta valendo

            sql += " where p.Nome_Produto like '%"+nome_procura+"%'";
        }
        try
        {
            List<ListaProdutos> lista = new List<ListaProdutos>();
            ListaProdutos item;

            AbreConexao();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                item = new ListaProdutos();
                item.ID_Produto = Convert.ToInt32(dr.GetValue(0));
                item.Nome_Produto = Convert.ToString(dr.GetValue(1));
                item.Nome_Unidade = Convert.ToString(dr.GetValue(2));
                //item.Data_Criacao = Convert.ToDateTime(dr.GetValue(3));

                lista.Add(item);
            }
            return lista;


        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            FechaConexao();
        }
    }



}