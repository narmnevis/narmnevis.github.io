# Blog build recipes
# Usage:
#   just install        # install tools via mise
#   just serve          # local dev server with live reload
#   just build          # clean build → public/
#   just check          # validate all internal and external links

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
