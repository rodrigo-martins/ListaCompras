using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Categoria
/// </summary>
public class Categoria
{
    private int _idcategoria;
    public int ID_Categoria
    {
        get { return _idcategoria; }
        set { _idcategoria = value; }
    }

    private string _nomecategoria;
    public string Nome_Categoria
    {
        get { return _nomecategoria; }
        set { _nomecategoria = value; }
    }
    public Categoria()
    {}
}