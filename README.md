# narmnevis.github.io

A bilingual (Persian/English) technical blog, built with [pandoc](https://pandoc.org) and [just](https://just.systems).

## Structure

```
index.md          # bilingual landing page → index.html
index-fa.md       # Persian posts index   → index-fa.html
index-en.md       # English posts index   → index-en.html
blog/YYYY/MM/     # post source (.md) and output (.html) live together
static/
  _template.html  # pandoc HTML template (supports lang + dir from front matter)
  default.css     # stylesheet (RTL-aware)
  disqus.html     # Disqus comments snippet
Justfile          # build recipes
```

## Writing a post

1. Create `blog/YYYY/MM/my-post.md` with front matter:

   ```yaml
   ---
   lang: 'en'        # or 'fa'
   dir: 'ltr'        # or 'rtl'
   title: 'My Post Title'
   keywords: [foo, bar]
   ---
   ```

2. Write content in Markdown.

3. Build:

   ```bash
   just build blog/YYYY/MM/my-post.md
   ```

4. Add a link to `index-en.md` (or `index-fa.md`) and rebuild the indexes:

   ```bash
   just build-all
   ```

## Recipes

```bash
just build FILE      # build a single .md → .html
just build-all       # rebuild all three index pages
just build-pdf FILE  # build a single .md → .pdf (requires XeLaTeX)
```

## Dependencies

- [`pandoc`](https://pandoc.org) — document converter
- [`just`](https://just.systems) — command runner
- XeLaTeX (optional, for PDF export)
