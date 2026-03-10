# go-oya-go Project

## Stack
- **Hugo** (static site generator) + **PocketBase** (CMS/backend)
- Theme: `ananke`
- `site/` — Hugo project
- `pb_data/` — PocketBase data

## Hugo + PocketBase Integration Pattern
PocketBase runs locally at `http://127.0.0.1:8090`, configured in `site/hugo.toml`:
```toml
[params]
  pocketbaseURL = "http://127.0.0.1:8090"
```

Remote data is fetched in **layout files** using `resources.GetRemote` — NOT in the `data/` directory (static files only).

Example (`site/layouts/pages/list.html`):
```html
{{ define "main" }}
  {{ $url := printf "%s/api/collections/pages/records" site.Params.pocketbaseURL }}
  {{ $response := resources.GetRemote $url }}
  {{ $data := $response | transform.Unmarshal }}
  {{ range $data.items }}
    <h2>{{ .title }}</h2>
    {{ .body | safeHTML }}
  {{ end }}
{{ end }}
```

Each section needs a `content/<section>/_index.md` to activate its layout.

## PocketBase Collections
- `pages` — fields: `title`, `body` (HTML), `slug`, `published`

## Dev Commands
```bash
# Hugo caches remote resources between builds — always use --ignoreCache
# when PocketBase content has changed
hugo server --ignoreCache --noHTTPCache
```
