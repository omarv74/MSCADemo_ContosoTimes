<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="Contoso_Times.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <div id="articles">
        <h2><asp:Label ID="Label1" Runat="server" /></h2>
        <asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="News" SelectMethod="GetAllNewsItemsInCategory">
            <SelectParameters>
                <asp:QueryStringParameter Name="CategoryID" DefaultValue="-1" QueryStringField="CategoryID" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Repeater ID="Repeater1" Runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <h3><asp:Label ID="Title" Text='<%# Eval ("Title") %>' Runat="server" /></h3>
                <p><asp:Label ID="TeaserText" Text='<%# NewsItem.GetTeaserText ((string) Eval ("BodyText")) %>' Runat="server" /></p>
                <div class="readmore">
                    <asp:HyperLink ID="HyperLink1" Runat="server" NavigateUrl='<%# "~/ShowItem.aspx?ItemID=" + Eval ("ItemID") %>'>Read more...</asp:HyperLink>
                </div>
                <p>&nbsp;</p>
            </ItemTemplate>
            <FooterTemplate>
                <p>&nbsp;</p>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
