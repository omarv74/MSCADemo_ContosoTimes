<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Contoso_Times.Default" %>
<%@ Register TagPrefix="uc1" TagName="NewsItemsBulletedList" Src="NewsItemsBulletedList.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server">
    <a name="startcontent" id="startcontent"></a>
    <div id="home">
        <table width="581"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="homephotos homephotosnewssports local"><h2>Local news </h2></td>
            <td><img src="images/spacer.gif" alt="" width="8" /></td>
            <td class="homephotos homephotosnewssports national"><h2>National news </h2></td>
            <td><img src="images/spacer.gif" alt="" width="8" /></td>
            <td class="homephotos homephotosnewssports world"><h2>World news </h2></td>
          </tr>
          <tr>
            <td valign="top" class="homephotosnewssports">
                <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList1" CategoryID="0" Runat="server" />
            </td>
            <td></td>
            <td valign="top" class="homephotosnewssports">
                <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList2" CategoryID="1" Runat="server" />
            </td>
            <td></td>
            <td valign="top" class="homephotosnewssports">
                <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList3" CategoryID="2" Runat="server" />
            </td>
          </tr>
        </table>
        <table width="581"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="homephotos homephotosnewssports baseball" ><h2>Baseball</h2></td>
            <td><img src="images/spacer.gif" alt="" width="8" /></td>
            <td class="homephotos homephotosnewssports basketball" ><h2>Basketball</h2></td>
            <td><img src="images/spacer.gif" alt="" width="8" /></td>
            <td class="homephotos homephotosnewssports football"><h2>Football</h2></td>
          </tr>
          <tr>
            <td valign="top" class="homephotosnewssports">
                <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList4"  CategoryID="3" Runat="server" />
            </td>
            <td></td>
            <td valign="top" class="homephotosnewssports">
                <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList5"  CategoryID="4" Runat="server" />
            </td>
            <td></td>
            <td valign="top" class="homephotosnewssports">
                <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList6"  CategoryID="5" Runat="server" />
            </td>
          </tr>
        </table>
        <table width="581" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ECECEC">
          <tr>
            <td width="20"><img src="images/home_corner_tl.gif" alt="" width="20" height="20" /></td>
            <td width="541" style="border-top:#a9a9a9 1px solid">&nbsp;</td>
            <td width="20" align="right"><img src="images/home_corner_tr.gif" alt="" width="20" height="20" /></td>
          </tr>
          <tr>
            <td width="20" style="border-left:#a9a9a9 1px solid">&nbsp;</td>
            <td width="541"><h3>Members Only&nbsp; </h3>
              <asp:LoginView ID="LoginView1" Runat="server">
                <AnonymousTemplate>
                  <a href="Register.aspx">Become a member now!</a>
                </AnonymousTemplate>
                <LoggedInTemplate>
                  Welcome back,&nbsp;<asp:LoginName ID="LoginName1" Runat="server" />!
                </LoggedInTemplate>
              </asp:LoginView>
              <br /><br />
              <table border="0" align="center" cellpadding="0" cellspacing="0"><tr>
                  <td class="homephotos homephotosmembers travel" ><h4>Travel</h4></td>
                  <td><img src="images/spacer.gif" alt="" width="8" /></td>
                  <td class="homephotos homephotosmembers entertainment" ><h4>Entertainment</h4></td>
                  <td><img src="images/spacer.gif" alt="" width="8" /></td>
                  <td class="homephotos homephotosmembers technology" ><h4>Technology</h4></td>
                </tr>
                <tr>
                  <td valign="top" class="homephotosmembers">
                    <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList7"  CategoryID="6" Runat="server" />
                  </td>
                  <td></td>
                  <td valign="top" class="homephotosmembers">
                    <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList8"  CategoryID="7" Runat="server" />
                  </td>
                  <td></td>
                  <td valign="top" class="homephotosmembers">
                    <uc1:NewsItemsBulletedList ID="NewsItemsBulletedList9"  CategoryID="8" Runat="server" />
                  </td>
                </tr></table></td>
            <td width="20" style="border-right:#a9a9a9 1px solid">&nbsp;</td>
          </tr>
          <tr>
            <td width="20"><img src="images/home_corner_bl.gif" alt="" width="20" height="20" /></td>
            <td width="541" style="border-bottom:#a9a9a9 1px solid">&nbsp;</td>
            <td width="20" align="right"><img src="images/home_corner_br.gif" alt="" width="20" height="20" /></td>
          </tr>
        </table>
      <p></p>
    </div>
</asp:Content>
