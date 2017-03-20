using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Produto
/// </summary>
public class Produto
{
    private int _idproduto;
    public int ID_Produto
    {
        get { return _idproduto; }
        set { _idproduto = value; }
    }

    private string _nomeproduto;
    public string Nome_Produto
    {
        get { return _nomeproduto; }
        set { _nomeproduto = value; }
    }

    private int _idtipounidade;

    public int ID_TipoUnidade
    {
        get { return _idtipounidade; }
        set { _idtipounidade = value; }
    }
    private int _idcategoria;

    public int ID_Categoria
    {
        get { return _idcategoria; }
        set { _idcategoria = value; }
    }



    public Produto()
    {
       
    }
}