document.addEventListener('DOMContentLoaded', (event) => {
	const selectedForm = document.querySelector('form');
	const loginFormTextBoxes = selectedForm.querySelectorAll(
		'.checkForEmptyValue'
	);
	const loginFormLabels = selectedForm.querySelectorAll('.form-label');

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

	selectedForm.addEventListener('submit', (event) => {
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