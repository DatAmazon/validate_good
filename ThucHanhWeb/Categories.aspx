<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ThucHanhWeb.Categories" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3 id="chude" runat="server"></h3>
            <asp:Repeater ID="rptNews" runat="server">
                <ItemTemplate>
                    <ul>
                        <li>
                            <img class="image" src="<%#Eval("sThumbnail")%>"/>
                            <a href="Articles.aspx?NewsID = <%#Eval("pk_iNewsID") %>"><%# Eval("sTitle") %></a>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
