<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recent.aspx.cs" Inherits="Contoso_Times.MembersOnly.Recent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <div id="articles">
        <asp:Repeater ID="Repeater1" Runat="server">
            <ItemTemplate>
                <h3><asp:Label ID="Title" Text='<%# Eval ("Title") %>' Runat="server" /></h3>
                <p><asp:Label ID="TeaserText" Text='<%# Eval ("TeaserText") %>' Runat="server" /></p>
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
