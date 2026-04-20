# narmnevis.github.io

A bilingual (Persian/English) technical blog, built with [Zola](https://www.getzola.org) and [just](https://just.systems).

## Structure

```
config.toml           # Zola site config (bilingual FA+EN, feeds, sass)
content/
  _index.md           # EN landing page
  _index.fa.md        # FA landing page
  blog/
    _index.md         # EN posts section
    _index.fa.md      # FA posts section
    YYYY/MM/
      post.fa.md      # Persian post  (lang = "fa", dir = "rtl" in [extra])
      post.md         # English post  (lang = "en", dir = "ltr" in [extra])
templates/
  base.html           # Tera base template (lang/dir from page.extra)
  index.html          # Landing page
  page.html           # Blog post
  section.html        # Post listing
sass/
  main.scss           # Stylesheet (RTL-aware, dark-mode via prefers-color-scheme)
static/
  disqus.html         # Disqus snippet (loaded by templates/page.html)
docs/                 # Internal notes / audits (not published)
Justfile              # Build recipes
mise.toml             # Tool versions (zola 0.22.1)
```

## Getting started

```bash
just install   # install zola via mise (first time only)
just serve     # local dev server at http://localhost:1111 with live reload
just build     # production build → public/
just check     # validate internal links
```

## Writing a post

### Persian post

Create `content/blog/YYYY/MM/my-post.fa.md`:

```toml
+++
title = "عنوان نوشته"
date = YYYY-MM-DD

[extra]
lang = "fa"
dir = "rtl"
keywords = ["کلیدواژه"]
+++

متن نوشته در اینجا...
```

Then add a transparent `_index.fa.md` in each new year/month subdir if it doesn't exist:

```toml
+++
transparent = true
render = false
+++
```

### English post

Create `content/blog/YYYY/MM/my-post.md` (same structure, `lang = "en"`, `dir = "ltr"`).

## Multilingual routing

| File suffix  | URL                          | Language       |
| ------------ | ---------------------------- | -------------- |
| `post.fa.md` | `/fa/blog/YYYY/MM/post/`     | Persian (RTL)  |
| `post.md`    | `/blog/YYYY/MM/post/`        | English (LTR)  |

## Dependencies

- [`zola`](https://www.getzola.org) — static site generator (managed via mise)
- [`just`](https://just.systems) — command runner
- [`mise`](https://mise.jdx.dev) — tool version manager
