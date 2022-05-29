<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="members.aspx.cs" Inherits="shoppingMall.admin.members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<link rel="stylesheet" href="~/../../styles/table.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<form id="form1" runat="server">
    <div class="tableContainer">
	    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                <asp:BoundField DataField="profilePicture" HeaderText="profilePicture" SortExpression="profilePicture" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="dateOfBirth" HeaderText="dateOfBirth" SortExpression="dateOfBirth" />
                <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" />
                <asp:BoundField DataField="createdAt" HeaderText="createdAt" SortExpression="createdAt" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [member] WHERE [id] = @id" InsertCommand="INSERT INTO [member] ([firstName], [lastName], [userName], [profilePicture], [email], [sex], [dateOfBirth], [role], [createdAt]) VALUES (@firstName, @lastName, @userName, @profilePicture, @email, @sex, @dateOfBirth, @role, @createdAt)" SelectCommand="SELECT [id], [firstName], [lastName], [userName], [profilePicture], [email], [sex], [dateOfBirth], [role], [createdAt] FROM [member]" UpdateCommand="UPDATE [member] SET [firstName] = @firstName, [lastName] = @lastName, [userName] = @userName, [profilePicture] = @profilePicture, [email] = @email, [sex] = @sex, [dateOfBirth] = @dateOfBirth, [role] = @role, [createdAt] = @createdAt WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="profilePicture" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateOfBirth" />
                    <asp:Parameter Name="role" Type="String" />
                    <asp:Parameter Name="createdAt" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="profilePicture" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter DbType="Date" Name="dateOfBirth" />
                    <asp:Parameter Name="role" Type="String" />
                    <asp:Parameter Name="createdAt" Type="DateTime" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
