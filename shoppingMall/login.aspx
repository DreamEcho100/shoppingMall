<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs"
Inherits="shoppingMall.WebForm1" %>

<!DOCTYPE html>
<script>
	document.addEventListener('DOMContentLoaded', (event) => {
		const loginForm = document.getElementById('loginForm');
		const loginFormTextBoxes = loginForm.querySelectorAll(
			'.checkForEmptyValue'
		);
		const loginFormLabels = loginForm.querySelectorAll('.form-label');

		const isClassListContainingIsEmpty = (elem) => {
			if (elem.value.trim().length === 0) {
				// event.target.class
				elem.classList.add('isEmpty');
			} else if (elem.classList.contains('isEmpty')) {
				elem.classList.remove('isEmpty');
			}
		};

		const initPage = () => {
			loginFormTextBoxes[0]?.focus();

			loginFormTextBoxes.forEach((tx) => {
				isClassListContainingIsEmpty(tx);
			});
		};

		initPage();

		loginFormTextBoxes.forEach((tx) => {
			tx.addEventListener('input', (event) => {
				if (event.target.value.length === 0) {
					// event.target.class
					tx.classList.add('isEmpty');
				} else if (tx.classList.contains('isEmpty')) {
					tx.classList.remove('isEmpty');
				}
			});
		});

		loginFormLabels.forEach((label) => {
			label.addEventListener('click', (event) => {
				const elem = document.getElementById(label.dataset.for_id);
				elem.focus();
			});
		});

		loginForm.addEventListener('submit', (event) => {
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
		<title>Login</title>
		<link href="~/styles/globals.css" type="text/css" rel="stylesheet" />
		<link href="~/styles/loginStyles.css" type="text/css" rel="stylesheet" />
		<link href="~/styles/form.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<main>
			<section class="form-section">
				<header>
					<h1>To login, fill in the following fields then click submit</h1>
				</header>
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
							OnClick="submitButton_Click"
						/>
					</div>
				</form>
				<footer class="footer">
					<p>
						New customer?
						<asp:HyperLink
							ID="register"
							runat="server"
							NavigateUrl="~/register.aspx"
							CssClass="animation-1"
							>Register
						</asp:HyperLink>
					</p>
					<asp:Label ID="LLoginMessage" runat="server" Text=""></asp:Label>
					<asp:Label ID="LLoginErrorMessage" runat="server" Text=""></asp:Label>
				</footer>
			</section>
		</main>
	</body>
</html>
<!-- https://localhost:44359/ -->

<!--
<main class="py-3"><div class="container"><div class="container"><div class="justify-content-md-center row"><div class="col-md-6 col-12"><h1>Sign Up</h1><form class=""><div><label class="form-label" for="Name">name</label><input placeholder="Enter name" type="name" id="Name" class="form-control" value=""></div><div><label class="form-label" for="email">Email</label><input placeholder="Enter email" type="email" id="email" class="form-control" value=""></div><div><label class="form-label" for="password">Password</label><input placeholder="Enter password" type="password" id="password" class="form-control" value=""></div><div><label class="form-label" for="confirmPassword">Confirm Password</label><input placeholder="Confirm password" type="password" id="confirmPassword" class="form-control" value=""></div><button type="submit" class="my-3 btn btn-primary">Register</button></form><div class="my-3 row"><div class="col">Have an Account? <a href="/login?redirect=/">Login</a></div></div></div></div></div></div></main>
-->
