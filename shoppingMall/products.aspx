<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="shoppingMall.products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
#DLProducts {
    width: 100%;
}
#DLProducts > tbody {
    width: 100%;
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: center;
}
#DLProducts > tbody td {
    padding: 0.5em;
    background: #fff;
    color: #333;
}
#DLProducts > tbody td,
#DLProducts > tbody .img-container {
    width: clamp(20rem, 25vw, 15rem);
    aspect-ratio: 9/12;
}
#DLProducts > tbody .img-container img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}
#DLProducts > tbody .text-holder {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
/**/
#DLProduct td {
    display: flex;
    gap: 5rem;
    padding: 0.5em;
    padding-top: 0;
    background: #fff;
    color: #222;
}
#DLProduct .info-1,
#DLProduct .info-2 {
    width: 50%;
}
#DLProduct > tbody .img-container {
    height: clamp(20rem, 40vw, 65rem);
    max-width: 100%;
    aspect-ratio: 12/10;
    margin: auto;
    background-color: #333;
}
#DLProduct > tbody .img-container img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}
#DLProduct .info-1 .text-holder {
    margin: 0.5em;
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
}
.AddProductToCartButton-container {
    width: 100%;
}
.AddProductToCartButton {
    width: 100%;
    background-color: #333;
    color: #fff;
    padding: 0.5em;
}
@media all and (max-width: 900px) {
    #DLProduct td {
        flex-direction: column;
    }
    #DLProduct .info-1, #DLProduct .info-2 {
        width: 100%;
        margin: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
}
</style>
		<link href="~/styles/globals.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
<%--        <div class="products-container">
            <asp:DataList ID="DLProducts" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" CssClass="products">
                <ItemTemplate>
                    <a href="/products.aspx?id=<%# Eval("id") %>">
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
        </div>--%>

        <asp:DataList
                ID="DLProduct"
                runat="server"
                OnItemCommand="ShowProductById"
                CssClass="product"
            >
                <ItemTemplate>
                    <div class="info-1">
                        <div class="img-container">
                            <img src="<%# DataBinder.Eval(Container.DataItem, "image") %>" alt=""/>
                        </div>
                        <div class="text-holder">
                            <p><strong>Category: </strong><%# DataBinder.Eval(Container.DataItem, "category") %></p>
                            <p><strong>Brand: </strong><%# DataBinder.Eval(Container.DataItem, "brand") %></p>
                            <p><strong>Price: </strong><%# DataBinder.Eval(Container.DataItem, "price") %></p>
                        </div>
                        <div class="AddProductToCartButton-container">
                            <asp:Button
                                ID="AddProductToCartButton"
                                CssClass="AddProductToCartButton"
                                runat="server"
                                Text="Add To cart" OnClick="AddProductToCartButton_Click"
                            />
                        </div>
                    </div>
                    <div class="info-1">
                        <header>
                            <h2><%# DataBinder.Eval(Container.DataItem, "name") %></h2>
                        </header>
                        <div class="description">
                            <%# DataBinder.Eval(Container.DataItem, "description") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

        <asp:DataList
                ID="DLProducts"
                runat="server"
                OnItemCommand="ShowProducts"
                CssClass="products"
            >
                <ItemTemplate>
                    <a href="/products.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id") %>">
                        <div class="img-container">
                            <img src="<%# DataBinder.Eval(Container.DataItem, "image") %>" alt=""/>
                        </div>
                        <div>
                            <p class="text-holder"><span><%# DataBinder.Eval(Container.DataItem, "name") %></span> <span><%# DataBinder.Eval(Container.DataItem, "brand") %></span> </p>
                            <p class="text-holder"><span><%# DataBinder.Eval(Container.DataItem, "category") %></span> <span><strong>$<%# DataBinder.Eval(Container.DataItem, "price") %></strong></span></p>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:DataList>

		
    </form>
</body>
</html>
