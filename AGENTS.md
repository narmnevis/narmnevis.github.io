# Agent Context

This is a bilingual (Persian/English) personal technical blog published at [narmnevis.github.io](https://narmnevis.github.io).

## Stack

- **[Zola](https://www.getzola.org) 0.22.1** — static site generator (Rust-based)
- **[Tera](https://keats.github.io/tera/)** — templating engine (Jinja2-inspired)
- **SCSS** — compiled by Zola, output to `public/main.css`
- **[just](https://just.systems)** — task runner (`Justfile`)
- **[mise](https://mise.jdx.dev)** — tool version manager (`mise.toml`)
- **GitHub Actions** — auto-deploys on push to `master` (`.github/workflows/deploy.yml`)

## Content

- Posts live in `content/blog/YYYY/MM/`
- Persian posts: `post.fa.md` → served at `/fa/blog/YYYY/MM/post/`
- English posts: `post.md` → served at `/blog/YYYY/MM/post/`
- Front matter is TOML (`+++`); language/direction set via `[extra]` (`lang`, `dir`)
- All existing posts (2018) are in Persian (`lang = "fa"`, `dir = "rtl"`)

## Templates

- `templates/base.html` — base layout; reads `page.extra.lang` and `page.extra.dir` for HTML attributes
- `templates/index.html` — bilingual landing page
- `templates/section.html` — post listing (used by both EN and FA sections)
- `templates/page.html` — individual post; includes reading progress bar, back-to-top, Disqus

## Styling

- `sass/main.scss` — single stylesheet; uses CSS custom properties for dark mode (`prefers-color-scheme`)
- RTL layout handled via `html[dir="rtl"]` selectors
- Fonts: **Vazir** (Persian, via jsDelivr npm CDN), **system-ui** (Latin), **JetBrains Mono** (code, via Google Fonts)
- Code blocks are always `direction: ltr` regardless of page direction

## Key Commands

```bash
just install    # install zola via mise (first time)
just serve      # local dev server at http://localhost:1111
just build      # clean build → public/
just check      # validate all internal and external links
```

## Notes

- `public/` is gitignored — built by GitHub Actions on deploy
- `static/` contains only `disqus.html` (loaded directly in `templates/page.html`)
- Transparent `_index.md` / `_index.fa.md` files in each year/month subdir are required for Zola's section routing
- Pandoc-era artifacts (`filters/`, `static/_template.html`, `static/default.css`, `Justfile: build-post`/`build-pdf`, top-level `index.html` symlink) were removed in the 2026-04 cleanup; see `docs/authoring-tools-audit.md` §7
