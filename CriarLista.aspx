<%@ Page Title="Criar Lista" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CriarLista.aspx.cs" Inherits="CriarLista" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <script type="text/javascript" lang="javascript">

        function TextoPadrao(txt) {
            txt.value = (txt.value == txt.defaultValue) ? '' : txt.value; return true;
        } 
    </script>


    <h3>Criar Lista</h3>
        
    <div class="row" style="text-align:center;">
        <div class="col-md-4">
            <div style="padding:20px 0px 10px 0px;vertical-align:middle;">
                <asp:Label ID="lblcriarlista" runat="server"  Text="Nome da Lista:"></asp:Label>
            </div>
            <asp:TextBox ID="txtNomeLista" runat="server" Width="178px" ></asp:TextBox>
        </div>
         <div class="col-md-4">
             <div style="padding: 30px 0px 10px 0px;">
                 <asp:Label ID="lblAmigo" runat="server" Text="Compartilhar Lista com alguém?:"></asp:Label>
             </div>
             <div style="padding: 20px 0px 10px 0px;">
                 <asp:TextBox ID="txtFiltro" runat="server" Text="Digite um nome ou parte" onfocus="TextoPadrao(this);" Width="222px"></asp:TextBox>
                 <asp:Button ID="btnFiltro" runat="server" Text="Filtrar" class="btn btn-primary" Height="28px" Width="75px"  style="padding:0px;" OnClick="btnFiltro_Click"/>
             </div>
             <div>
                 <asp:DropDownList ID="ddlCompartilhar" runat="server" Height="35px" Width="250px"></asp:DropDownList>
                 <asp:Button ID="btnAddUsua" runat="server" Text="+" class="btn btn-primary" Height="28px" Width="51px"  style="padding:0px;" OnClick="btnAddUsua_Click" />
             </div>
             <div style="padding: 30px 0px 10px 0px;text-align:center;">
                 
                 <asp:GridView ID="grdAmigos" runat="server" horizontalalign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnRowDeleting="grdLista_RowDeleting" >
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
             </div>
         
         </div>        
        <div>
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>

        </div>
        <div class="col-md-4">
            <div style="padding: 40px 0px 10px 0px;">
                <a href="Default.aspx" class="btn btn-primary btn-lg" style="width: 125px">&laquo; Voltar </a>
                <%--<a href="Lista.aspx" class="btn btn-primary btn-lg" style="width: 125px">Seguir &raquo;</a>--%>
                <asp:Button ID="btnSeguir" runat="server" Text="Seguir &raquo;" class="btn btn-primary btn-lg" style="width: 125px;height:45px;" OnClick="btnSeguir_Click"/>
            </div> 
                        
        </div>
        
    </div>
</asp:Content>
