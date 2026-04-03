# Blog build recipes
# Usage:
#   just build          # build the site with zola
#   just serve          # local dev server with live reload
#   just install        # install tools via mise

# Install tools (zola via mise)
install:
    mise install

# Remove build output
clean:
    rm -rf public/

# Build the full site (clean first to remove stale files)
build: clean
    zola build

# Local dev server with live reload
serve:
    zola serve

# Check for broken links etc.
check:
    zola check

# --- pandoc compat (for building a single .md file to .html) ---
# Usage: just build-post blog/2018/03/my-post.md
build-post FILE:
    #!/usr/bin/env bash
    set -euo pipefail
    input_file="$(basename "$(realpath "{{FILE}}")")"
    input_dir="$(dirname "$(realpath "{{FILE}}")")"
    file_name="${input_file%.*}"
    echo "Rendering to HTML ${input_file} --> ${file_name}.html (PWD: ${input_dir})"
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

# Build a single .md to PDF via XeLaTeX
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
