<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Busca.aspx.cs" Inherits="Busca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<div class="col-md-4" style="padding:10px 0px 10px 0px;">
        <asp:Button ID="btnBusca" runat="server" Text="Buscar" CssClass="btn btn-primary"  Width="101px" />
        <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar" CssClass="btn btn-primary"  Width="103px" />
    </div>--%>
    
    <h3>Busca de Produtos</h3>
        
    <div class="row">
        <div class="col-xs-12">
            <asp:Label ID="lblcriarlista" runat="server"  Text="Nome:"></asp:Label>
            <asp:TextBox ID="txtNomeLista" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-8">
            <asp:Label ID="lblCategoria" runat="server" Text="Categoria:"></asp:Label>
            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control"></asp:DropDownList>  
        </div>
        <div class="col-xs-4">
            <asp:Label ID="Label100" runat="server" Text="&nbsp;"></asp:Label>
            <asp:Button ID="btnNomeIr" runat="server" Text="Filtrar &raquo;" class="btn btn-block btn-primary "  OnClick="btnNomeIr_Click"/>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="grdProdutos" runat="server" CellPadding="4" ForeColor="#428bca" horizontalalign="Center" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="Ainda não tem itens!" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Nome_Produto" HeaderText="Produto" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Quantidade">
                        <%--<EditItemTemplate>
                            <asp:TextBox ID="txtQtdd" runat="server" Text='<%# Bind("Quantidade") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        <ItemTemplate>
                            <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantidade") %>'></asp:Label>--%>
                            <asp:TextBox ID="txtQtdd" runat="server" Width="50px" Text='<%# Bind("Quantidade") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Nome_Unidade" HeaderText="Unidade" />
                    <asp:TemplateField HeaderText="">                             
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Produto" HeaderText="ID" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#428bca" ForeColor="White" />
                <HeaderStyle BackColor="#428bca" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div> 
    <br />
    <br />
    <div class="row" style="padding-bottom:40px;">
         <div class="col-xs-6">
            <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar" class="btn btn-block btn-primary btn-lg" OnClick="btnAdicionar_Click"/>              
         </div>
         <div class="col-xs-6">
            <a href="Lista.aspx" class="btn btn-block btn-primary btn-lg">Finalizar</a>
         </div>
    </div>
</asp:Content>

