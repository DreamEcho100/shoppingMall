<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="productsList.aspx.cs" Inherits="shoppingMall.admin.productsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tableContainer {
            max-width: 100%;
            overflow-x: auto;
        }
        table {
          font-family: Arial, Helvetica, sans-serif;
          border-collapse: collapse;
          width: 100%;
        }
th, td {
  padding: 15px;
  text-align: left;
}
th, td {
  border-bottom: 1px solid #ddd;
}
td, th {
  border: 1px solid #ddd;
  padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2;}
tr:hover {background-color: #ddd;}
th {
  background-color: #04AA6D;
  color: white;
}
td input[type="text"] {
    padding: 0.5em;
}
/*td a:contains("Cancel"){
    background-color: palevioletred;
    color: darkred;
    padding: 0.25em;
}*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [product]"></asp:SqlDataSource>
    </div>
        <div class="tableContainer">
            <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="countInStock" HeaderText="countInStock" SortExpression="countInStock" />
                    <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="createdAt" HeaderText="createdAt" SortExpression="createdAt" />
                    <asp:BoundField DataField="updateAt" HeaderText="updateAt" SortExpression="updateAt" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [product] WHERE [id] = @id" InsertCommand="INSERT INTO [product] ([name], [price], [image], [description], [countInStock], [brand], [category], [createdAt], [updateAt]) VALUES (@name, @price, @image, @description, @countInStock, @brand, @category, @createdAt, @updateAt)" SelectCommand="SELECT [id], [name], [price], [image], [description], [countInStock], [brand], [category], [createdAt], [updateAt] FROM [product] WHERE ([category] = @category)" UpdateCommand="UPDATE [product] SET [name] = @name, [price] = @price, [image] = @image, [description] = @description, [countInStock] = @countInStock, [brand] = @brand, [category] = @category, [createdAt] = @createdAt, [updateAt] = @updateAt WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="countInStock" Type="Int32" />
            <asp:Parameter Name="brand" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="createdAt" Type="DateTime" />
            <asp:Parameter Name="updateAt" Type="DateTime" />
        </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="category" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="countInStock" Type="Int32" />
            <asp:Parameter Name="brand" Type="String" />
<asp:Parameter Name="category" Type="String"></asp:Parameter>
            <asp:Parameter Name="createdAt" Type="DateTime" />
            <asp:Parameter Name="updateAt" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
</form>
</asp:Content>
