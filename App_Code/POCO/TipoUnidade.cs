using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TipoUnidade
/// </summary>
public class TipoUnidade
{
    private int _idtipounidade;
    public int ID_TipoUnidade
    {
        get { return _idtipounidade; }
        set { _idtipounidade = value; }
    }

    private string _nomeunidade;

    public string Nome_Unidade
    {
        get { return _nomeunidade; }
        set { _nomeunidade = value; }
    }

    private string _siglaunidade;

    public string Sigla_Unidade
    {
        get { return _siglaunidade; }
        set { _siglaunidade = value; }
    }


    public TipoUnidade()
    {}
}