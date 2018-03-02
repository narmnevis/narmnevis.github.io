#!/bin/bash

# Builds using pandoc:
#  build SOURCE DEST
function build {
   echo "Rendering to PDF ..."
   _source="$1"
   _dest="$2"
   pandoc \
      --smart --normalize \
      --number-sections \
      --toc --toc-depth=3 --atx-headers \
      --variable geometry="margin=1in" \
      --variable fontsize="12pt" \
      --variable mainfont="Bitstream Charter" \
      --variable sansfont="Bitstream Charter" \
      --variable monofont="Source Code Pro" \
      --variable colorlinks \
      --variable links-as-notes \
      --latex-engine=xelatex \
      -o ${_dest} ${_source}
}

# Static
#    curl -o $(pwd)/template.html \
#      https://raw.githubusercontent.com/tonyblundell/pandoc-bootstrap-template/master/template.html
#   curl -o $(pwd)/template.css \
#      https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css

function build_html {
   _source="$1"
   _dest="$2"
   echo "Rendering to HTML $1 --> $2 (PWD: $(pwd))"
   pandoc \
      --template ../../../static/_template.html \
      -f markdown+smart -t html5 \
      -o ${_dest} ${_source}
}

# Main
input_file=$(basename "$1")
file_ext="${input_file##*.}"
file_name="${input_file%.*}"

build_html $1 ${file_name}.html