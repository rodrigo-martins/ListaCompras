using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CriarLista : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            PreencherListaMeracado();
        }

        lblMessage.Visible = false;
        txtNomeLista.Enabled = true;

    }

    private void PreencherListaMeracado()
    {
        List<string> listmercado = new List<string>();
        listmercado.Add("Selecione um Mercado");
        listmercado.Add("Pão de Açúcar");
        ddlMercado.DataSource = listmercado;
        ddlMercado.DataBind();
    }

    protected void grdAmigos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Values.ToString();
    }

    protected void btnSeguir_Click(object sender, EventArgs e)
    {
        if(VerificarNomeLista())
        {
            Context.Response.Redirect("Lista.aspx");
        }
        else
        {
            lblMessage.Text = "Tente criar outra lista";
            lblMessage.Visible = true;
        }
        
    }

    //protected void grdLista_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    grdAmigos.Columns[2].Visible = true;
    //    int i = e.Values.Count;
    //}

    //protected void PreencherCmbCompartilhar(bool filtrar)
    //{
    //    try
    //    {
    //        DAL dal = new DAL();
    //        ddlCompartilhar.DataValueField = "ID_Usuario";
    //        ddlCompartilhar.DataTextField = "Nome_Usuario";
    //        if (filtrar)
    //        {
    //            ddlCompartilhar.DataSource = dal.ListaUsuario((int)Session["id_usua"],txtFiltro.Text);
    //        }
    //        else
    //        {
    //            ddlCompartilhar.DataSource = dal.ListaUsuario((int)Session["id_usua"],"");
    //        }
            
    //        ddlCompartilhar.DataBind();
    //        ddlCompartilhar.Items.Insert(0, "--Selecione--");
    //    }
    //    catch (Exception ex)
    //    {
    //        lblMessage.Text = "Desculpe, mas apreceu um erro: " + ex.Message;
    //        lblMessage.Visible = true;
    //    }
    //}

    //protected void btnFiltro_Click(object sender, EventArgs e)
    //{
    //    PreencherCmbCompartilhar(true);
    //}

    protected void btnAddUsua_Click(object sender, EventArgs e)
    {
        try
        {
            DAL dal = new DAL();

            if (VerificarNomeLista())
            {
                //grdAmigos.Columns[2].Visible = true;

                //dal.AddUsuaGrupoLista(Convert.ToInt32(ddlCompartilhar.SelectedValue), (int)Session["id_lista"]);
                //grdAmigos.DataSource = dal.ListaGrupoUsuario((int)Session["id_lista"]);
                //grdAmigos.DataBind();
                //grdAmigos.Columns[2].Visible = false;
            }
            else
            {
                lblMessage.Text = "Tente criar outra lista";
                lblMessage.Visible = true;
            }
        }
        catch (Exception)
        {

            throw;
        }

    }

    protected bool VerificarNomeLista()
    {
        try
        {
            DAL dal = new DAL();

            if (Session["id_lista"] == null || String.IsNullOrEmpty(Session["id_lista"].ToString()) || Session["id_lista"].ToString() != txtNomeLista.Text)
            {
                try
                {
                    Session["id_lista"] = dal.CriarLista((int)Session["id_usua"], txtNomeLista.Text);
                    txtNomeLista.Enabled = false;
                    return true;
                }
                catch (Exception ex)
                {
                    if (ex.Message == "Você ja tem uma lista com esse nome")
                    {
                        lblMessage.Text = ex.Message;
                        lblMessage.Visible = true;
                        Session["id_lista"] = "";
                        return false;
                    }
                    else
                    {
                        throw;                        
                    }
                }
            }
            else
            {
                if(Session["id_lista"].ToString()==txtNomeLista.Text)
                {
                    txtNomeLista.Enabled = false;
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            
        }
        catch (Exception)
        {

            throw;
        }
    }
}