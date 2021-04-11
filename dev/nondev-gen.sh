#!/bin/sh
#
# expand-calc.sh
#
# Expand all the CSS variables declared in `$MAINCSS` **recursively** and save
# the files generated in the temporary `$EXPDIR` directory. Then simplify the
# content of `calc()` everywhere and save the simplified files in `$SRCDIR`.
# Then minify everything and save the minified files in `$MINDIR`.
#


MAINCSS='takefive-dev.css'
EXPDIR='var-expansion'
SRCDIR='src'
MINDIR='min'
DISTDIR='dist'

_RE_VAR_='^\s*--\([^:]\+\): var(--[^,]\+, \([^\)]\+\));'
# Maximum four levels of round bracket nesting is supported
_RE_CALC_='calc\(([^()]+|[^()]*\([^()]+\)[^()]*|[^()]*\([^()]*\([^()]+\)[^()]*\)[^()]*|[^()]*\([^()]*\([^()]*\([^()]+\)[^()]*\)[^()]*\)[^()]*|[^()]*\([^()]*\([^()]*\([^()]*\([^()]+\)[^()]*\)[^()]*\)[^()]*\)[^()]*)\)'

_ALLVARS_="$(cat "${MAINCSS}" | grep -o "${_RE_VAR_}" "${MAINCSS}" | sed 's/'"${_RE_VAR_}"'/s\/var(--\1)\/\2\/g;/g')"

rm -rf "${EXPDIR}" "${SRCDIR}" "${MINDIR}"
mkdir -p $(find '.' -type f -name '*-dev.css' -printf "${EXPDIR}/%h\\n")
find '.' -type f -name '*-dev.css' ! -wholename "./${EXPDIR}/*" \
	-exec cp '{}' "${EXPDIR}/{}" ';' \
	-exec 'sed' '-i' "${_ALLVARS_}//g" "${EXPDIR}/{}" ';' \
	-exec 'diff' '-u' '{}' "${EXPDIR}/{}" ';' \
	> "${EXPDIR}/${EXPDIR}.diff"

sed -i '/!\s*DEV_ONLY\s*!/,/!\s*END_DEV_ONLY\s*!/{d}' "${EXPDIR}/${MAINCSS}"

if ! which qalc &> /dev/null ; then
	echo 'You need to have qalc installed on your machine.' 1>&2
	exit 1
fi

if ! which uglifycss &> /dev/null ; then
	echo 'You need to have uglifycss installed on your machine.' 1>&2
	exit 1
fi

cp -L -r "${EXPDIR}" "${SRCDIR}"
rm -f "${SRCDIR}/${EXPDIR}.diff"

echo 'Simplifying the content of `calc()` ...'

# Calculations yelding zero as final result are not implemented yet
find "${SRCDIR}" -type f -name '*.css' | while read -r _CSSFILE_ ; do
	echo "${_CSSFILE_}"

	_ALLREPL_="$(cat "${_CSSFILE_}" | grep -E -o "${_RE_CALC_}" "${_CSSFILE_}" | while read -r _MATCH_ ; do
		_EXPR_="$(echo "${_MATCH_}" | sed '
				s/^calc\|[ \t\v\f\n\r]//g;
				s/%/n/g;
				s/px/i/g;
				s/em/z/g;
				s/vh/y/g;
				s/vw/x/g;
				s/vmin/\\g/g;
			' | qalc -t -s 'decimal comma off' $(cat) | sed '
				s/x/vw/g;
				s/y/vh/g;
				s/z/em/g;
				s/n/%/g;
				s/i/px/g;
				s/'\''g'\''/vmin/g;

				s/ vw/ 1vw/g;
				s/ vh/ 1vh/g;
				s/ em/ 1em/g;
				s/ %/ 1%/g;
				s/ px/ 1px/g;
				s/ vmin/ 1vmin/g;
				s/\//\\\//g;
				s/\*/\\*/g;
				s/\xE2\x88\x92/-/g;
			')"

		echo "s/$(echo "${_MATCH_}" | sed 's/\//\\\//g;s/\*/\\*/g;')/$(case "${_EXPR_}" in *' '*) echo "calc(${_EXPR_})" ;; *) echo "${_EXPR_}" ;; esac;)/g;"

	done)"

	sed -i "${_ALLREPL_}" "${_CSSFILE_}"

done

mkdir -p $(cd "${SRCDIR}" && find '.' -type f -name '*.css' -printf "${MINDIR}/%h\\n")

{
	(cd "${SRCDIR}" && find '.' -type f -name '*.css') | while read -r _CSSFILE_ ; do
		_CLEANNAME_="$(echo "${_CSSFILE_}" | sed 's/-dev\.css$/.css/g')"
		test "x${_CLEANNAME_}" = "x${_CSSFILE_}" || mv "${SRCDIR}/${_CSSFILE_}" "${SRCDIR}/${_CLEANNAME_}" > /dev/null
		diff -u "${EXPDIR}/${_CSSFILE_}" "${SRCDIR}/${_CLEANNAME_}"
		{
			echo '/* https://github.com/madmurphy/takefive.css */'
			uglifycss "${SRCDIR}/${_CLEANNAME_}" | sed 's/ not(/ not (/g'
		} > "${MINDIR}/$(echo "${_CLEANNAME_}" | sed 's/\.css$/.min.css/g')"
		echo
	done
} | sed 's/\('"${EXPDIR}"'\|'"${SRCDIR}"'\)\/\.\//\1\//g' > "${SRCDIR}.diff"

rsync -azq --remove-source-files \
	"${MINDIR}"/. \
	"${SRCDIR}"/. \
	"${DISTDIR}"

rm -rf "${EXPDIR}" "${SRCDIR}" "${MINDIR}"

# EOF

