﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Busca : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //List<ListaProdutos> listaproduto = new List<ListaProdutos>();
        //ListaProdutos lst = new ListaProdutos();
        //lst.Nome_Produto = "maçã";
        //lst.Quantidade = 2;
        //lst.Nome_Unidade = "UNI";
        //lst.ID_Produto = 1;
        //listaproduto.Add(lst);

        //lst = new ListaProdutos();
        //lst.Nome_Produto = "arroz";
        //lst.Quantidade = 5;
        //lst.Nome_Unidade = "Kg";
        //lst.ID_Produto = 2;
        //listaproduto.Add(lst);
        Carregar_Grid();
    }

    protected void Carregar_Grid()
    {
        DAL dal = new DAL();
        int cat = 0;
        int.TryParse(ddlCategoria.SelectedValue,out cat);
        grdProdutos.DataSource = dal.ListaDeProdutos(txtNomeLista.Text, cat);
        grdProdutos.DataBind();
        grdProdutos.Columns[4].Visible = false;

    }

    protected void btnNomeIr_Click(object sender, EventArgs e)
    {
        Carregar_Grid();
    }

    protected void btnAdicionar_Click(object sender, EventArgs e)
    {
        
    }
}