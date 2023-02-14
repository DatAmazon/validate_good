<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Infor.aspx.cs" Inherits="ThucHanhWeb.Infor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="rptInforGr" runat="server" OnItemDataBound="rptInforGr_ItemDataBound" OnItemCommand="rptInforGr_ItemCommand">
                <ItemTemplate>
                    <div class="">
                        <p>
                            <asp:HiddenField ID="hfID" runat="server" Value='<%#Eval("PK_iUserID") %>' />
                        </p>

                        <p class="userName"><%#Eval("sUserName") %></p>
                        <p>
                            <img class="avatar" src="<%#Eval("sImageAvatar") %>"></img></p>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="rptImg" runat="server">
                <ItemTemplate>
                    <p>
                        <img class="avatar" src="<%#Eval("sImageAvatar") %>"></img></p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
