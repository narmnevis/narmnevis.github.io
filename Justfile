# Blog build recipes
# Usage:
#   just build blog/2018/03/post.md   # build a single post or index
#   just build-all                    # rebuild all index pages
#   just build-pdf blog/2018/03/post.md

# Build a single .md file to .html
# Language and direction are read from front matter (lang, dir).
build FILE:
    #!/usr/bin/env bash
    set -euo pipefail
    input_file="$(basename "$(realpath "{{FILE}}")")"
    input_dir="$(dirname "$(realpath "{{FILE}}")")"
    file_name="${input_file%.*}"
    echo "Rendering to HTML ${input_file} --> ${file_name}.html (PWD: ${input_dir})"
    # Skip Disqus on index/landing pages
    disqus_opt=""
    if [[ "$input_file" != index*.md && "$input_file" != "README.md" ]]; then
        disqus_opt="--include-after-body=./static/disqus.html"
    fi
    pandoc \
        --template ./static/_template.html \
        --syntax-highlighting tango \
        -f markdown+smart -t html5 \
        --metadata date-meta="$(date +%Y-%m-%d)" \
        $disqus_opt \
        -o "${input_dir}/${file_name}.html" \
        "${input_dir}/${input_file}"

# Rebuild all index pages
build-all:
    just build index.md
    just build index-fa.md
    just build index-en.md

# Build a single .md file to PDF via XeLaTeX
build-pdf FILE:
    #!/usr/bin/env bash
    set -euo pipefail
    input_file="$(basename "$(realpath "{{FILE}}")")"
    input_dir="$(dirname "$(realpath "{{FILE}}")")"
    file_name="${input_file%.*}"
    echo "Rendering to PDF ${input_file} --> ${file_name}.pdf"
    pandoc \
        --number-sections \
        --toc --toc-depth=3 \
        --variable geometry="margin=1in" \
        --variable fontsize="12pt" \
        --variable mainfont="Bitstream Charter" \
        --variable sansfont="Bitstream Charter" \
        --variable monofont="Source Code Pro" \
        --variable colorlinks \
        --variable links-as-notes \
        --pdf-engine=xelatex \
        -o "${input_dir}/${file_name}.pdf" \
        "${input_dir}/${input_file}"
