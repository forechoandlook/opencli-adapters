# Changelog

## 0.1.1 — 2026-08-10

- `xiaohongshu favorites --all true` now reads the personal-favorites page until it is stable instead of stopping at the first screen. Results include a signed detail URL and a per-note download command; `favorite_time` is populated only when the page actually provides it.
- `bilibili favorite --all true` now walks every page in every folder (or one selected folder), and includes folder, BV, favorite/published timestamps, duration, description, cover, and a per-video download command.

## 0.1.0 — 2026-08-10

- Initial public snapshot of opencli YAML adapters (synced from opencli-rs `adapters/`).
- Includes recent work: opencli KV-aware `xiaohongshu favorites`, `bilibili` me/favorites/favorite/following mid cache keys, and the broader site pack (80+ families).
