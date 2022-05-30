<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs"
Inherits="shoppingMall.Register" %>

<!DOCTYPE html>
<script>
	document.addEventListener('DOMContentLoaded', (event) => {
		const registerForm = document.getElementById('registerForm');
		const registerFormTextBoxes = registerForm.querySelectorAll(
			'.checkForEmptyValue'
		);
		const registerFormLabels = registerForm.querySelectorAll('.form-label');

		const isClassListContainingIsEmpty = (elem) => {
			if (elem.value.trim().length === 0) {
				// event.target.class
				elem.classList.add('isEmpty');
			} else if (elem.classList.contains('isEmpty')) {
				elem.classList.remove('isEmpty');
			}
		};

		const initPage = () => {
			registerFormTextBoxes[0]?.focus();

			registerFormTextBoxes.forEach((tx) => {
				isClassListContainingIsEmpty(tx);
			});
		};

		initPage();

		registerFormTextBoxes.forEach((tx) => {
			tx.addEventListener('input', (event) => {
				if (event.target.value.length === 0) {
					// event.target.class
					tx.classList.add('isEmpty');
				} else if (tx.classList.contains('isEmpty')) {
					tx.classList.remove('isEmpty');
				}
			});
		});

		registerFormLabels.forEach((label) => {
			label.addEventListener('click', (event) => {
				const elem = document.getElementById(label.dataset.for_id);
				elem.focus();
			});
		});

		registerForm.addEventListener('submit', (event) => {
			document
				.querySelectorAll('.form-controller.error span')
				.forEach((elem) => {
					if (getComputedStyle(elem).visibility === 'visible') {
						if (elem.parentElement.classList.contains('pseudoHide')) {
							elem.parentElement.classList.remove('pseudoHide');
						}
					} else {
						if (!elem.parentElement.classList.contains('pseudoHide')) {
							elem.parentElement.classList.add('pseudoHide');
						}
					}
				});
		});
	});
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initPageial-scale=1.0" />
		<title>Register</title>
		<link href="~/styles/globals.css" type="text/css" rel="stylesheet" />
		<link href="~/styles/loginStyles.css" type="text/css" rel="stylesheet" />
		<link href="~/styles/form.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<main>
			<section class="form-section">
				<header>
					<h1>To Register, fill in the following fields then click submit</h1>
				</header>
				<form id="registerForm" runat="server" class="form">
					<div class="form-controller animation-1">
						<asp:TextBox
							ID="txFirstName"
							runat="server"
							CssClass="checkForEmptyValue"
						></asp:TextBox>
						<asp:Label
							ID="lFirstName"
							data-for_id="txFirstName"
							runat="server"
							Text="First Name"
							CssClass="form-label"
						></asp:Label>
					</div>
					<div class="form-controller error pseudoHide">
						<asp:RequiredFieldValidator
							ID="ReqFirstName"
							runat="server"
							ErrorMessage="FirstName field is required"
							ControlToValidate="txFirstName"
						></asp:RequiredFieldValidator>
					</div>

					<div class="form-controller animation-1">
						<asp:TextBox
							ID="txLastName"
							runat="server"
							CssClass="checkForEmptyValue"
						></asp:TextBox>
						<asp:Label
							ID="lLastName"
							data-for_id="txLastName"
							runat="server"
							Text="Last Name"
							CssClass="form-label"
						></asp:Label>
					</div>
					<div class="form-controller error pseudoHide">
						<asp:RequiredFieldValidator
							ID="ReqLastName"
							runat="server"
							ErrorMessage="LastName field is required"
							ControlToValidate="txLastName"
						></asp:RequiredFieldValidator>
					</div>

					<div class="form-controller animation-1">
						<asp:TextBox
							ID="txUserName"
							runat="server"
							CssClass="checkForEmptyValue"
						></asp:TextBox>
						<asp:Label
							ID="lUserName"
							data-for_id="txUserName"
							runat="server"
							Text="User Name"
							CssClass="form-label"
						></asp:Label>
					</div>
					<div class="form-controller error pseudoHide">
						<asp:RequiredFieldValidator
							ID="ReqUserName"
							runat="server"
							ErrorMessage="User Name field is required"
							ControlToValidate="txUserName"
						></asp:RequiredFieldValidator>
					</div>

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
						<asp:TextBox
							ID="txConfirmPassword"
							runat="server"
							TextMode="Password"
							CssClass="checkForEmptyValue"
						></asp:TextBox>
						<asp:Label
							ID="lConfirmPassword"
							data-for_id="txConfirmPassword"
							runat="server"
							Text="Confirm Password"
							CssClass="form-label"
						></asp:Label>
					</div>
					<div class="form-controller error pseudoHide">
						<asp:RequiredFieldValidator
							ID="ReqConfirmPassword"
							runat="server"
							ErrorMessage="Confirm Password field is required"
							ControlToValidate="txConfirmPassword"
						></asp:RequiredFieldValidator>
					</div>
					<div class="form-controller error pseudoHide">
						<asp:CompareValidator
							ID="CompareValidator1"
							runat="server"
							ErrorMessage="Passwords don't match"
							ControlToCompare="txPassword"
							ControlToValidate="txConfirmPassword"
						></asp:CompareValidator>
					</div>

					<div class="form-controller d2">
						<label for="txDateOfBirth">Date Of Birth</label>
						<asp:TextBox
							runat="server"
							ID="txDateOfBirth"
							type="date"
							required="required"
						/>
					</div>
					<div class="form-controller error pseudoHide">
						<asp:RequiredFieldValidator
							ID="ReqDateOfBirth"
							runat="server"
							ErrorMessage="Date Of Birth field is required"
							ControlToValidate="txDateOfBirth"
						></asp:RequiredFieldValidator>
					</div>

					<div class="form-controller d2">
						<label for="FUProfilePicture">Profile Picture</label>
						<asp:FileUpload ID="FUProfilePicture" runat="server" />
					</div>
					<div class="form-controller error pseudoHide">
						<asp:RequiredFieldValidator
							ID="ReqProfilePicture"
							runat="server"
							ErrorMessage="Date Of Birth field is required"
							ControlToValidate="FUProfilePicture"
						></asp:RequiredFieldValidator>
					</div>

					<fieldset>
						<legend>Sex</legend>
						<div class="form-controllers">
							<asp:RadioButtonList ID="RBLSex" runat="server">
								<asp:ListItem Selected="True" Value="m">Male</asp:ListItem>
								<asp:ListItem Value="f">Female</asp:ListItem>
							</asp:RadioButtonList>
						</div>
					</fieldset>

					<div class="form-controller animation-1">
						<asp:Button
							ID="submitButton"
							runat="server"
							Text="Submit"
							OnClick="RegisterSubmitButton_Click"
						/>
					</div>
				</form>
				<footer class="footer">
					<p>
						Have an account?
						<asp:HyperLink
							ID="HyperLink1"
							runat="server"
							NavigateUrl="~/login.aspx"
							CssClass="animation-1"
							>Login
						</asp:HyperLink>
					</p>
					<asp:Label ID="LRegisterMessage" runat="server" Text=""></asp:Label>
					<asp:Label
						ID="LRegisterErrorMessage"
						runat="server"
						Text=""
					></asp:Label>
				</footer>
			</section>
		</main>
	</body>
</html>
