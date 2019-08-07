<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsItemsBulletedList.ascx.cs" Inherits="Contoso_Times.NewsItemsBulletedList" %>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllNewsItemsInCategory" TypeName="News">
    <SelectParameters>
        <asp:Parameter Name="CategoryID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:Repeater ID="Repeater1" DataSourceID="ObjectDataSource1" Runat="server">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li><asp:HyperLink ID="HyperLink1" Text='<%# Eval ("Title") %>' NavigateUrl='<%# "ShowItem.aspx?ItemID=" + Eval ("ItemID") %>' Runat="server" /></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>