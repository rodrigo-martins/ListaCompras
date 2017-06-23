using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lista : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       

        sel_lista.Visible = false;
        ddlSel_lista.Visible = false;
        lblMessage.Visible = false;

        if (!IsPostBack)
        {
            if (Session["id_lista"]==null || String.IsNullOrEmpty(Session["id_lista"].ToString()))
            {
                SelecionarLista();
            }
            else
            {
                CarregarGrid();
            }
            
        }
        
    }

    private void SelecionarLista()
    {
        DAL dal = new DAL();
        List<Listas> aux = dal.ListasDoUsuario(((int)Session["id_usua"]));

        if(aux.Count>1)
        {
            ddlSel_lista.DataValueField = "id_lista";
            ddlSel_lista.DataTextField = "nome_lista";
            ddlSel_lista.DataSource = aux;
            ddlSel_lista.DataBind();
            ddlSel_lista.Items.Insert(0, "--Selecione um lista--");
            sel_lista.Visible = true;
            ddlSel_lista.Visible = true;
        }
        else if(aux.Count==1)
        {
            Session["id_lista"] = aux[0].ID_Lista;
            CarregarGrid();
        }
        else
        {
            sel_lista.Visible = true;
            lblMessage.Visible = true;
            lblMessage.Text = "Você não possui Lista.<br />Por favor crie uma.";
            return;
        }
        
    }

    protected void CarregarGrid()
    {
        DAL dal = new DAL();
        grdLista.Columns[4].Visible = true;
        grdLista.DataSource = dal.ListaItens(Convert.ToInt32(Session["id_lista"])) ;
        grdLista.DataBind();
        grdLista.Columns[4].Visible = false;

    }
       

    protected void grdLista_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        grdLista.Columns[4].Visible = true;
        int i = e.Values.Count;
    }

    protected void btnBusca_Click(object sender, EventArgs e)
    {
        if (Session["id_lista"] == null || String.IsNullOrEmpty(Session["id_lista"].ToString()))
        {
            lblMessage.Text = "É preciso escolher uma lista!";
            lblMessage.Visible = true;
            SelecionarLista();

        }
        else
            Context.Response.Redirect("Busca.aspx?listid="+Session["id_lista"]);
    }

   
    protected void btnCadastro_Click(object sender, EventArgs e)
    {
        Context.Response.Redirect("Cadastro_Produto.aspx?listid=1");
    }

    
    protected void btnAddUsua_Click(object sender, EventArgs e)
    {
        if (ddlSel_lista.SelectedIndex != 0)
        {
            Session["id_lista"] =ddlSel_lista.SelectedValue;
            CarregarGrid();
        }
    }

    protected void btnSelLista_Click(object sender, EventArgs e)
    {
        Session.Remove("id_lista");
        SelecionarLista();
    }
}
