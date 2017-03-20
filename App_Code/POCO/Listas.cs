using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Lista
/// </summary>
public class Listas
{
    private int _id_lista;

    public int ID_Lista
    {
        get { return _id_lista; }
        set { _id_lista = value; }
    }

    private string _nomelista;

    public string Nome_lista
    {
        get { return _nomelista; }
        set { _nomelista = value; }
    }
    private int _idusuadono;

    public int ID_Usua_dono
    {
        get { return _idusuadono; }
        set { _idusuadono = value; }
    }
    private DateTime _datacriacao;

    public DateTime Data_Criacao
    {
        get { return _datacriacao; }
        set { _datacriacao = value; }
    }



    public Listas()
    {
    }
}