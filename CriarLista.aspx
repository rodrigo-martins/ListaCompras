<%@ Page Title="Criar Lista" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CriarLista.aspx.cs" Inherits="CriarLista" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" lang="javascript">

        function TextoPadrao(txt) {
            txt.value = (txt.value == txt.defaultValue) ? '' : txt.value; return true;
        }
    </script>
    <h3>Criar Lista</h3>
    <div class="row">
        <div class="col-xs-12">
            <div class="form-group">
                <asp:Label ID="lblcriarlista" runat="server" Text="Nome da Lista:"></asp:Label>
                <asp:TextBox ID="txtNomeLista" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-xs-12">
            <asp:Label ID="lblAmigo" runat="server" Text="Compartilhar Lista com alguém?"></asp:Label>
            <div class="row">
                <div class="col-xs-8">
                    <div class="form-group">
                        <asp:TextBox ID="txtFiltro" runat="server" Text="Digite um nome ou parte" onfocus="TextoPadrao(this);" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-xs-4 pull-right">
                    <asp:Button ID="btnFiltro" runat="server" Text="Filtrar" class="btn btn-primary btn-block" OnClick="btnFiltro_Click" />
                </div>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-9">
                    <asp:GridView ID="grdAmigos" runat="server" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnRowDeleting="grdLista_RowDeleting">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField HeaderText="Excluir" CancelText="Cancelar" DeleteText="Excluir" ShowDeleteButton="True" ShowHeader="True" InsertVisible="False" />
                            <asp:BoundField DataField="Nome_Usuario" HeaderText="Amigo" ReadOnly="True" />
                            <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" />
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
                    <asp:DropDownList ID="ddlCompartilhar" runat="server" class="form-control"></asp:DropDownList>
                </div>
                <div class="col-xs-3 ">
                    <asp:Button ID="btnAddUsua" runat="server" Text=" + " class="btn btn-primary btn-block" OnClick="btnAddUsua_Click" />
                </div>
            </div>
        </div>
        <div class="col-xs-12">
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
        </div>
        <div class="col-xs-12 nav-btn-bottom">
            <div class="row">
                <div class="col-xs-6">
                    <a href="Default.aspx" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-arrow-left"></span> Voltar </a>
                </div>
                <div class="col-xs-6">
                    <asp:Button ID="btnSeguir" runat="server" Text="Seguir &raquo;" class="btn btn-primary btn-block" OnClick="btnSeguir_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
