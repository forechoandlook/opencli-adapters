# Changelog

## 0.1.8 — 2026-08-16

- Cache login identity (`zhihu:me.url_token`, `xiaohongshu:me.userId`, `bilibili:me.mid`) for 30 days.
- Cache following/followers lists for 1 hour (`--refresh true` to bypass).
- Cache Bilibili WBI keys for 6 hours and username→mid / nickname→url_token resolution for 30 days.

## 0.1.7 — 2026-08-16


- Declare `capabilities` on following / user / ask adapters (`auth`, `paginate`, `incremental`, `download`, `rich_text`).
- Use shared `evaluate.helpers` (`wbi`, `zhihu-fetch`, `pinia-wait`) instead of inlined WBI/MD5 and pinia wait loops.
- `bilibili following --limit` is total rows (auto-paginates past 50), not page size.

## 0.1.6 — 2026-08-16

- `bilibili user-videos` auto-paginates when `--limit` exceeds the 50-item page size (e.g. 100 recent videos).
- `zhihu user` returns an empty list for deleted/empty profiles instead of hard-failing (batch-friendly).
- `xiaohongshu following` waits for the pinia user store after navigate to reduce false “未登录” errors.

## 0.1.5 — 2026-08-16

- Added `xiaohongshu ask` for 点点 AI chat (`/ai_chat`), returning plain text plus rich HTML.
- Added `zhihu ask` for 知乎直答 (`zhida.zhihu.com`), returning plain text plus rich HTML.
- Added `zhihu following` / `zhihu followers` with pagination (`--all true`). Omit the user to read the logged-in account.
- Added `xiaohongshu following` for the current logged-in account (web only exposes this list).
- Added `bilibili user` to list a space's videos, columns and dynamics with WBI pagination (`--all true`, `--type video|article|dynamic|all`, `--incremental true`). Video rows include `download_command`.
- Added `zhihu user` to page a member's answers, articles, zvideos and pins (`--all true`, `--incremental true`).
- `xiaohongshu user` now prefers `/api/sns/web/v1/user_posted` cursor paging instead of a short scroll, emits signed `download_command` when `xsec_token` is present, and supports `--incremental true`.
- User-content rows now expose `cover` and `media_urls`; Zhihu rows include a per-item `download_command`, while Xiaohongshu keeps the signed command required to download every original image/video from a note.
- `bilibili following --all true` now walks the following-list pages up to the requested limit and includes avatar URLs.

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
