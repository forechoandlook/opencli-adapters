# Changelog

## 0.1.4 — 2026-08-10

- Added `douyin feed` and `douyin search`, returning stable `aweme_id` values that can be passed to `douyin download`.
- Added `douyin download` with 576p/720p selection, work statistics, and the page-authorized media URL.
- `xiaohongshu feed` now preserves signed feed links and includes `author_id`; `xiaohongshu download` accepts signed search-result links.
- Bilibili and Zhihu downloads now preserve first-page comments in the downloaded Markdown.

## 0.1.3 — 2026-08-10

- `bilibili favorite` and `bilibili favorites` now treat `--limit` as the total number of videos to return. Requests above Bilibili's 40-item page size automatically continue through later pages until the limit or folder end.

## 0.1.2 — 2026-08-10

- `bilibili favorites` now exports concrete videos by default. It includes collection/published timestamps, metadata, detail URL, and a per-video download command; `bilibili folders` keeps the lightweight folder-list view.
- The extension offers “保存当前页收藏内容” on `space.bilibili.com/<mid>/favlist`, including dynamic account IDs, and saves only items already rendered in the current page.
- `xiaohongshu favorites` current-page action now matches `/user/profile/<userId>` correctly and still validates the personal-favorites query parameters before extraction.
- Added `zhihu favorites` for concrete entries across the current account's collections.

## 0.1.1 — 2026-08-10

- `xiaohongshu favorites --all true` now reads the personal-favorites page until it is stable instead of stopping at the first screen. Results include a signed detail URL and a per-note download command; `favorite_time` is populated only when the page actually provides it.
- `bilibili favorite --all true` now walks every page in every folder (or one selected folder), and includes folder, BV, favorite/published timestamps, duration, description, cover, and a per-video download command.

## 0.1.0 — 2026-08-10

- Initial public snapshot of opencli YAML adapters (synced from opencli-rs `adapters/`).
- Includes recent work: opencli KV-aware `xiaohongshu favorites`, `bilibili` me/favorites/favorite/following mid cache keys, and the broader site pack (80+ families).
