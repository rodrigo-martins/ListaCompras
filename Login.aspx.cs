using ListaCompras;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var usuario = manager.FindAsync(txtUsua.Text, txtSenha.Text).Result;
        
        if (usuario != null)
        {
            IdentityHelper.SignIn(manager, usuario, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            // TODO: Arrumar mensagem na tela
            FailureText.Text = "Login ou senha inválidos.";
            FailureText.Visible = true;
        }
    }
}