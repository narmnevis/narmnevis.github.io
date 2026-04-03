# Pandoc Templating Ecosystem - Quick Decision Guide

## TL;DR: What You Should Do

**Your current setup is optimal.** Keep using:
- ✅ Pandoc native template (`$var$` syntax)
- ✅ YAML front matter for metadata (lang, dir, title, etc.)
- ✅ Bash/Just orchestration

**Optional enhancements** (add only when needed):
- Lua filters for language-specific content blocks
- Lua filters for metadata validation
- Lua filters for RTL/LTR consistency checks

---

## Quick Comparison

| Need | Best Tool | Why | Complexity |
|------|-----------|-----|-----------|
| **Simple blog metadata** | Native template | Already working | None |
| **Language-specific content** | Lua filter | No dependencies, powerful | Low |
| **Metadata validation** | Lua filter | Built into pandoc | Low |
| **RTL/LTR auto-fix** | Lua filter | 20 lines of Lua | Low |
| **Complex data generation** | Pre-processor (Jinja2) | If unavoidable | Medium |
| **Novel output format** | Custom Lua writer | Rarely needed | High |

---

## Implementation Roadmap

### Phase 1: Today (5 min)
- ✅ Your template handles lang/dir correctly
- ✅ RTL/LTR support working
- No action needed

### Phase 2: When You Need It (30 min)
Add Lua filter for language-aware content blocks:

```bash
# Update Justfile:
pandoc \
    --template ./static/_template.html \
    --lua-filter ./filters/lang-aware.lua \  # ← Add this
    -f markdown+smart -t html5 \
    ...
```

Then use in posts:
```markdown
::: only-en
This appears only in English.
:::

::: only-fa  
This appears only in Persian.
:::
```

### Phase 3: If Needed Later (1 hour)
- Add metadata validator filter
- Add RTL direction auto-setter
- Create helper filters as use cases emerge

---

## Key Findings

### 1. Native Template Language (Your Current Choice)
- ✅ Sufficient for most blogs
- ✅ No external dependencies
- ✅ Already handles RTL/LTR correctly
- ❌ Limited to simple logic (but that's OK for blogs)

### 2. Lua Filters (The Gap-Filler)
- ✅ Built into pandoc (no extra tools)
- ✅ Powerful for content transformation
- ✅ Perfect for bilingual/RTL handling
- ✅ Chain multiple filters together

### 3. Template Engines (Pre-processing)
- ❌ Adds complexity for blog use case
- ❌ Requires external tool (jinja2, tera, etc.)
- ✅ Only useful for data-driven sites with dynamic content
- **Not recommended for your blog**

### 4. Custom Writers (Complete Control)
- ✅ Maximum power and flexibility
- ❌ Overkill for a blog
- ❌ Requires extensive Lua code
- **Not recommended for your use case**

---

## Why This Is the Best Approach

1. **Minimal dependencies**: Lua is built into pandoc
2. **Proven pattern**: Used by thousands of documentation projects
3. **Evolutionary**: Start simple, add features as needed
4. **Maintainable**: Each filter is small and focused
5. **Bilingual-friendly**: Lua filters excel at language-aware transformations
6. **Future-proof**: Official pandoc features with community support

---

## Ready-to-Use Lua Filters (in ./filters/)

### 1. lang-validator.lua
Auto-sets `dir` based on `lang`, validates consistency.
```bash
pandoc input.md --lua-filter ./filters/lang-validator.lua ...
```

### 2. lang-aware.lua
Removes content blocks marked `only-en` or `only-fa` based on post language.
```bash
# Usage in markdown:
::: only-en
English-only content
:::

::: only-fa
Persian-only content
:::
```

### 3. metadata-validator.lua
Ensures metadata is valid, provides boolean flags for template.
```bash
# Adds: is_rtl, is_ltr, body_class automatically
```

---

## What NOT to Do

❌ **Don't switch to Jinja2/Mustache/Tera**
- Adds unnecessary tool dependency
- Two-stage pipeline (template → markdown → HTML)
- Better for data-driven sites, not blogs

❌ **Don't write a custom Lua writer**
- Overkill for blog use case
- Requires writing hundreds of lines of Lua
- Lua filters already give you what you need

❌ **Don't over-engineer before you need it**
- Your current setup is already optimal
- Add filters only when you have specific needs
- Keep it simple and maintainable

---

## RTL/LTR Verification

Your setup correctly handles:
- ✅ `lang="fa" dir="rtl"` for Persian posts
- ✅ `lang="en" dir="ltr"` for English posts
- ✅ HTML5 standard-compliant attribute placement
- ✅ Browser directionality rendering
- ✅ CSS language-specific styling via `html[lang="fa"]`

No changes needed to core setup. Lua filters can enhance, but not required.

---

## Next Steps

1. **Review** the full research report: `./PANDOC_RESEARCH_REPORT.md`
2. **Copy** the Lua filters from `./filters/` to your project if you adopt them
3. **Update** your Justfile when you need language-specific features
4. **Test** filters locally before deploying (just build blog/2018/03/sample.md)

---

## Questions You Might Have

**Q: Should I switch to Hugo/Jekyll?**
A: No. Your pandoc setup is simpler and more maintainable. You already own your template.

**Q: Is Lua hard to learn?**
A: Not for what we do. The filters are simple (under 30 lines each), focused on specific tasks.

**Q: What if I need something more powerful?**
A: Add a Lua filter for it. You likely won't need pre-processing or custom writers.

**Q: Will this work for 10+ years?**
A: Yes. Pandoc is stable, Lua is standard, your template is simple. Low maintenance risk.

**Q: What about SEO/internationalization?**
A: Your setup already handles it. `lang` and `dir` attributes are all you need. Lua filters can add more metadata if needed later.

---

## Bottom Line

Your current pandoc + bash/just + HTML template setup is:
- ✅ **Simple** - Easy to understand and modify
- ✅ **Modern** - Uses current pandoc 3.9.x features
- ✅ **Easy to maintain** - Minimal dependencies, clear build process
- ✅ **Bilingual-ready** - Already handles Persian/English, RTL/LTR correctly

**The "better" templating system you're looking for doesn't exist because what you have is already it.**

Add Lua filters as your needs evolve. You have a solid foundation.

