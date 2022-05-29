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
				background-color: #333;
						color: #eee;
				}
				td input[type="text"] {
						padding: 0.5em;
				}
				/*td a:contains("Cancel"){
						background-color: palevioletred;
						color: darkred;
						padding: 0.25em;
				}*/
				.CNP {
						border: 0.1rem solid black;
						padding: 0.5em;
						margin: 0.5em 0;
				}
				.CNPFormConatiner {
						display: flex;
						margin-bottom: 0.5em;
						gap: 0.5em;
						width: 100%;
						flex-wrap: wrap;
				}
				.CNPFormConatiner .form-input-controller {
						transition: all 0.3s ease-in-out;
				}
				.CNPFormConatiner:hover .form-input-controller:not(:hover,:focus,.noNothoverAnimation) {
						filter: opacity(0.5);
				}
				.CNPFormConatiner .form-input-controller input {
						border-bottom: 0.1rem solid black;
						padding: 0.25em 0.5em;
				}
				.CNPFormConatiner .form-submit-controller input {
					padding: 0.5em;
						background-color: #333;
						color: #eee;
				}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        
    <form id="form2" runat="server">
    <div class="CNP">
			<header>
				<h2>Add a New Product?</h2>
			</header>
        <div class="CNPFormConatiner">        
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
    <//div>
</form>
</asp:Content>
