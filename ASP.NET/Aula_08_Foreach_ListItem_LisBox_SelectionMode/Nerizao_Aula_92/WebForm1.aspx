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
        
        <%--O ASP.NET utiliza muitas tags web.controls que são processadas no servidor. Para resolver o problema o ASP.NET possui os server side comments, comentários a nível de servidor que podem 
            ser utilizados para fazer com que alguns web controls não sejam processados.
            
            A propriedade "SelectionMode=Multiple" é importante
        --%>
        <asp:ListBox ID="ListBox_Cores" runat="server" OnSelectedIndexChanged="ListBoxCores_SelectedIndexChanged" AutoPostBack="true" SelectionMode="Multiple">
            <asp:ListItem Value="1">Azul</asp:ListItem>
            <asp:ListItem Value="2">Vermelho</asp:ListItem>
             <asp:ListItem Value="2">Laranja</asp:ListItem>
        </asp:ListBox>

        <p>
            <asp:Button ID="Button_CoresSelecionadas" runat="server" BackColor="#00CC00" ForeColor="White" Height="23px" Text="Quais Cursos Selecionados" Width="183px" OnClick="Button_CoresSelecionadas_Click" />
        </p>

        <p>
            <asp:TextBox ID="TextBox_CoresSelecionadas" runat="server" BackColor="#CCCCFF" ForeColor="White" Height="172px" Width="173px"></asp:TextBox>
        </p>
    </form>
</body>
</html>
