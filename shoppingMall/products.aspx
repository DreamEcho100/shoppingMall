<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="shoppingMall.products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
.products {
    width: 100%;
}
.products > tbody {
    width: 100%;
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: center;
}
.products > tbody td,
.products > tbody .img-container {
    width: clamp(10rem, 25vw, 15rem);
    aspect-ratio: 9/12;
}
.products > tbody .img-container img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}
.products > tbody .text-holder {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
</style>
		<link href="~/styles/globals.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" CssClass="products">
                <ItemTemplate>
                    <a href="/Product.aspx?id=<%# Eval("id") %>">
                        <div class="img-container">
                            <img src="<%# Eval("image") %>" alt=""/>
                        </div>
                        <div>
                            <p class="text-holder"><span><%# Eval("name") %></span> <span><%# Eval("brand") %></span> </p>
                            <p class="text-holder"><span><%# Eval("category") %></span> <span><strong>$<%# Eval("price") %></strong></span> </p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [name], [price], [image], [brand], [category] FROM [product]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
