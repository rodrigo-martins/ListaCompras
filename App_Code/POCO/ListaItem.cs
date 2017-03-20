using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ListaItem
/// </summary>
public class ListaItem
{
    private int _idItem;
    public int ID_Item
    {
        get { return _idItem; }
        set { _idItem = value; }
    }

    private string _nomeproduto;
    public string Nome_Produto
    {
        get { return _nomeproduto; }
        set { _nomeproduto = value; }
    }

    private string _nome_unidade;

    public string Nome_TipoUnidade
    {
        get { return _nome_unidade; }
        set { _nome_unidade = value; }
    }
    private int _quantidade;
    public int Quantidade
    {
        get { return _quantidade; }
        set { _quantidade = value; }
    }
    public ListaItem()
    {
    }
}