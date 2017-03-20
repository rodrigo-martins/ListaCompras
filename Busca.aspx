<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Busca.aspx.cs" Inherits="Busca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<div class="col-md-4" style="padding:10px 0px 10px 0px;">
        <asp:Button ID="btnBusca" runat="server" Text="Buscar" CssClass="btn btn-primary"  Width="101px" />
        <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar" CssClass="btn btn-primary"  Width="103px" />
    </div>--%>
    
    <h3>Busca de Produtos</h3>
        
    <div class="row" style="text-align: center;">

        <div class="col-md-4">
            <div style="padding:20px 0px 10px 0px;vertical-align:middle;">
                <asp:Label ID="lblcriarlista" runat="server"  Text="Nome:"></asp:Label>
            </div>
            <asp:TextBox ID="txtNomeLista" runat="server" Width="178px" style="vertical-align:middle;" ></asp:TextBox>
            <asp:Button ID="btnNomeIr" runat="server" Text="Ir &raquo;" class="btn btn-primary " style="height:27px;width:56px;padding:2px 12px;" OnClick="btnNomeIr_Click"/>
        </div>
         <div class="col-md-4" style="padding: 30px 0px 10px 0px;">
             <div>
                 Ou
             </div>
             <div style="padding: 30px 0px 10px 0px;">
                 <asp:Label ID="lblCategoria" runat="server" Text="Categoria:"></asp:Label>
             </div>
             <div>
                 <asp:DropDownList ID="ddlCategoria" runat="server" Width="242px" ></asp:DropDownList>
             </div>
             <div style="padding: 30px 0px 10px 0px;text-align:center;">
                 <asp:GridView ID="grdProdutos" runat="server" CellPadding="4" ForeColor="#333333" horizontalalign="Center" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="Ainda não tem itens!" >
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
                         <asp:BoundField DataField="Nome_Unidade" HeaderText="Tipo Unidade" />
                         <asp:TemplateField HeaderText="Selecionar">                             
                             <ItemTemplate>
                                 <asp:CheckBox ID="CheckBox1" runat="server" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField DataField="ID_Produto" HeaderText="ID" />
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
            <div style="padding: 40px 0px 10px 0px;">  
                <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar" class="btn btn-primary btn-lg" style="width: 125px" OnClick="btnAdicionar_Click"/>              
                <a href="Lista.aspx" class="btn btn-primary btn-lg" style="width: 125px">Finalizar</a>
            </div>
        </div>
    </div>



</asp:Content>

