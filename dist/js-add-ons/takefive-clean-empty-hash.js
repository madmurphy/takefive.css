window.addEventListener("DOMContentLoaded", function () {

	var aEmptyHashLinks = document.querySelectorAll("a[href$=\"#\"]");

	for (var nIdx = 0; nIdx < aEmptyHashLinks.length; nIdx++) {

		aEmptyHashLinks[nIdx].addEventListener("click", function (oEvt) {

			location.hash = "";
			history.replaceState(null, "", this.href.split('#')[0]);
			oEvt.preventDefault();

		});

	}

}, false);
