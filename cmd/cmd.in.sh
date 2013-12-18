#! /usr/bin/env bash

# cmd.sh: wrap bash functions into a command
# Copyright (C) 2012-2013 Juan Manuel Borges Caño
# This command wrapper happened by result of design. As mkproject proved efficient generating multitude of commands projects skeletons, a command skeleton itself showed up. I started to use it in tw, mkproject, rf ... and became an smart, elegant, efficient, fast and durable way to develop quality shell commands.
# Version 0.9.0

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# The variables to fill
#cmd="[@]pkg[@]"
#cmd_name="[@]pkgname[@]"
#cmd_description="[@]pkgdescription[@]"
#cmd_explanation="[@]pkgexplanation[@]"
#cmd_version="[@]pkgversion[@]"
#cmd_author="[@]pkgauthor[@]"
#cmd_month="[@]pkgmonth[@]"
#cmd_year="[@]pkgyear[@]"
#cmd_homepage="[@]pkghomepage[@]"
#cmd_blog="[@]pkgblog[@]"
#cmd_email="[@]pkgemail[@]"
#cmd_usage="[@]pkgusage[@]"
#cmd_examples="[@]pkgexamples[@]"
#cmd_options="[@]pkgoptions[@]"
#cmd_extrahelp="[@]pkgextrahelp[@]"
#cmd_extranotes="[@]pkgextranotes[@]"
#cmd_main="[@]pkgoptionsmain[@]"

# The usual variables
#cmd_datadir="[@]pkgdatadir[@]"

# The variables cleaned
[[ -z "$cmd" ]] && cmd="@cmd@"
[[ -z "$cmd_name" ]] && cmd_name="@name@"
[[ -z "$cmd_description" ]] && cmd_description="@description@"
[[ -z "$cmd_explanation" ]] && cmd_explanation="@explanation@"
[[ -z "$cmd_version" ]] && cmd_version="@version@"
[[ -z "$cmd_author" ]] && cmd_author="@author@"
[[ -z "$cmd_month" ]] && cmd_month="$(LANG=C date '+%B')"
[[ -z "$cmd_year" ]] && cmd_year="$(LANG=C date '+%Y')"
[[ ! "${cmd_homepage+_}" ]] && cmd_homepage="@homepage@"
[[ ! "${cmd_blog+_}" ]] && cmd_blog="@blog@"
[[ ! "${cmd_email+_}" ]] && cmd_email="@email@"
[[ -z "$cmd_usage" ]] && cmd_usage="@usage@"
[[ -z "$cmd_options" ]] && cmd_options=()
[[ -z "$cmd_examples" ]] && cmd_examples=("@example@")
[[ ! "${cmd_extrahelp+_}" ]] && cmd_extrahelp="@extrahelp?@"
[[ ! "${cmd_extranotes+_}" ]] && cmd_extranotes="@extranotes?@"
[[ -z "$cmd_init" ]] && cmd_init=":"
[[ -z "$cmd_main" ]] && cmd_main=":"

# The info helper
function cmd_info
{
	printf "%s\n" "Try \`$cmd --help' for more information."
}

# The warning helper
function cmd_warning
{
	printf "%s\n" "$cmd: $@" >&2
}

# The error helper
function cmd_error
{
	cmd_warning "$@"; cmd_info >&2; exit 1
}

# The options arrays
cmd_options+=("/h/help/show a help message/cmd_help/" "/v/version/show the program version/cmd_version/" "/m/man/show a man page/cmd_man/")
cmd_shorts=()
cmd_longs=()
cmd_msgs=()
cmd_funcs=()
cmd_args=()
for ((i = 0; i < "${#cmd_options[@]}"; i++))
do
	IFS="${cmd_options[$i]:0:1}" read cmd_shorts[$i] cmd_longs[$i] cmd_msgs[$i] cmd_funcs[$i] cmd_args[$i] < <(printf "%s\n" "${cmd_options[$i]:1}")
done

# The examples arrays
cmd_titles=()
cmd_descs=()
cmd_exs=()
cmd_footers=()
for ((i = 1; i < "${#cmd_examples[@]}"; i++))
do
	IFS="${cmd_examples[$i]:0:1}" read cmd_titles[$i] cmd_descs[$i] cmd_exs[$i] cmd_footers[$i] < <(printf "%s\n" "${cmd_examples[$i]:1}")
done

# The --help option
function cmd_help
{
	printf "%s\n" "$cmd ($cmd_name) by $cmd_author ($cmd_month $cmd_year)"
	printf "%s\n" "$cmd_description"
	printf "%s\n" "Usage: $cmd_usage"
	printf "%s\n" "Example: ${cmd_examples[0]}"
	printf "%s\n" ""
	printf "%s\n" "$cmd_explanation"
	printf "%s\n" ""
	printf "%s\n" "Mandatory arguments for long options are mandatory for short options too:"
	for ((i = 0; i < "${#cmd_options[@]}"; i++))
	do
		if [[ "${cmd_shorts[$i]}" =~ ":" || "${cmd_longs[$i]}" =~ ":" ]]
		then
			if [[ "${cmd_shorts[$i]}" =~ "::" || "${cmd_longs[$i]}" =~ "::" ]]
			then
				printf "%-48s%s\n" "  -${cmd_shorts[$i]//:/}, --${cmd_longs[$i]//:/}[=${cmd_args[$i]}]" "${cmd_msgs[$i]}"
			else
				printf "%-48s%s\n" "  -${cmd_shorts[$i]//:/}, --${cmd_longs[$i]//:/}=${cmd_args[$i]}" "${cmd_msgs[$i]}"
			fi
		else
			printf "%-48s%s\n" "  -${cmd_shorts[$i]//:/}, --${cmd_longs[$i]//:/}" "${cmd_msgs[$i]}"
		fi
	done
	[[ -n "$cmd_extrahelp" ]] && printf "%s\n" "$cmd_extrahelp"
	printf "%s\n" "Execute 'bash -c \"man <($cmd --man)\"' to see the runtime manpage."
	printf "%s\n" ""
	[[ -n "$cmd_homepage" ]] && printf "%s\n" "$cmd ($cmd_name) homepage: $cmd_homepage."
	printf "%s\n" "$cmd ($cmd_name) author: $cmd_author."
	[[ -n "$cmd_blog" ]] && printf "%s\n" "$cmd ($cmd_name) blog: $cmd_blog."
	[[ -n "$cmd_email" ]] && printf "%s\n" "$cmd ($cmd_name) email: $cmd_email."
	[[ -n "$cmd_extranotes" ]] && printf "%s\n" "$cmd_extranotes"
	exit 0
}

# The --version option
function cmd_version
{
	printf "%s\n" "$cmd_version"
	exit 0
}

# The --man option
function cmd_man
{
	
	printf "%s\n" ".\\\" Originally generated by cmd."
	printf "%s\n" ".TH ${cmd^^} \"1\" \"${cmd_month} ${cmd_year}\" \"${cmd} ${cmd_version}\" \"User Commands\""
	printf "%s\n%s\n" ".SH NAME" "${cmd} \- ${cmd_description}"
	printf "%s\n%s\n" ".SH SYNOPSIS" ".B ${cmd_usage}"
	printf "%s\n%s\n" ".SH EXAMPLE" ".B ${cmd_examples[0]}"
	printf "%s\n%s\n" ".SH DESCRIPTION" "${cmd_explanation}"
	printf "%s\n%s\n" ".PP" "Mandatory arguments for long options are mandatory for short options too."
	for ((i = 0; i < "${#cmd_options[@]}"; i++))
	do
		printf "%s\n" ".TP"
		if [[ "${cmd_shorts[$i]}" =~ ":" || "${cmd_longs[$i]}" =~ ":" ]]
		then
			if [[ "${cmd_shorts[$i]}" =~ "::" || "${cmd_longs[$i]}" =~ "::" ]]
			then
				printf "%s\n" "\\fB\\-${cmd_shorts[$i]//:/}\\fR, \\fB\\-\\-${cmd_longs[$i]//:/}\\fR[=\\fI${cmd_args[$i]}\\fR]\\fR"
			else
				printf "%s\n" "\\fB\\-${cmd_shorts[$i]//:/}\\fR, \\fB\\-\\-${cmd_longs[$i]//:/}\\fR=\\fI${cmd_args[$i]}\\fR"
			fi
		else
			printf "%s\n" "\\fB\\-${cmd_shorts[$i]//:/}\\fR, \\fB\\-\\-${cmd_longs[$i]//:/}\\fR"
		fi
		printf "%s\n" "${cmd_msgs[$i]}"
	done
	[[ -n "$cmd_extrahelp" ]] && printf "%s\n%s\n" ".TP" "$cmd_extrahelp"
	printf "%s\n" ".TP" "Execute 'bash -c \"man <($cmd --man)\"' to see the runtime manpage."
	(( "${#cmd_examples[@]}" > 1 )) && printf "%s\n" ".SH EXAMPLES"
	for ((i = 1; i < "${#cmd_examples[@]}"; i++))
	do
		printf "%s\n%s\n" ".TP" ".B ${cmd_titles[$i]}"
		printf "%s\n%s\n" ".TP" "${cmd_descs[$i]}"
		[[ -n "${cmd_exs[$i]}" ]] && printf "%s\n%s\n%s\n" ".nf" "${cmd_exs[$i]}" ".fi"
		[[ -n "${cmd_footers[$i]}" ]] && printf "%s\n%s\n" ".TP" "${cmd_footers[$i]}"
	done
	[[ -n "$cmd_extranotes" ]] && printf "%s\n%s\n" ".SH NOTES" "${cmd_extranotes}"
	[[ -n "$cmd_homepage" ]] && printf "%s\n%s\n" ".SH HOMEPAGE" "Main project page at \\fB${cmd_homepage}\\fR."
	printf "%s\n%s\n" ".SH AUTHOR" "Programmed by \\fB${cmd_author}\\fR."
	[[ -n "$cmd_blog" ]] && printf "%s\n%s\n" ".SH BLOG" "Follow, thank or contact through comments or pay through BitCoin, Western Union, PayPal, ... at \\fB${cmd_blog}\\fR."
	[[ -n "$cmd_email" ]] && printf "%s\n%s\n" ".SH EMAIL" "Thank or contact through email to \\fB${cmd_email}\\fR."
	printf "%s\n%s\n" ".SH COPYRIGHT" "Copyright \(co \\fB${cmd_year} ${cmd_author}\\fR."
	printf "%s\n%s\n%s\n%s\n" ".PP" "This is free software.  You may redistribute copies of it under the terms of" "the GNU General Public License <http://www.gnu.org/licenses/gpl.html>." "There is NO WARRANTY, to the extent permitted by law."
	exit 0
}

# ... and cmd, the wrap itself
"$cmd_init" "$@"

# This handles options
cmd_s="${cmd_shorts[@]}"
cmd_l="${cmd_longs[@]}"
cmd_temp="$(getopt -o "${cmd_s// /}" -l "${cmd_l// /,}" -n "$cmd" -- "$@")"
eval set -- "$cmd_temp"
while [[ -n "$1" ]]
do
	for ((i = 0; i < "${#cmd_options[@]}"; i++))
	do
		if [[ "$1" = "-${cmd_shorts[$i]//:/}" || "$1" = "--${cmd_longs[$i]//:/}" ]]
		then
			shift
			if [[ "${cmd_shorts[$i]}" =~ ":" ]]
			then
				"${cmd_funcs[$i]}" "$1"
				shift 
			else
				"${cmd_funcs[$i]}"
			fi
			continue 2
		fi
	done
	if [[ "$1" = "--" ]]
	then
		shift
		break
	else
		cmd_error "argument error"
	fi
done

# This handles the main program
"$cmd_main" "$@"
