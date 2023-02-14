<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Themtin.aspx.cs" Inherits="ThucHanhWeb.Themtin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #sumTTin {
            margin-left: 100px;
        }
        #changPass{
            padding-bottom: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTitle" runat="server" Text="Tiêu đề"></asp:Label>
            &nbsp;<asp:Label ID="errTittle" runat="server" Text="*" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="txtTitles" runat="server" Height="27px" Width="225px" OnTextChanged="txtTitles_TextChanged"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rTitle" ControlToValidate="txtTitles"
                ErrorMessage="Thiếu tiêu đề" ForeColor="Red" runat="server" Display="None" ValidationGroup="TTinGroup"> </asp:RequiredFieldValidator>

            <asp:Label ID="chooseImage" runat="server" Text="Ảnh"></asp:Label>
            <br />
            <asp:FileUpload runat="server" ID="Fuld" />
            &nbsp;
            <br />

            <asp:Label ID="lblDescrition" runat="server" Text="Mô tả"></asp:Label>
            &nbsp;<asp:Label ID="errDescript" runat="server" Text="*" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="txtDescript" runat="server" Height="27px" Width="228px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rDescript" ControlToValidate="txtDescript"
                ErrorMessage="Thiếu mô tả" ForeColor="Red" runat="server" Display="None" ValidationGroup="TTinGroup"> </asp:RequiredFieldValidator>

            <asp:Label ID="lblContent" runat="server" Text="Nội dung"></asp:Label>
            &nbsp;<asp:Label ID="errContent" runat="server" Text="*" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="txtContents" runat="server" Height="27px" Width="227px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rContent" ControlToValidate="txtContents"
                ErrorMessage="Thiếu nội dung" ForeColor="Red" runat="server" Display="None" ValidationGroup="TTinGroup"> </asp:RequiredFieldValidator>

            <asp:Label ID="txtCategories" runat="server" Text="Chuyên mục"></asp:Label>
            <br />
            <asp:ListBox ID="lstChuyenmuc" runat="server" Width="228px" OnSelectedIndexChanged="lstChuyenmuc_SelectedIndexChanged"></asp:ListBox>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <asp:ValidationSummary ID="sumTTin" runat="server" ValidationGroup="TTinGroup" ForeColor="Red" Height="47px" Width="389px" />

            <br />
            <asp:Button ID="btnAccept" runat="server" Text="Ghi nhận" ValidationGroup="TTinGroup" OnClick="btnAccept_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Bỏ qua" />
            &nbsp;
            &nbsp; 
            <asp:LinkButton ID="changPass" runat="server" OnClick="changPass_Click">Đổi mật khẩu</asp:LinkButton>
        </div>
    </form>
</body>
</html>
