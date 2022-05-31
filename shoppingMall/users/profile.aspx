<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="shoppingMall.users.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script src="../js/form.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<form id="loginForm" runat="server" class="form">
		<div class="form-controller animation-1">
			<asp:TextBox
				ID="txEmail"
				runat="server"
				TextMode="Email"
				CssClass="checkForEmptyValue"
			></asp:TextBox>
			<asp:Label
				ID="lEmail"
				data-for_id="txEmail"
				runat="server"
				Text="Email"
				CssClass="form-label"
			></asp:Label>
		</div>
		<div class="form-controller error pseudoHide">
			<asp:RequiredFieldValidator
				ID="ReqEmail"
				runat="server"
				ErrorMessage="Email field is required"
				ControlToValidate="txEmail"
			></asp:RequiredFieldValidator>
		</div>
		<div class="form-controller error pseudoHide">
			<asp:RegularExpressionValidator
				ID="RegexEmail"
				runat="server"
				ErrorMessage="Email format is wrong"
				ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
				ControlToValidate="txEmail"
			></asp:RegularExpressionValidator>
		</div>

		<div class="form-controller animation-1">
			<asp:TextBox
				ID="txPassword"
				runat="server"
				TextMode="Password"
				CssClass="checkForEmptyValue"
			></asp:TextBox>
			<asp:Label
				ID="lPassword"
				data-for_id="txPassword"
				runat="server"
				Text="Password"
				CssClass="form-label"
			></asp:Label>
		</div>
		<div class="form-controller error pseudoHide">
			<asp:RequiredFieldValidator
				ID="ReqPassword"
				runat="server"
				ErrorMessage="Password field is required"
				ControlToValidate="txPassword"
			></asp:RequiredFieldValidator>
		</div>

		<div class="form-controller animation-1">
			<asp:Button
				ID="submitButton"
				runat="server"
				Text="Submit"
			/>
		</div>
	</form>
</asp:Content>
 