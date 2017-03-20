<%@ Page Title="Lista" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Lista.aspx.cs" Inherits="Lista" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-4" style="padding:10px 0px 10px 0px;">
        <asp:Button ID="btnBusca" runat="server" Text="Buscar Produto" CssClass="btn btn-primary" OnClick="btnBusca_Click" Width="113px" style="padding:5px;"/>
        <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar" CssClass="btn btn-primary"  Width="91px" OnClick="btnCadastro_Click" style="padding:5px;"/>
        <asp:Button ID="btnSelLista" runat="server" Text="Escolher  Lista" class="btn btn-primary" Width="104px" OnClick="btnSelLista_Click" style="padding:5px;"/>
    </div>
    
    <h3>Lista de Compra</h3>
        
    <div class="row" style="text-align:center;">
        
         <div class="col-md-4">
             <div style="padding: 30px 0px 10px 0px;">
                 <div style="padding: 30px 0px 10px 0px;" id="sel_lista" runat="server" visible="false">
                     <asp:DropDownList ID="ddlSel_lista" runat="server" Visible="false"></asp:DropDownList>
                     <asp:Button ID="btnAddUsua" runat="server" Text="ok" class="btn btn-primary" Height="28px" Width="51px"  style="padding:0px;" OnClick="btnAddUsua_Click" />
                     <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                 </div>
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
        
        <div class="col-md-4">
            <div style="padding:40px 0px 10px 0px;">
                    <a href="CriarLista.aspx" class="btn btn-primary btn-lg" style="width:125px">&laquo; Voltar </a>
                    <a href="Default.aspx" class="btn btn-primary btn-lg" style="width:125px"> Finalizar</a>
            </div>                         
        </div>        
    </div>
</asp:Content>
