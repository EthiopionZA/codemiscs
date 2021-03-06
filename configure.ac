AC_INIT([code miscellaneous], [2014.06.07], [juanmabcmail@gmail.com], [codemiscs], ["http://code.google.com/p/codemiscs/"])
AC_CONFIG_MACRO_DIR([autoconf.macro])
AC_CONFIG_AUX_DIR([autoconf.aux])
AM_INIT_AUTOMAKE(no-dist-gzip dist-bzip2)

AC_SUBST(PACKAGE_DESCRIPTION, "code miscellaneous")
AC_SUBST(PACKAGE_EXPLANATION, ["Code Miscellaneous is a fun, creative, elegant, exciting, amusing, useful, human and profitable project."])
AC_SUBST(PACKAGE_LICENSE, "GPLv3+")
AC_SUBST(PACKAGE_HOMEPAGE, "http://code.google.com/p/codemiscs")
AC_SUBST(PACKAGE_AUTHOR, "Juan Manuel Borges Caño")
AC_SUBST(PACKAGE_EMAIL, "juanmabcmail@gmail.com")
AC_SUBST(PACKAGE_SOCIAL, "http://plus.google.com/+JuanManuelBorgesCaño")
AC_SUBST(PACKAGE_BLOG, "http://juanmabcblog.blogspot.com")
AC_SUBST(PACKAGE_MONTH, $(LANG=C date '+%B'))
AC_SUBST(PACKAGE_YEAR, $(LANG=C date '+%Y'))
AC_SUBST(PACKAGE_DAY, $(LANG=C date '+%A'))
AC_SUBST(PACKAGE_TIMESTAMP, $(LANG=C date -R))
AC_SUBST(PACKAGE_LOGSTAMP, $(LANG=C date '+%a %b %d %Y'))
AC_SUBST(PACKAGE_TARBALL, ["\$(PACKAGE)-\$(PACKAGE_VERSION).tar.bz2"])
AC_SUBST(PACKAGE_BYTESIZE, ["[[ -f '\$(top_srcdir)/\$(PACKAGE_TARBALL)' ]] && wc -c < '\$(top_srcdir)/\$(PACKAGE_TARBALL)'"])
AC_SUBST(PACKAGE_MD5SUM, ["[[ -f '\$(top_srcdir)/\$(PACKAGE_TARBALL)' ]] && { md5sum '\$(top_srcdir)/\$(PACKAGE_TARBALL)' | cut -d ' ' -f 1; }"])
AC_SUBST(PACKAGE_PARSE,
	["sed \
	-e 's,\@<:@@\@:>@pkg\@<:@@\@:>@,\$(PACKAGE),g' \
	-e 's,\@<:@@\@:>@pkgname\@<:@@\@:>@,\$(PACKAGE_NAME),g' \
	-e 's,\@<:@@\@:>@pkgversion\@<:@@\@:>@,\$(PACKAGE_VERSION),g' \
	-e 's,\@<:@@\@:>@pkgdescription\@<:@@\@:>@,\$(PACKAGE_DESCRIPTION),g' \
	-e 's?\@<:@@\@:>@pkgexplanation\@<:@@\@:>@?\$(PACKAGE_EXPLANATION)?g' \
	-e 's,\@<:@@\@:>@pkglicense\@<:@@\@:>@,\$(PACKAGE_LICENSE),g' \
	-e 's,\@<:@@\@:>@pkghomepage\@<:@@\@:>@,\$(PACKAGE_HOMEPAGE),g' \
	-e 's,\@<:@@\@:>@pkgauthor\@<:@@\@:>@,\$(PACKAGE_AUTHOR),g' \
	-e 's,\@<:@@\@:>@pkgemail\@<:@@\@:>@,\$(PACKAGE_EMAIL),g' \
	-e 's,\@<:@@\@:>@pkgsocial\@<:@@\@:>@,\$(PACKAGE_SOCIAL),g' \
	-e 's,\@<:@@\@:>@pkgblog\@<:@@\@:>@,\$(PACKAGE_BLOG),g' \
	-e 's,\@<:@@\@:>@pkgmonth\@<:@@\@:>@,\$(PACKAGE_MONTH),g' \
	-e 's,\@<:@@\@:>@pkgyear\@<:@@\@:>@,\$(PACKAGE_YEAR),g' \
	-e 's,\@<:@@\@:>@pkgday\@<:@@\@:>@,\$(PACKAGE_DAY),g' \
	-e 's?\@<:@@\@:>@pkgtimestamp\@<:@@\@:>@?\$(PACKAGE_TIMESTAMP)?g' \
	-e 's?\@<:@@\@:>@pkglogstamp\@<:@@\@:>@?\$(PACKAGE_LOGSTAMP)?g' \
	-e 's,\@<:@@\@:>@pkgdatadir\@<:@@\@:>@,\$(pkgdatadir),g' \
	-e 's,\@<:@@\@:>@pkgaspell\@<:@@\@:>@,\$(PACKAGE_ASPELL),g' \
	-e 's,\@<:@@\@:>@pkgespeak\@<:@@\@:>@,\$(PACKAGE_ESPEAK),g' \
	-e 's,\@<:@@\@:>@pkghunspell\@<:@@\@:>@,\$(PACKAGE_HUNSPELL),g' \
	-e 's,\@<:@@\@:>@pkgmythes\@<:@@\@:>@,\$(PACKAGE_MYTHES),g' \
	-e 's,\@<:@@\@:>@pkgogg123\@<:@@\@:>@,\$(PACKAGE_OGG123),g' \
	-e 's,\@<:@@\@:>@pkgtarball\@<:@@\@:>@,\$(PACKAGE_TARBALL),g' \
	-e 's,\@<:@@\@:>@pkgbytesize\@<:@@\@:>@,\$(shell \$(PACKAGE_BYTESIZE)),g' \
	-e 's,\@<:@@\@:>@pkgmd5sum\@<:@@\@:>@,\$(shell \$(PACKAGE_MD5SUM)),g' \
	"]
)

# Checks for programs.
AC_PROG_CXX

#AC_CHECK_PROG(PACKAGE_BC, bc, yes)
#[[ -z $PACKAGE_BC ]] && AC_MSG_WARN(bc is needed at execution time)

AC_CHECK_PROG(PACKAGE_BASH, bash, yes)
[[ -z $PACKAGE_BASH ]] && AC_MSG_WARN(bash is needed at execution time)

AC_CHECK_PROG(PACKAGE_SED, sed, yes)
[[ -z $PACKAGE_SED ]] && AC_MSG_ERROR(sed is needed at compile time)

AC_CHECK_PROG(PACKAGE_GAWK, gawk, yes)
[[ -z $PACKAGE_GAWK ]] && AC_MSG_WARN(gawk is needed at execution time)

AC_CHECK_PROG(PACKAGE_PERL, perl, yes)
[[ -z $PACKAGE_PERL ]] && AC_MSG_WARN(perl is needed at execution time)

AC_CHECK_PROG(PACKAGE_PYTHON, python, yes)
[[ -z $PACKAGE_PERL ]] && AC_MSG_WARN(python is needed at execution time)

AC_CHECK_PROG(PACKAGE_GETOPT, getopt, yes)
[[ -z $PACKAGE_GETOPT ]] && AC_MSG_WARN(getopt is needed at execution time)

AC_CHECK_PROG(PACKAGE_XARGS, xargs, yes)
[[ -z $PACKAGE_XARGS ]] && AC_MSG_WARN(xargs is needed at execution time)

AC_CHECK_PROG(PACKAGE_LOCATE, locate, yes)
[[ -z $PACKAGE_LOCATE ]] && AC_MSG_WARN(locate is needed at execution time)

AC_CHECK_PROG(PACKAGE_SHUF, shuf, yes)
[[ -z $PACKAGE_SHUF ]] && AC_MSG_WARN(shuf is needed at execution time)

AC_CHECK_PROG(PACKAGE_AUTORECONF, autoreconf, yes)
[[ -z $PACKAGE_AUTORECONF ]] && AC_MSG_WARN(autoreconf is needed at execution time)

AC_CHECK_PROG(PACKAGE_ICONV, iconv, yes)
[[ -z $PACKAGE_ICONV ]] && AC_MSG_WARN(iconv is needed at execution time)

# AC_CHECK_PROG(PACKAGE_RECODE, recode, yes)
# [[ -z $PACKAGE_RECODE ]] && AC_MSG_WARN(recode is needed at execution time)

AC_CHECK_PROG(PACKAGE_ASPELL, aspell, yes)
[[ -z $PACKAGE_ASPELL ]] && AC_MSG_WARN(aspell is needed at execution time)
AM_CONDITIONAL(ASPELL, [ test x$PACKAGE_ASPELL = xyes ])

AC_CHECK_PROG(PACKAGE_FORTUNE, fortune, yes)
[[ -z $PACKAGE_FORTUNE ]] && AC_MSG_WARN(fortune is needed at execution time)

AC_CHECK_PROG(PACKAGE_TPUT, tput, yes)
[[ -z $PACKAGE_TPUT ]] && AC_MSG_WARN(tput is needed at execution time)

AC_CHECK_PROG(PACKAGE_FIGLET, figlet, yes)
[[ -z $PACKAGE_FIGLET ]] && AC_MSG_WARN(figlet is needed at execution time)

AC_CHECK_PROG(PACKAGE_COWSAY, cowsay, yes)
[[ -z $PACKAGE_COWSAY ]] && AC_MSG_WARN(cowsay is needed at execution time)

AC_CHECK_PROG(PACKAGE_BOXES, boxes, yes)
[[ -z $PACKAGE_BOXES ]] && AC_MSG_WARN(boxes is needed at execution time)

AC_CHECK_PROG(PACKAGE_FESTIVAL, festival, yes)
[[ -z $PACKAGE_FESTIVAL ]] && AC_MSG_WARN(festival is needed at execution time)

AC_CHECK_PROG(PACKAGE_ESPEAK, espeak, yes)
[[ -z $PACKAGE_ESPEAK ]] && AC_MSG_WARN(espeak is needed at execution time)
AM_CONDITIONAL(ESPEAK, [ test x$PACKAGE_ESPEAK = xyes ])

AC_CHECK_PROG(PACKAGE_CONVERT, convert, yes)
[[ -z $PACKAGE_CONVERT ]] && AC_MSG_WARN(convert is needed at execution time)

AC_CHECK_PROG(PACKAGE_BEEP, beep, yes)
[[ -z $PACKAGE_BEEP ]] && AC_MSG_WARN(beep is needed at execution time)
AM_CONDITIONAL(BEEP, [ test x$PACKAGE_BEEP = xyes ])

AC_CHECK_PROG(PACKAGE_OGG123, ogg123, yes)
[[ -z $PACKAGE_OGG123 ]] && AC_MSG_WARN(ogg123 is needed at execution time)
AM_CONDITIONAL(OGG123, [ test x$PACKAGE_OGG123 = xyes ])

AC_CHECK_PROG(PACKAGE_CURL, curl, yes)
[[ -z $PACKAGE_CURL ]] && AC_MSG_WARN(curl is needed at execution time)

AC_CHECK_PROG(PACKAGE_WGET, wget, yes)
[[ -z $PACKAGE_WGET ]] && AC_MSG_WARN(wget is needed at execution time)

AC_CHECK_PROG(PACKAGE_XMLLINT, xmllint, yes)
[[ -z $PACKAGE_XMLLINT ]] && AC_MSG_WARN(xmllint is needed at execution time)

AC_CHECK_PROG(PACKAGE_XMLSTARLET, xmlstarlet, yes)
[[ -z $PACKAGE_XMLSTARLET ]] && AC_MSG_WARN(xmlstarlet is needed at execution time)

AC_CHECK_PROG(PACKAGE_LYNX, lynx, yes)
[[ -z $PACKAGE_LYNX ]] && AC_MSG_WARN(lynx is needed at execution time)

# Checks for libraries.
HUNSPELL_MODULES="hunspell"
PKG_CHECK_MODULES(HUNSPELL, $HUNSPELL_MODULES, PACKAGE_HUNSPELL=yes, PACKAGE_UNSPELL=no)
AC_SUBST(PACKAGE_HUNSPELL)
AC_SUBST(HUNSPELL_CFLAGS)
AC_SUBST(HUNSPELL_LIBS)
MYTHES_MODULES="mythes"
PKG_CHECK_MODULES(MYTHES, $MYTHES_MODULES, PACKAGE_MYTHES=yes, PACKAGE_MYTHES=no)
AC_SUBST(PACKAGE_MYTHES)
AC_SUBST(MYTHES_CFLAGS)
AC_SUBST(MYTHES_LIBS)
AM_CONDITIONAL(MYTHES, [test x$PACKAGE_HUNSPELL = xyes -a  x$PACKAGE_MYTHES = xyes])


# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile cmds/Makefile cmds/cmd/Makefile cmds/mkproject/Makefile cmds/tw/Makefile cmds/rf/Makefile cmds/imgs/Makefile cmds/typewrite/Makefile cmds/colorize/Makefile cmds/show/Makefile cmds/pack/Makefile cmds/tonize/Makefile cmds/status/Makefile doc/Makefile dist/Makefile])
AC_OUTPUT
