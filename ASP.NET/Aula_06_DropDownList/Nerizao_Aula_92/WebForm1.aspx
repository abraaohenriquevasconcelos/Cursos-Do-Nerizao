<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Nerizao_Aula_92.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    
        <asp:DropDownList ID="dropDownList_Cursos" runat="server" OnSelectedIndexChanged="dropDownListaCursos_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="1">ASP.NET</asp:ListItem>
            <asp:ListItem Value="2">C#</asp:ListItem>
        </asp:DropDownList>
    
        <p>
            <asp:Label ID="LabelCursos" runat="server" Text="Label"></asp:Label>
        </p>
        <asp:ListBox ID="ListBox_Cores" runat="server" OnSelectedIndexChanged="ListBoxCores_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="1">Azul</asp:ListItem>
            <asp:ListItem Value="2">Vermelho</asp:ListItem>
        </asp:ListBox>
    </form>
</body>
</html>
