# Brokspace Homebrew tap

The official Homebrew tap for [Brokspace](https://brokspace.org): `brok` (local-first workspace search and memory) and `brok-agent` (the default agent shard).

## Install

```sh
brew install brokspace/brok/brok
brew install brokspace/brok/brok-agent   # optional
```

The formulae download the standalone binaries from the GitHub Releases of [`brokspace/brok`](https://github.com/brokspace/brok/releases) and [`brokspace/brok-agent`](https://github.com/brokspace/brok-agent/releases) and verify the SHA-256 published next to each asset. Nothing is compiled.

Supported: macOS (Apple Silicon and Intel) and Linux (ARM64 and x86_64). On Windows use `winget`/`scoop` or the release binary, see the [install guide](https://github.com/brokspace/brok#install).

## How the formulae are updated

Never edit `Formula/` by hand. After both releases are published, a maintainer runs **Actions → Update Homebrew tap** in `brokspace/brok` with the two tags. It regenerates `Formula/brok.rb` and `Formula/brok-agent.rb` from the release checksums and opens a pull request here; CI runs `brew style`, `brew audit` and a real install, and the PR is merged after review.

## Licence

`MIT OR Apache-2.0`, see `LICENSE-MIT` and `LICENSE-APACHE`. The Brokspace name and logo are covered by the [name and logo policy](https://github.com/brokspace/.github/blob/main/TRADEMARKS.md).
