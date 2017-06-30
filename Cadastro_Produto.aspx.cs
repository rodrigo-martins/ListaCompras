using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadastro_Produto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PreencherTipoUnidade();
            PreencherCategoria();
        }
        lblMessage.Visible = false;
    }

    //protected void btnAdicionar_Click(object sender, EventArgs e)
    //{

    //}

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        try
        {
            if (String.IsNullOrEmpty(txtNomeProduto.Text) || ddlCategoria.SelectedIndex == 0 || ddlTipoUnidd.SelectedIndex == 0)
            {
                lblMessage.Text = "Todos os campos precisam ser preenchidos";
                lblMessage.Visible = true;
                return;
            }

            DAL dal = new DAL();
            if (dal.VerificarSeExiste("produto", "Nome_Produto", txtNomeProduto.Text,""))
            {
                lblMessage.Text = "Produto ja Cadastrado!";
                lblMessage.Visible = true;
                return;
            }
            dal.CadastrarProduto(txtNomeProduto.Text, Convert.ToInt32(ddlTipoUnidd.SelectedValue), Convert.ToInt32(ddlCategoria.SelectedValue));
            lblMessage.Text = "Produto cadastrado com sucesso";
            lblMessage.Visible = true;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Desculpe, mas apareceu um erro: " + ex.Message;
            lblMessage.Visible = true;
        }
        

    }

    protected void PreencherTipoUnidade()
    {
        try
        {
            DAL dal = new DAL();
            ddlTipoUnidd.DataValueField = "ID_TipoUnidade";
            ddlTipoUnidd.DataTextField = "Nome_Unidade";
            ddlTipoUnidd.DataSource = dal.ListaTipoUnidade();
            ddlTipoUnidd.DataBind();
            ddlTipoUnidd.Items.Insert(0, "--Selecione--");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Desculpe, mas apreceu um erro: " + ex.Message;
            lblMessage.Visible = true;
        }
    }

    protected void PreencherCategoria()
    {
        try
        {
            DAL dal = new DAL();
            ddlCategoria.DataValueField = "ID_Categoria";
            ddlCategoria.DataTextField = "Nome_Categoria";
            ddlCategoria.DataSource = dal.ListaCategoria();
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, "--Selecione--");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Desculpe, mas apreceu um erro: " + ex.Message;
            lblMessage.Visible = true;
        }
    }
}