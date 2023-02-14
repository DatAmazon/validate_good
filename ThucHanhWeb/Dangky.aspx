<%--Họ tên: Kiều Đức Đạt - Mã SV: 18A10010175 - lớp : W021TH2022.002--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="ThucHanhWeb.Dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #sumResgister {
            margin-left: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Đăng ký người dùng</h1>
            <p>
                Tên truy cập: 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtName" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtName" ErrorMessage="Bạn phải nhập tên"
                    ForeColor="Red" Display="None" ValidationGroup="resgisterGroup"></asp:RequiredFieldValidator>
                <%--               <asp:RegularExpressionValidator ID="reguName" runat="server" ControlToValidate="txtName" ValidationExpression="[a-zA-Z][a-zA-Z0-9]{2,3}"
                    ErrorMessage="Tối thiểu phải 3 ký tự và không chứa ký tự đặc biệt" ForeColor="Red" ValidationGroup="resgisterGroup"  Display="None"></asp:RegularExpressionValidator>--%>
                <asp:RegularExpressionValidator ID="reguName" runat="server" ValidationExpression=".{3,}" Display="None"
                    ControlToValidate="txtName" ErrorMessage="Tài khoản tối thiểu 3 ký tự" ForeColor="Red" ValidationGroup="resgisterGroup"></asp:RegularExpressionValidator>
            </p>
            <p>
                Mật khẩu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%--<asp:TextBox ID="txtPass" runat="server" Width="184px" TextMode="Password"></asp:TextBox>--%>

                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rePass" runat="server" ControlToValidate="txtPass"
                    ErrorMessage="Mật khẩu không được để trống" ForeColor="Red" Display="None" ValidationGroup="resgisterGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reguPass" runat="server" ValidationExpression=".{3,}" Display="None"
                    ControlToValidate="TxtPass" ErrorMessage="Mật khẩu tối thiểu 3 ký tự" ForeColor="Red" ValidationGroup="resgisterGroup"></asp:RegularExpressionValidator>
            </p>
            <p>
                Nhập lại mật khẩu:&nbsp;
                <%--<asp:TextBox ID="txtRePass" runat="server" Width="184px" TextMode="Password"></asp:TextBox>--%>

                <asp:TextBox ID="txtRePass" runat="server" TextMode="Password" Width="182px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reRePass" runat="server" ControlToValidate="txtRePass"
                    ErrorMessage="Bạn chưa nhập lại mật khẩu" ForeColor="Red" Display="None" ValidationGroup="resgisterGroup"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="comRePass" runat="server" ForeColor="Red" ErrorMessage="Nhập lại mật khẩu chưa khớp"
                    ControlToCompare="txtPass" ControlToValidate="txtRePass" ValidationGroup="resgisterGroup" Display="None"></asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="lblErrorPass" runat="server" ForeColor="Red"></asp:Label>
            </p>
            <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="resgisterGroup" HeaderText="" ForeColor="Red" Width="450px" />
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;<asp:Button ID="btnResgister" runat="server" Text="Đăng ký" OnClick="btnResgister_Click" Width="89px" ValidationGroup="resgisterGroup" />
                &nbsp;
                &nbsp;&nbsp;
                <asp:LinkButton ID="lbtLogin" runat="server" Text="Đăng nhập" Width="90px" OnClick="lbtLogin_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        </div>

    </form>


    <script>
        function chuyen() {
            // location.href("Dangnhap.aspx");
        }
    </script>
</body>
</html>
