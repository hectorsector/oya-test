# go-oya-go

Hugo + PocketBase site for [Orlando Youth Alliance](https://orlandoyouthalliance.org/).

## Dev

```bash
cd site
hugo server --ignoreCache --noHTTPCache
# serves at http://localhost:1313/oya-test/
```

---

## Cheatsheet

### Config
| What | Where |
|------|-------|
| Site title, language, author/headline/socials | `site/config/_default/languages.en.toml` |
| Theme params (logo, colors, homepage layout) | `site/config/_default/params.toml` |
| Base URL, theme | `site/hugo.toml` |
| Local dev overrides (PocketBase URL) | `site/config/development/params.toml` |

### Layouts (our overrides — edit these)
| What | Where |
|------|-------|
| Full page wrapper (body, header slot, main slot) | `site/layouts/_default/baseof.html` |
| Homepage: hero image + title + socials + button panel + content | `site/layouts/partials/home/hero.html` |
| Pages section list (PocketBase integration) | `site/layouts/pages/list.html` |

### Layouts (theme originals — read for reference, don't edit)
| What | Where |
|------|-------|
| Hero title/headline/socials HTML | `site/themes/blowfish/layouts/partials/home/hero.html` |
| Navbar (logo + menu) | `site/themes/blowfish/layouts/partials/header/basic.html` |
| Header wrapper (fixed/scroll behavior) | `site/themes/blowfish/layouts/partials/header/fixed.html` |
| All homepage layout variants (profile, card, background…) | `site/themes/blowfish/layouts/partials/home/` |

### Content
| What | Where |
|------|-------|
| Homepage text (mission, youth, parents sections) | `site/content/_index.md` |
| Pages section stub | `site/content/pages/_index.md` |

### Assets
| What | Where |
|------|-------|
| All images (logo, hero, section photos) | `site/assets/img/` |

### Key rule
To override any theme partial/layout, copy it to the same relative path under `site/layouts/` and edit there. Hugo will use your version over the theme's.
