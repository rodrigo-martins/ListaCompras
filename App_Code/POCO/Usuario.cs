using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Usuario
/// </summary>
public class Usuario
{
    private int _idusuario;

    public int ID_Usuario
    {
        get { return _idusuario; }
        set { _idusuario = value; }
    }

    private string _codlogin;

    public string Cod_Login
    {
        get { return _codlogin; }
        set { _codlogin = value; }
    }

    private string _nomeusua;

    public string Nome_Usuario
    {
        get { return _nomeusua; }
        set { _nomeusua = value; }
    }

    private string _senha;

    public string Senha
    {
        get { return _senha; }
        set { _senha = value; }
    }

    private int _online;

    public int Online
    {
        get { return _online; }
        set { _online = value; }
    }


    public Usuario()
    {}
}