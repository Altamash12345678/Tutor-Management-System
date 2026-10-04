<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site1.Master" AutoEventWireup="true" CodeBehind="student_signup.aspx.cs" Inherits="TMS_Project.student_signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .container {
           box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.15), 
            0px 8px 20px rgba(0, 0, 0, 0.25);
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <div class="container">
        <br />
        <div class="row">
            
            <div class="col-md-12">     

                <h1 class="jumbotron bg-primary text-white text-center ">Student SignUp</h1>
               
            </div>
            
        </div>
        <div class="row">

            <div class="col-md-4">
                <asp:TextBox ID="nametxt" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfv1" runat="server"
                ControlToValidate="nametxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage="name is required"  ForeColor="Red" />
                 <br />
                 <asp:TextBox ID="fathernametxt" runat="server" CssClass="form-control" placeholder="Enter Father Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="fathernametxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Father name is required"  ForeColor="Red" />
                  <br /> 
                <asp:TextBox ID="surenametxt" runat="server" CssClass="form-control" placeholder="Enter Surename"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="surenametxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Surename name is required"  ForeColor="Red" />
                 <br /> 
                <asp:DropDownList ID="genderdropdown" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="genderdropdown" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Gender is required"  ForeColor="Red"   InitialValue="Select Gender"/>
                 <br />
                 <asp:TextBox ID="agetxt" runat="server" CssClass="form-control" placeholder="Enter Age"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="agetxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Age is required"  ForeColor="Red" />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be within 5 to 60"
                    ControlToValidate="agetxt" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" MinimumValue="5" 
                     MaximumValue="60" Type="Integer"></asp:RangeValidator>
                
                 <br />
              <asp:DropDownList ID="Countrydrop" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Countrydrop_SelectedIndexChanged">
               
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                ControlToValidate="Countrydrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage=" Country is required"  ForeColor="Red"   InitialValue="Select Country"/>
                 </div>

            <div class="col-md-4">

                <asp:DropDownList ID="citydrop" runat="server" CssClass="form-control">
                  
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="citydrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage=" city is required"  ForeColor="Red"   InitialValue="Select City"/>
                  <br />
                 <asp:TextBox ID="adresstxt" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                ControlToValidate="adresstxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Address is required"  ForeColor="Red" />
                <br />
                 <asp:TextBox ID="standardtxt" runat="server" CssClass="form-control" placeholder="Enter Class"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                ControlToValidate="standardtxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Class is required"  ForeColor="Red" />
                <br />
                  <asp:DropDownList ID="Goingdrop" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Going To</asp:ListItem>
                    <asp:ListItem>School</asp:ListItem>
                    <asp:ListItem>College</asp:ListItem>
                      <asp:ListItem>Univerties</asp:ListItem>
                      <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                ControlToValidate="Goingdrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage=" Going is required"  ForeColor="Red"   InitialValue="Select Going To"/>
               <br />
                <asp:TextBox ID="subjecttxt" runat="server" CssClass="form-control" placeholder="Enter Subject"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                ControlToValidate="subjecttxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Subject is required"  ForeColor="Red" />
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="contacttxt" runat="server" CssClass="form-control" placeholder="Enter Cotactno."></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                ControlToValidate="contacttxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Cotactno is required"  ForeColor="Red" />
                  <br />
                 <asp:DropDownList ID="tuitiontypes" runat="server" CssClass="form-control">
                    <asp:ListItem>Select tuition types</asp:ListItem>
                    <asp:ListItem>Online</asp:ListItem>
                    <asp:ListItem>Offline</asp:ListItem>
                      </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                ControlToValidate="tuitiontypes" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" tuitiontypes is required"  ForeColor="Red"   InitialValue="Select tuition types"/>
                <br />
                 <asp:DropDownList ID="Tutorprefer" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Tutor Prefer</asp:ListItem>
                    <asp:ListItem>Graduate</asp:ListItem>
                    <asp:ListItem>Master</asp:ListItem>
                      <asp:ListItem>Phd</asp:ListItem>
                      <asp:ListItem>Other</asp:ListItem>
                      </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                ControlToValidate="Tutorprefer" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Tutor Prefer is required"  ForeColor="Red"   InitialValue="Select Tutor Prefer"/>
                <br />
                 <asp:TextBox ID="usernametxt" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                ControlToValidate="usernametxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Username is required"  ForeColor="Red" />
                 <br />
                 <asp:TextBox ID="Passwordtxt" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                ControlToValidate="Passwordtxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Password is required"  ForeColor="Red" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
    runat="server" 
    ErrorMessage="Please use a strong password" 
    ControlToValidate="Passwordtxt" 
    SetFocusOnError="true" 
    Display="Dynamic" 
        ForeColor="Red"
    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&^#_\-]).{8,}$">
</asp:RegularExpressionValidator>

                
                    <br />
                 <asp:TextBox ID="Cpassword" runat="server" CssClass="form-control" placeholder="Re-Enter Password" TextMode="Password"
                     oncopy="return false;" 
    oncut="return false;" 
    onpaste="return false;" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                ControlToValidate="Cpassword" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" CPassword is required"  ForeColor="Red" />
              
                <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red"
                     ErrorMessage="password & confirm password should be match"    ControlToValidate="Cpassword"  ControlToCompare="Passwordtxt"
                    Display="Dynamic" SetFocusOnError="true" 
                     
                    ></asp:CompareValidator>
                   </div>
       </div>
        <br />
        <div class="row">
            <div class="col-md-6  mx-auto" >
                <asp:Button ID="btnsignup" runat="server" Text="SignUp" CssClass=" btn btn-primary btn-block " OnClick="btnsignup_Click" />
           <br />
                 
                 </div>
           
        </div>
      
        <div class="row">
             <div class="col-md-6  mx-auto  text-center" >
            <a href="student_signup.aspx" class="btn btn-success">SignUp As Student</a>
             <a href="tutor_signup.aspx" class="btn btn-info">SignUp As Tutor</a>
            </div>
        </div>
        <br />
    </div>
    <br />
</asp:Content>
