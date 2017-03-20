using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ListaProdutos
/// </summary>
public class ListaProdutos
{
    private int _id_produto;
    public int ID_Produto
    {
        get { return _id_produto; }
        set { _id_produto = value; }
    }

    private string _produto;
    public string Nome_Produto
    {
        get { return _produto; }
        set { _produto = value; }
    }

    private int _quantidade;
    public int Quantidade
    {
        get { return _quantidade; }
        set { _quantidade = value; }
    }

    private string _nome_unidade;
    public string Nome_Unidade
    {
        get { return _nome_unidade; }
        set { _nome_unidade = value; }
    }

    private int _id;
    public int ID
    {
        get { return _id; }
        set { _id = value; }
    }
    public ListaProdutos()
    {
        
    }
}