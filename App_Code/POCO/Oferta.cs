using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Oferta
/// </summary>
public class Oferta
{
    private int _iditem;

    public int ID_Item
    {
        get { return _iditem; }
        set { _iditem = value; }
    }

    private int _idloja;

    public int ID_Loja
    {
        get { return _idloja; }
        set { _idloja = value; }
    }

    private decimal _preco;

    public decimal Preco
    {
        get { return _preco; }
        set { _preco = value; }
    }


    public Oferta()
    {
    }
}