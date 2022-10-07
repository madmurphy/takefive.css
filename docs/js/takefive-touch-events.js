(function () {

	var nDownX = null, nDownY = null;

	function handleTouchStart (oEvt) {

		const oFirstTouch = oEvt.touches[0];

		nDownX = oFirstTouch.clientX;
		nDownY = oFirstTouch.clientY;

	};

	function handleTouchMove (oEvt) {

		if (!nDownX || !nDownY) {

			return;

		}

		var
			oLink, sRel = null,
			nDiffX = nDownX - oEvt.touches[0].clientX,
			nDiffY = nDownY - oEvt.touches[0].clientY;

		switch (Math.abs(nDiffX) > Math.abs(nDiffY) ? nDiffX > 0 ? 3 : 2 : nDiffY > 0 ? 1 : 0) {

			/*  Cases: `0` -> down swipe, `1` -> up swipe, `2` -> right swipe, `3` -> left swipe  */
			case 2: sRel = "prev"; break;	/*  Right swipe  */
			case 3: sRel = "next"; break;	/*  Left swipe  */

		}

		nDownX = null;
		nDownY = null;

		sRel && (oLink = this.querySelector("nav:first-of-type a[href][rel~=\"" + sRel + "\"]")) && location.assign(oLink.href);

	};

	window.addEventListener("DOMContentLoaded", function () {

		const aSlides = document.querySelectorAll("article.slide");

		for (var nIdx = 0, nLen = aSlides.length; nIdx < nLen; nIdx++) {

			aSlides[nIdx].addEventListener('touchstart', handleTouchStart, false);
			aSlides[nIdx].addEventListener('touchmove', handleTouchMove, false);

		}

	}, false);

})();
