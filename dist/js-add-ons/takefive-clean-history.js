(function () {

	var bOpenedWithSlide = false, nHistCount = -1;

	function newSlideClicked () {

		nHistCount--;

	}

	function exitClicked (oEvt) {

		if (bOpenedWithSlide) {

			/*  The page was loaded with a slide open  */
			bOpenedWithSlide = false;

		} else {

			history.go(nHistCount);
			oEvt.preventDefault();

		}

		nHistCount = -1;

	}

	addEventListener("DOMContentLoaded", function () {

		var
			elIter,
			aLinks = document.querySelectorAll("article.slide a"),
			elTest = document.createElement("a");

		bOpenedWithSlide = Boolean(document.querySelector("article.slide:target"));
		elTest.href = location.href;

		for (var nLen = aLinks.length, nIdx = 0; nIdx < nLen; nIdx++) {

			elIter = aLinks[nIdx];
			elTest.hash = elIter.hash || "#";

			if (elTest.href === elIter.href) {
				elIter.addEventListener("click",
					elIter.hash && document.querySelector("article.slide" + elIter.hash) ?
						newSlideClicked
					:
						exitClicked
				);
			}

		}

	}, false);

})();
