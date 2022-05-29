<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="shoppingMall.admin.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<link rel="stylesheet" href="~/../../styles/table.css" type="text/css" />
		<link rel="stylesheet" href="~/../../styles/form2.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <div class="form2">
                <header>
                    <h2>Add a New Product?</h2>
                </header>
            <div class="form-conatiner">        
                <div class='form-input-controller'>
                    <label for='tBName'>Name</label>
                    <asp:TextBox
                        ID="tBCNPName"
                        runat="server"
                    ></asp:TextBox>
                </div>
                <div class='form-input-controller'>
                    <label for='tBPrice'>Price</label>
                    <asp:TextBox
                        ID="tBCNPPrice"
                        runat="server"
                        TextMode="Number"
                        step="any"
                    ></asp:TextBox>
                </div>
                <div class='form-input-controller'>
                    <label for='tBImage'>Image</label>
                    <asp:TextBox
                        ID="tBCNPImage"
                        runat="server"
                    ></asp:TextBox>
                </div>
                <div class='form-input-controller'>
                    <label for='tBDescription'>Description</label>
                    <asp:TextBox
                        ID="tBCNPDescription"
                        runat="server"
                    ></asp:TextBox>
                </div>
                <div class='form-input-controller'>
                    <label for='tBCountInStock'>CountInStock</label>
                    <asp:TextBox
                        ID="tBCNPCountInStock"
                        runat="server"
                        TextMode="Number"
                    ></asp:TextBox>
                </div>
                <div class='form-input-controller'>
                    <label for='tBBrand'>Brand</label>
                    <asp:TextBox
                        ID="tBCNPBrand"
                        runat="server"
                    ></asp:TextBox>
                </div>
                <div class='form-input-controller'>
                    <label for='tBCategory'>Category</label>
                    <asp:TextBox
                        ID="tBCNPCategory"
                        runat="server"
                    ></asp:TextBox>
                </div>

                <div class="form-submit-controller noNothoverAnimation">
                    <asp:Button ID="CreateNewProductButton" runat="server" Text="Create" OnClick="CreateNewProductButton_Click" />
                </div>
            </div>
            <div>
                <asp:Label ID="LCNPSuccess" runat="server" Text=""></asp:Label>
                <asp:Label ID="LCNPError" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div>
            <asp:DropDownList ID="DDLProductsCategories" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [category] FROM [product]"></asp:SqlDataSource>
        </div>
        <div class="tableContainer">
            <asp:GridView ID="gVProductsList" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
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
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [product] WHERE [id] = @id" InsertCommand="INSERT INTO [product] ([name], [price], [image], [description], [countInStock], [brand], [category], [createdAt]) VALUES (@name, @price, @image, @description, @countInStock, @brand, @category, @createdAt)" SelectCommand="SELECT * FROM [product] WHERE ([category] = @category)" UpdateCommand="UPDATE [product] SET [name] = @name, [price] = @price, [image] = @image, [description] = @description, [countInStock] = @countInStock, [brand] = @brand, [category] = @category, [createdAt] = @createdAt WHERE [id] = @id">
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
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLProductsCategories" Name="category" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="countInStock" Type="Int32" />
                    <asp:Parameter Name="brand" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="createdAt" Type="DateTime" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
