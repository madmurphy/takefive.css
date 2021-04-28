# Change Log


## 3.1.1 (2021-04-28)

Changes:

* A small bug involving the exit layer on small screens has been fixed
* Documentation


## 3.1.0 (2021-04-19)

Changes:

* The default font has been set to `Victoria Typewriter` (this is due to the
  previous `1942 report` font lacking support for accented characters)
* Support for internationalization has been added (`takefive-i18n-*.css`)
* A further new plugin has been created (`takefive-slides.css`)
* A bug affecting the usage of `data-label` has been fixed
* The layout of the slides on small screens in landscape mode has been improved
* Minor adjustments
* Documentation
* Examples


## 3.0.0 (2021-04-12)

Changes:

* The framework is now adaptive
* The size of the slides has been made bigger
* Printing is now fully supported
* Classes `"pinned"`, `"verbose"`, `"wrap"`, `"nonadaptive"`, `"foyer"` have
  been made available to slide containers
* Classes `"vision"`, `"tab"`, `"plate"`, `"with-label"` have been made
  available to navigation links
* Generic classes `"z-auto"`, `"z-none"`, `"z-low"`, `"z-mid"`, `"z-high"`,
  `"clean"`, `"roomy"` have been created
* Class `"offstage"` has been renamed to `"no-rel"`
* All occurrences of `!important` have been removed from the CSS
* The text contained in the `data-context` attribute has now been moved to the
  top left corner
* The opening animation now relies only on `transform`
* Support for two new `rel` attributes has been added (`"attachment"` and
  `"discussion"`)
* The `z-index` property has been updated everywhere
* Vendor-specific properties `-moz-transform`, `-webkit-transform` and
  `-o-transform` have been removed
* New plugins have been created (`takefive-counters.css`,
  `takefive-glyphs.css`, `takefive-maxsize.css`, `takefive-polaroid.css` and
  `takefive-toolbar.css`)
* Now `a[rel~="parent"]` never generates anything special outside of the main
  `<nav>`
* Documentation
* Examples


## 2.0.0 (2021-03-18)

Changes:

* Class `"no-nav"` has been renamed to `"offstage"`
* Support for a `"brief"` class has been added the main `<article>`
* Support for `<picture>`, `<pre>` and `<svg>` elements has been added to the
  CSS
* Unicode symbol for `a[rel="author"]` has been set to `U+2709 U+FE0F`
* A default label has been created for the links of the main `<nav>` that
  do not possess a `rel` attribute
* A schematic of the viewport has been added to the manual
* Animations, examples and minor details have been improved


## 1.3.1 (2021-03-11)

Changes:

* Increased the clickable area of the `a[rel="prev"]` and `a[rel="next"]`
  buttons for touchscreen devices
* Used `75vh` instead of `12cm` for the `max-height` of `img`, `audio`, `video`
  and `iframe` inside a slide
* Added _My Underwood_ optional font to the package tree
* Adjusted margins and other parameters
* Improved examples


## 1.3.0 (2021-03-08)

Changes:

* Adjusted slide width and other parameters
* Improved touchscreen support
* Unicode symbols for `a[rel="first"]`, `a[rel="last"]`, `a[rel="author"]` and
  `a[rel="bookmark"]` set to `U+23EE`, `U+23ED`, `U+1FAB6` and `U+1F587`
* Fixed typo that affected some animations


## 1.2.6 (2018-06-05)

Changes:

* Navigation buttons not working in Webkit and Edge: solved
* Documentation


## 1.2.5 (2017-09-05)

Changes:

* Attached Satie's _Gymnopedie_
* Documentation



## 1.2.4 (2017-04-07)

Changes:

* Optional font `GNU Typewriter` is now available under `fonts/`


## 1.2.3 (2017-02-23)

Changes:

* Added support for `a.no-nav[href][rel~="parent"]`
* Documentation


## 1.2.2 (2017-02-16)

Changes:

* Unicode symbol for `a[rel="bookmark"]` set to `U+1F517`


## 1.2.1 (2017-02-14)

Changes:

* Labels of links within the main `<nav>`
* Documentation


## 1.2.0 (2017-02-12)

Changes:

* Relational token `up` replaced with `parent`
* Possibility of declaring more one than one token within the `rel` attributes
* Changed unicode symbols for `prev` and `next`
* Added support for `a[rel="child"]`
* Added support for `"no-nav"` class
* Improved `<blockquote>` elements
* Improved documentation and demo


## 1.1.2 (2017-02-09)

Changes:

* Added support for `data-context` attribute in `article.slide`
* Added support for `article.slide a[rel="tag"]`
* Added a `max-width` rule to the hashtag text
* Few conversions from `px` to `em`
* Styled `<code>` tags



## 1.1.1 (2017-02-08)

Changes:

* `z-index` property of `article.slide` set to `11109`
* Styled general HTML elements
* Margins of text containers (`<p>`, `<h1>`, `<h2>`, `<h3>`,
  etc.)
* Improved documentation and demo


## 1.1.0 (2017-02-03)

Changes:

* Added embedded font "1942 report"
* Converted `px` to `em` in all font-size properties
* Styled `<h1>`, `<h2>` and `<h3>` elements


## 1.0.0 (2017-02-02)

Take Five! 1.0.0 is released!

