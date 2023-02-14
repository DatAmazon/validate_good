<%--Họ tên: Kiều Đức Đạt - Mã SV: 18A10010175 - lớp : W021TH2022.002--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="ThucHanhWeb.Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .lbtLogin {
        }

        #sumLogin {
            margin-left: 200px;
        }

        .auto-style1 {
            margin-left: 184px;
        }
        #btnLogin{
            margin-left:100px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <h1>Đăng nhập người dùng</h1>
            <p>
                Tên truy cập: 
                &nbsp;&nbsp;
                <asp:TextBox ID="txtName" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rName" ControlToValidate="txtName"
                    ErrorMessage="Bạn phải nhập tên" ForeColor="Red" runat="server" Display="None" ValidationGroup="loginGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reguName" runat="server" ControlToValidate="txtName" ValidationExpression=".{3,}"
                    ErrorMessage="Tên tối thiểu phải 3 ký tự và không chứa ký tự đặc biệt" ForeColor="Red" ValidationGroup="loginGroup" Display="None"></asp:RegularExpressionValidator>
            </p>

            <p>
                Mật khẩu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPass" runat="server" Width="184px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rePass" runat="server" ControlToValidate="txtPass"
                    ErrorMessage="Mật khẩu không được để trống" ForeColor="Red" Display="None" ValidationGroup="loginGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reguPass" runat="server" ValidationExpression=".{3,}" Display="None"
                    ControlToValidate="TxtPass" ErrorMessage="Mật khẩu tối thiệu 3 ký tự" ForeColor="Red" ValidationGroup="loginGroup"></asp:RegularExpressionValidator>
            </p>

            <p>
                <asp:Label ID="lblErrorPass" runat="server" ForeColor="Red"></asp:Label>
            </p>

            <asp:ValidationSummary ID="sumLogin" runat="server" ForeColor="Red" HeaderText="" ValidationGroup="loginGroup" Width="599px" CssClass="auto-style1" />

            <p>
                <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" Width="91px" ValidationGroup="loginGroup" />
            </p>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="CreateAcc" runat="server" OnClick="CreateAcc_Click1">Đăng ký</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%--<asp:LinkButton ID="redirectTTin" runat="server" OnClick="redirectTTin_Click">Thêm tin</asp:LinkButton>--%>
                </p>
        </div>
    </form>
</body>
</html>
