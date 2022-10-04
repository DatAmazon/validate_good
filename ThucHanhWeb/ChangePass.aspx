<%--Họ tên: Kiều Đức Đạt - Mã SV: 18A10010175 - lớp : W021TH2022.002--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="ThucHanhWeb.ChangePass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #sumChangePass{
            margin-left: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Đổi mật khẩu</h1>
            <p>
                Nhập mật khẩu cũ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%--<asp:TextBox ID="txtOldPass" runat="server" Width="182px"></asp:TextBox>--%>

                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" Width="182px" ValidationGroup=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="reOldPass" runat="server" ControlToValidate="txtOldPass"  
                    ErrorMessage="Mật khẩu cũ không được để trống" ForeColor="Red" Display="None" ValidationGroup="changePassGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reguOldPass" runat="server" ValidationExpression=".{3,}"  Display="None"
                    ControlToValidate="txtOldPass" ErrorMessage="Mật khẩu tối thiểu 3 ký tự" ForeColor="Red" ValidationGroup="changePassGroup"></asp:RegularExpressionValidator>
            </p>

            <p>
                Nhập mật khẩu mới:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%--<asp:TextBox ID="txtNewPass" runat="server" Width="182px"></asp:TextBox>--%>

                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" Width="182px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reNewPass" runat="server" ControlToValidate="txtNewPass"
                    ErrorMessage="Bạn chưa nhập lại mật khẩu" ForeColor="Red" Display="None" ValidationGroup="changePassGroup" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reguNewPass" runat="server" ValidationExpression=".{3,}"
                    ControlToValidate="TxtNewPass" ErrorMessage="Mật khẩu tối thiểu 3 ký tự" ForeColor="Red" ValidationGroup="changePassGroup" Display="None"></asp:RegularExpressionValidator>
            </p>
            <p>
                Nhập lại mật khẩu mới:&nbsp;&nbsp;
            <%--<asp:TextBox ID="txtNewPassAgain" runat="server" Width="182px"></asp:TextBox>--%>

                <asp:TextBox ID="txtNewPassAgain" runat="server" TextMode="Password" Width="182px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reRePassAgain" runat="server" ControlToValidate="txtNewPassAgain"
                    ErrorMessage="Bạn chưa nhập lại mật khẩu" ForeColor="Red" Display="None" ValidationGroup="changePassGroup"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="comRePassAgain" runat="server" ForeColor="Red" ErrorMessage="Nhập lại mật khẩu chưa khớp"
                    ControlToCompare="txtNewPass" ControlToValidate="txtNewPassAgain" ValidationGroup="changePassGroup" Display="None"></asp:CompareValidator>
            </p>
            <p>
                <asp:ValidationSummary ID="sumChangePass" runat="server" ValidationGroup="changePassGroup" HeaderText="" ForeColor="red" Width="432px"/>
            <asp:Label ID="lblResultChangePass" runat="server"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnChangePass" runat="server" OnClick="btnChangePass_Click" Text="Đổi mật khẩu" Width="105px" ValidationGroup="changePassGroup" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnLogin" runat="server" PostBackUrl="~/Dangnhap.aspx">Đăng nhập</asp:LinkButton>
        </div>
    </form>
</body>
</html>
