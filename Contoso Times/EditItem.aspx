<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="EditItem.aspx.cs" Inherits="Contoso_Times.EditItem" validateRequest="false"   %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 

    <script type="text/javascript">
       
       function chkform() {
           if (checkTitle() && checkSubTitle() && checkBodyText())
           {
               return true;
           }
           else
           {
                return false;
           }
        }           

        function checkTitle()
        {
            var title = document.getElementById('txtTitle');
            var titleValidator = document.getElementById('titleValidator');
            if (title.value == "") {
                titleValidator.innerHTML = "<font color='red'> Title cannot be null</font>";
                title.focus();
                return false;
            }
            else {
                titleValidator.innerHTML = "";
                return true;
            }
        }

        function checkSubTitle() {
            var subtitle = document.getElementById('txtSubtitle');
            var subtitleValidator = document.getElementById('subTitleValidator');
            if (subtitle.value == "") {
                subTitleValidator.innerHTML = "<font color='red'> SubTitle cannot be null</font>";
                subtitle.focus();
                return false;
            }
            else {
                subtitleValidator.innerHTML = "";
                return true;
            }
        }

        function checkBodyText() {
            var bodytext = document.getElementById('txtBodyText');
            var bodytextvalidator = document.getElementById('bodyTextValidator');
            if (bodytext.value == "") {
                bodytextvalidator.innerHTML = "<font color='red'> Body Text cannot be null</font>";
                bodytext.focus();
                return false;
            }
            else {
                bodytextvalidator.innerHTML = "";
                return true;
            }
        }

    </script>


    <div id="loginregister" runat="server">
        <h2>Edit News</h2>
        <table border="0" cellpadding="0" cellspacing="0" runat="server">
            <tr>
                <td>Title                    
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Width="300px" ClientIDMode="Static" />
                    <br />
                    <br />
                </td>
                <td>
                   <span id="titleValidator"></span>
                </td>
            </tr>
            <tr>
                <td>Subtitle
                </td>
                <td>
                    <asp:TextBox ID="txtSubtitle" runat="server" Width="300px" ClientIDMode="Static" />
                    <br />
                    <br />
                </td>
                <td>
                   <span id="subTitleValidator"></span>
                </td>
            </tr>
            <tr>
                <td>BodyText
                </td>
                <td>
                    <asp:TextBox ID="txtBodyText" runat="server" TextMode="MultiLine" Columns="38" Rows="20" ClientIDMode="Static" />
                    <br />
                </td>
                <td>
                     <span id="bodyTextValidator"></span>                 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button Text="Update" runat="server" OnClick="UpdateNews" OnClientClick="return chkform();" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
