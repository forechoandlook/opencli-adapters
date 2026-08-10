# opencli-adapters

YAML adapters for [opencli](https://github.com/forechoandlook/opencli_rs_plus) / opencli-rs.

This repository is the **distribution** channel for site adapters (`bilibili`, `xiaohongshu`, `zhihu`, …).  
Install or update them with the opencli **plugin** commands — no extra server required.

> **Source of truth (dev):** adapters are still developed and tested inside the [opencli-rs](https://github.com/forechoandlook/opencli_rs_plus) monorepo (`adapters/`).  
> This repo is periodically synced for users who only need the YAML pack.

## Install

Requires opencli with plugin support and a running scheduler daemon for `plugin` commands.

```bash
# install (github: prefix optional for user/repo)
opencli plugin install forechoandlook/opencli-adapters
# or explicitly:
opencli plugin install github:forechoandlook/opencli-adapters

opencli plugin list
opencli adapter search xiaohongshu
```

Local path (symlink, live edits):

```bash
opencli plugin install /path/to/opencli-adapters
```

## Update

```bash
opencli plugin update opencli-adapters
# or all plugins
opencli plugin update
```

Updates are **manual** (or opt-in). Silent auto-overwrite of adapters is intentionally not the default: site pages break often, and a bad pull should not surprise you mid-workflow.

## Layout

```text
opencli-adapters/
  opencli-plugin.json     # plugin name / version
  bilibili/*.yaml
  xiaohongshu/*.yaml
  zhihu/*.yaml
  ...
```

Each `*.yaml` (except `meta.yaml`) is one command. opencli scans the plugin directory recursively.

## Priority (when the same command exists in multiple places)

Typical load order (later may shadow earlier depending on registration):

1. Current working directory `./adapters` (dev)
2. Installed plugins under `~/.opencli-rs/plugins/`
3. `~/.opencli-rs/adapters/` (legacy hand-copied tree)

Prefer **plugins** over hand-copying into `~/.opencli-rs/adapters/`.

## Contributing

1. Prefer opening PRs against **opencli-rs** `adapters/` with a working `cargo run -- <site> <cmd>` check when engine changes are involved.
2. Mirror-only fixes can land here; maintainers will sync both ways when needed.
3. Keep adapters **conservative** on risky sites (no aggressive pagination, no fake signed APIs).

## Sync from opencli-rs (maintainers)

From a checkout of **opencli-rs**:

```bash
./scripts/sync-adapters-repo.sh /path/to/opencli-adapters
```

Or from this repo:

```bash
./scripts/pull-from-opencli-rs.sh /path/to/opencli-rs
```

Then bump `version` in `opencli-plugin.json`, update `CHANGELOG.md`, commit, tag:

```bash
git tag v0.1.1
git push origin main --tags
```

## License

Apache-2.0 — see [LICENSE](./LICENSE).
