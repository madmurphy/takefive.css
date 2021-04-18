# Development

This is the directory that contains the development version of **Take Five!**.
To remain self-consistent this version relies on CSS variables (the `var()`
function). These are expanded in the final CSS released to ensure better
compatibility.

A shell script is available for stripping the variables and minifying the CSS
files (the original files will not be overwritten -- `qalc` and `uglifycss` are
required).

If you are only interested in using the CSS for a website, please refer to the
`dist` subdirectory.

