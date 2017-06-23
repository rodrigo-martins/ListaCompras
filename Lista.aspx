<%@ Page Title="Lista" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Lista.aspx.cs" Inherits="Lista" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-xs-4">
            <asp:Button ID="btnBusca" runat="server" Text="Buscar" CssClass="btn btn-block btn-primary" OnClick="btnBusca_Click"/>
        </div>
        <div class="col-xs-4">
            <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar" CssClass="btn btn-block btn-primary" OnClick="btnCadastro_Click"/>
        </div>
        <div class="col-xs-4">
            <asp:Button ID="btnSelLista" runat="server" Text="Lista" class="btn btn-block btn-primary" OnClick="btnSelLista_Click"/>
        </div>
    </div>
    
    <h3>Lista de Compra</h3>
        
    <div class="row">
        <div id="sel_lista" runat="server" visible="false" >
            <div class="col-xs-8">
                <asp:DropDownList ID="ddlSel_lista" runat="server" Visible="false" class="form-control"></asp:DropDownList>
                <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
            </div>
            <div class="col-xs-4">
                <asp:Button ID="btnAddUsua" runat="server" Text="ok" class="btn btn-block btn-primary" OnClick="btnAddUsua_Click" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="grdLista" runat="server" horizontalalign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnRowDeleting="grdLista_RowDeleting" EmptyDataText="Ainda não tem itens!" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Excluir" DeleteText="Excluir" ShowDeleteButton="True" ShowHeader="True" InsertVisible="False" />
                    <asp:BoundField DataField="Nome_Produto" HeaderText="Produto" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Quantidade">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQtdd" runat="server" Text='<%# Bind("Quantidade") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantidade") %>'></asp:Label>
                            <%--<asp:TextBox ID="txtQtdd" runat="server" Width="50px" Text='<%# Bind("Quantidade") %>'></asp:TextBox>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nome_TipoUnidade" HeaderText="Tipo Unidade" />
                    <asp:BoundField DataField="ID_Item" HeaderText="ID" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="row">    
        <div class="col-xs-6">
            <a href="CriarLista.aspx" class="btn btn-block btn-primary btn-lg">&laquo; Voltar </a>
            
        </div>
        <div class="col-xs-6">
            <a href="Default.aspx" class="btn btn-block btn-primary btn-lg"> Finalizar</a>
        </div>
    </div>
</asp:Content>
