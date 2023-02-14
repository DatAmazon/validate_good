<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doimatkhau.aspx.cs" Inherits="ThucHanhWeb.Doimatkhau" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #sumChangePass{
            margin-left:100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="title">
                <asp:Label ID="lbltitle" runat="server" Text="Đổi mật khẩu" />
            </h1>
            <p class="title">
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </p>

            <p class="input">
                <asp:Label ID="Label2" runat="server" Text="Nhập mật khẩu cũ: " Width="140px"></asp:Label>
                <asp:TextBox ID="txtOldPass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="roldPass" ControlToValidate="txtOldPass"
                    ErrorMessage="Bạn phải mật khẩu cũ" ForeColor="Red" runat="server" Display="None" ValidationGroup="groupChangePass"></asp:RequiredFieldValidator>
            </p>

            <p class="input">
                <asp:Label ID="Label3" runat="server" Text="Nhập mật khẩu mới: " Width="140px"></asp:Label>
                <asp:TextBox ID="txtNewPass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNewPass"
                    ErrorMessage="Bạn phải mật khẩu mới" ForeColor="Red" runat="server" Display="None" ValidationGroup="groupChangePass"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblRes" runat="server" ForeColor="BlueViolet"></asp:Label>
            </p>
                <asp:ValidationSummary ID="sumChangePass" runat="server" ForeColor="Red" HeaderText=""
                    ValidationGroup ="groupChangePass" Width="442px" Height="52px"/>
            <p>
                <asp:Button ID="btnDoiMatKhau" runat="server" Text="Đổi mật khẩu" ValidationGroup ="groupChangePass" OnClick="btnDoiMatKhau_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThemTin" runat="server" Text="Chuyển đến trang thêm tin" Width="205px" OnClick="btnThemTin_Click" />
            </p>
            <asp:Label ID="Label1x" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
