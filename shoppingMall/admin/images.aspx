<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="images.aspx.cs" Inherits="shoppingMall.admin.images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="registerForm" runat="server">
        <div>
            <asp:DropDownList ID="DDLPaths" runat="server">
                <asp:ListItem>products</asp:ListItem>
                <asp:ListItem>users</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="uploadProductsImages">
            <div class="form-input-controller">
                <label for="FUImage">Upload Product Images</label>
                <asp:FileUpload ID="FUImage" runat="server" />
            </div>
            <asp:Button ID="uploadImageButton" runat="server" Text="Button" OnClick="uploadImageButton_Click"  />
            <div>
                <asp:Label ID="LUploadImageSuccess" runat="server" Text=""></asp:Label>
                <asp:Label ID="LUploadImageError" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>
