#! /usr/bin/env bash

# Relies in ImageMagick's *convert*
# November 22nd, 2013, Juan Manuel Borges Caño

(( $# == 0 )) && { echo "Usage: WidthxHeight Images ..."; exit 1; }

images=(); for file in "${@:2:$#}"; do [[ "$(file -bi "$file" | cut -d'/' -f1)" == "image" ]] && images=( "${images[@]}" "$file" ); done
size="$1"

unification=$(mktemp -d "Unification-$size-XXXXXXXXXX")
for i in ${!images[@]}; do convert -scale "$size"\! "${images[i]}" "$unification/$(printf "%.10i" "$i").png"; done

echo "$unification"
