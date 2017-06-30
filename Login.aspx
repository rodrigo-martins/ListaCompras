<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Login</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtUsua" CssClass="col-xs-3 control-label">Usuário</asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox runat="server" ID="txtUsua" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsua"
                                CssClass="text-danger" ErrorMessage="Preencha o campo Usuário." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtSenha" CssClass="col-xs-3 control-label">Senha</asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox runat="server" ID="txtSenha" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSenha" CssClass="text-danger" ErrorMessage="Preencha o campo Senha" />
                        </div>
                    </div>                    
                    <div class="form-group">
                        <div class="col-xs-12">
                            <asp:Button runat="server" ID="btnEntrar" Text="Entrar" CssClass="btn btn-primary" OnClick="btnEntrar_Click" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" NavigateUrl="~/Account/Register.aspx" ID="RegisterHyperLink" ViewStateMode="Disabled">
                        Registrar
                    </asp:HyperLink>
                </p>
            </section>
        </div>        
    </div>
</asp:Content>

