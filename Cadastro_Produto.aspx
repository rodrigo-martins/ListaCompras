<%@ Page Title="Cadastro de Produto" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cadastro_Produto.aspx.cs" Inherits="Cadastro_Produto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <h3>Cadastro de Produtos</h3>

    <div class="row">

        <div class="col-xs-12">
            <asp:Label ID="lblcriarlista" runat="server" Text="Nome:" class=""></asp:Label>
            <asp:TextBox ID="txtNomeProduto" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-12">  
            <asp:Label ID="lblCategoria" runat="server" Text="Categoria:"></asp:Label>
            <asp:DropDownList ID="ddlCategoria" runat="server"  class="form-control"></asp:DropDownList>
        </div>
        <div class="col-xs-12">  
            <asp:Label ID="lblTipoUnidade" runat="server" Text="Tipo de Unidade:"></asp:Label>
            <asp:DropDownList ID="ddlTipoUnidd" runat="server"  class="form-control"></asp:DropDownList>
        </div>
        <br />
        <div class="col-xs-12">  
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" class="btn btn-primary btn-block btn-lg" OnClick="btnCadastrar_Click" />
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
        </div>
        <br/>    
        <%--<div class="col-xs-6">
            <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar Lista" class="btn btn-block btn-primary btn-lg" OnClick="btnAdicionar_Click" />
        </div>--%>
         <div class="col-xs-12">
            <a href="Lista.aspx" class="btn btn-primary btn-block btn-lg" style="width:80%;">Finalizar</a>
        </div>
    </div>
</asp:Content>

