<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowItem.aspx.cs" Inherits="Contoso_Times.ShowItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="article">
        <h2><asp:Label ID="Label1" Runat="server" /></h2>
        <asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="News" SelectMethod="GetNewsItem">
            <SelectParameters>
                <asp:QueryStringParameter Name="ItemID" DefaultValue="-1" QueryStringField="ItemID" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Repeater ID="Repeater1" Runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <h3><asp:Label ID="Title" Text='<%# Eval ("Title") %>' Runat="server" /></h3>
                <h4><asp:Label ID="Subtitle" Text='<%# Eval ("Subtitle") %>' Runat="server" /></h4>
                <br />
                <asp:Label ID="BodyText" Text='<%# Eval ("BodyText") %>' Runat="server" />             
            </ItemTemplate>
            <FooterTemplate>
                <p> 
                    <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("~/EditItem.aspx?ItemID={0}", Request["ItemID"]) %>' Text="Edit" />
                </p>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
