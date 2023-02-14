<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeInfor.aspx.cs" Inherits="ThucHanhWeb.ChangeInfor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>hello</p>
        <div>
            <asp:Repeater ID="rptChangeInfor" runat="server" OnItemCommand="rptChangeInfor_ItemCommand">
                <ItemTemplate>
                    <div class="">
                        <a><asp:HiddenField ID="hfID" runat="server" Value='<%#Eval("PK_iUserID") %>' /></a>
                        <img class="avatarImage" src="<%#Eval("sImageAvatar") %>"/>
                        <a class="userName"><%#Eval("sUserName") %></a>
                    </div>
                </ItemTemplate>

            </asp:Repeater>
        </div>
    </form>
</body>
</html>
