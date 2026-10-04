<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site1.Master" AutoEventWireup="true" CodeBehind="Student_login.aspx.cs" Inherits="TMS_Project.Student_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="login.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
      <div class="login-page">
        <div class="login-box">
            <h2>Student Login</h2>
            <hr />

            <asp:TextBox ID="username" runat="server" placeholder="Enter username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server"
                ControlToValidate="username" ErrorMessage="Username is required" ForeColor="Red" />

            <asp:TextBox ID="Password" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv2" runat="server"
                ControlToValidate="Password" ErrorMessage="Password is required" ForeColor="Red" />

            <asp:Button ID="studlogin" runat="server" Text="Login" OnClick="studlogin_Click" />
            <br />
            <a href="tutor_login.aspx" class="text-center text-dark">Login As Tutor</a>
        </div>
    </div>
   

</asp:Content>
