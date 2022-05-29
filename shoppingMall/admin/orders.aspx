<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="shoppingMall.admin.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="~/../../styles/table.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="tableContainer">
            <div>
                <asp:Label ID="LCNPUodateDeliveryDateSuccess" runat="server" Text=""></asp:Label>
                <asp:Label ID="LCNPUodateDeliveryDateError" runat="server" Text=""></asp:Label>
            </div>
            <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="id" ID="GVOrders" OnRowCommand="GVOrders_RowCommand"  DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="memberId" HeaderText="memberId" SortExpression="memberId" />
                    <asp:BoundField DataField="shippingAddress" HeaderText="shippingAddress" SortExpression="shippingAddress" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="paymentMethod" HeaderText="paymentMethod" SortExpression="paymentMethod" />
                    <asp:BoundField DataField="itemsPrice" HeaderText="itemsPrice" SortExpression="itemsPrice" />
                    <asp:BoundField DataField="shippingPrice" HeaderText="shippingPrice" SortExpression="shippingPrice" />
                    <asp:BoundField DataField="paidAt" HeaderText="paidAt" SortExpression="paidAt" />
                    <asp:BoundField DataField="deliveredAt" HeaderText="deliveredAt" SortExpression="deliveredAt" />
                    <asp:BoundField DataField="createdAt" HeaderText="createdAt" SortExpression="createdAt" />
                    <asp:ButtonField ButtonType="Button" CommandName="UpdateDeliveryDate" HeaderText="Delivery Date" ShowHeader="True" Text="Update" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [memberId], [shippingAddress], [city], [paymentMethod], [itemsPrice], [shippingPrice], [paidAt], [deliveredAt], [createdAt] FROM [order]"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
