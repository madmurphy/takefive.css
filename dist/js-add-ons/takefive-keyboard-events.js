/* close the slide currently open or do nothing */
function closeCurrentSlide () {

	var oSlide = document.querySelector("article.slide:target");

	if (oSlide) {

		var oExitLink = oSlide.querySelector("nav:first-of-type a[rel~=\"parent\"]");
		location.assign(oExitLink ? oExitLink.href : "#");

	}

}

window.addEventListener("keyup", function (oEvt) {

	if (oEvt.key === "Escape") {

		closeCurrentSlide();

	}

}, false);
