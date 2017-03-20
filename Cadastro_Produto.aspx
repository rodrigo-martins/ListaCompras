<%@ Page Title="Cadastro de Produto" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cadastro_Produto.aspx.cs" Inherits="Cadastro_Produto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <h3>Cadastro de Produtos</h3>

    <div class="row" style="text-align: center;">

        <div class="col-md-4">
            <div style="padding: 20px 0px 10px 0px; vertical-align: middle;">
                <asp:Label ID="lblcriarlista" runat="server" Text="Nome:"></asp:Label>
            </div>
            <asp:TextBox ID="txtNomeProduto" runat="server" Width="227px" Style="vertical-align: middle;"></asp:TextBox>
            
        </div>
        <div class="col-md-4" style="padding: 10px 0px 10px 0px;">
           
            <div style="padding: 10px 0px 10px 0px;">
                <asp:Label ID="lblCategoria" runat="server" Text="Categoria:"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="ddlCategoria" runat="server" Width="242px"></asp:DropDownList>
            </div>
            <div style="padding: 10px 0px 20px 0px; text-align: center;">
                <div style="padding: 20px 0px 10px 0px;">
                    <asp:Label ID="lblTipoUnidade" runat="server" Text="Tipo de Unidade:"></asp:Label>
                </div>
                <div>
                    <asp:DropDownList ID="ddlTipoUnidd" runat="server" Width="242px"></asp:DropDownList>
                </div>
            </div>
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" class="btn btn-primary btn-lg" OnClick="btnCadastrar_Click" />
            <div style="padding: 10px 0px 20px 0px; text-align: center;">
                <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
            </div>
        </div>

        <div class="col-md-4">
            <div style="padding: 40px 0px 10px 0px;">
                
                <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar Lista" CssClass="btn btn-primary btn-lg" OnClick="btnAdicionar_Click" />
                <a href="Lista.aspx" class="btn btn-primary btn-lg" style="width: 125px">Finalizar</a>
            </div>
        </div>
    </div>
</asp:Content>

