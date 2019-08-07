<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Contoso_Times.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="loginregister">
        <h2>Existing members log in here </h2>
        <fieldset>        
            <asp:Login ID="Login1" Runat="server" PasswordLabelText="Password" UserNameLabelText="User Name" TextAlignment="Left" RememberMeText="Remember me next time" CreateUserText="Not a member? Create an account" CreateUserUrl="~/Register.aspx" OnAuthenticate="Login1_Authenticate" TitleText=""></asp:Login>
        </fieldset>
    </div>
</asp:Content>
