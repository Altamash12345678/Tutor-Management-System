<%@ Page Title="" Language="C#" MasterPageFile="~/TMS_Site1.Master" AutoEventWireup="true" CodeBehind="tutor_signup.aspx.cs" Inherits="TMS_Project.tutor_signup" %>
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

                <h1 class="jumbotron bg-primary text-white text-center ">Tutor SignUp</h1>
               
            </div>
            
        </div>
        <div class="row">

            <div class="col-md-4">
                <asp:TextBox ID="nametxt" runat="server" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfv1" runat="server"
                ControlToValidate="nametxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage="name is required"  ForeColor="Red" />
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
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be within 20 to 80"
                    ControlToValidate="agetxt" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" MinimumValue="20" 
                     MaximumValue="80" Type="Integer"></asp:RangeValidator>
                
                 <br />
                 <asp:TextBox ID="emailtxt" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="emailtxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage="Email is required"  ForeColor="Red" />
                <asp:RegularExpressionValidator ID="rev1" ControlToValidate="emailtxt" ForeColor="Red"
                    SetFocusOnError="true" ErrorMessage=" Invalid Email"  runat="server"
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator> 
"
 
                <br />

                 <asp:DropDownList ID="Martialdrop" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Status</asp:ListItem>
                    <asp:ListItem>Single</asp:ListItem>
                    <asp:ListItem>Married</asp:ListItem>
                      <asp:ListItem>Engaged</asp:ListItem>
                      <asp:ListItem>Divorce</asp:ListItem>
                     <asp:ListItem>Seprated</asp:ListItem>
                     <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                ControlToValidate="Martialdrop" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" status is required"  ForeColor="Red"   InitialValue="Select Status"/>
                
                 </div>

            <div class="col-md-4">
             
              <asp:DropDownList ID="Countrydrop" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Countrydrop_SelectedIndexChanged">
               
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                ControlToValidate="Countrydrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage=" Country is required"  ForeColor="Red"   InitialValue="Select Country"/>
                <br />
                <asp:DropDownList ID="citydrop" runat="server" CssClass="form-control">
                  
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="citydrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage=" city is required"  ForeColor="Red"   InitialValue="Select City"/>
                  <br />
                 <asp:TextBox ID="adresstxt" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" Rows="6" Columns="50"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                ControlToValidate="adresstxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Address is required"  ForeColor="Red" />
                <br />
                
                  <asp:DropDownList ID="Qualificationdrop" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Qualification</asp:ListItem>
                    <asp:ListItem>Graduation</asp:ListItem>
                    <asp:ListItem>Masters</asp:ListItem>
                      <asp:ListItem>Mphil</asp:ListItem>
                      <asp:ListItem>Phd</asp:ListItem>
                      <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                ControlToValidate="Qualificationdrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage="Qualification is required"
                        ForeColor="Red"   InitialValue="Select Qualification"/>
               <br />
               

               
            </div>
            <div class="col-md-4">
                 <asp:TextBox ID="Degreetxt" runat="server" CssClass="form-control" placeholder="Enter Degree"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                ControlToValidate="Degreetxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Degree is required"  ForeColor="Red" />
                <br />
                 <asp:DropDownList ID="Experiencedrop" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Experience</asp:ListItem>
                    <asp:ListItem>1 year</asp:ListItem>
                    <asp:ListItem>2 years</asp:ListItem>
                      <asp:ListItem>3years</asp:ListItem>
                      <asp:ListItem>4 years</asp:ListItem>
                    <asp:ListItem>5 years</asp:ListItem>
                    <asp:ListItem>5+ years</asp:ListItem>
                    <asp:ListItem>8+ years</asp:ListItem>
                      <asp:ListItem>10+ years</asp:ListItem>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                ControlToValidate="Experiencedrop" SetFocusOnError="true" Display="Dynamic" 
                ErrorMessage="Experience  is required"
                        ForeColor="Red"   InitialValue="Select Experience"/>
                <br />
                <asp:TextBox ID="contacttxt" runat="server" CssClass="form-control" placeholder="Enter Cotactno."></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                ControlToValidate="contacttxt" SetFocusOnError="true" Display="Dynamic"
                ErrorMessage=" Cotactno is required"  ForeColor="Red" />
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
                <asp:Button ID="Tutorsignup" runat="server" Text="SignUp" CssClass=" btn btn-primary btn-block " OnClick="Tutorsignup_Click" />
            </div>

        </div>
        <br />
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
