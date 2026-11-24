# Contributing to the Brokspace tap

Thanks for helping. This repository only holds the Homebrew formulae for `brok` and `brok-agent`; everything else lives in [brokspace/brok](https://github.com/brokspace/brok) and [brokspace/brok-agent](https://github.com/brokspace/brok-agent).

## Formulae are generated

`Formula/*.rb` is produced by `scripts/update-homebrew-tap.py` in `brokspace/brok` (workflow **Update Homebrew tap**). Do not edit a formula by hand to bump a version or a checksum: the next run overwrites it.

| You want to... | Do this |
|---|---|
| Release a new version | A maintainer runs **Update Homebrew tap** in `brokspace/brok` with the two release tags. It opens the PR here. |
| Change how formulae are written (description, test block, caveats) | Open the pull request against the generator in `brokspace/brok`, not here. |
| Fix this repository (CI, README, docs) | Open a pull request here, as below. |
| Report a broken install | [Open an issue](https://github.com/brokspace/homebrew-brok/issues) with your OS, `brew --version` and the output of `brew install --verbose brokspace/brok/brok`. |

## Pull requests

1. Fork the repository (maintainers can branch directly) and branch from `main`.
2. Use [Conventional Commits](https://www.conventionalcommits.org/) for the commit and the PR title, for example `ci: pin the setup-homebrew action` or `docs: explain Linux support`. Agents add a `Co-Authored-By:` trailer.
3. Open the pull request against `main`. `main` is protected: no direct pushes, no force pushes, one squash merge per PR.
4. The `tests` workflow must pass on Linux and macOS: `brew style`, `brew audit --strict --online` and a real install with `brew test`. Run the same locally with:

   ```sh
   brew tap brokspace/brok
   brew style brokspace/brok
   brew audit --strict --online brokspace/brok/brok brokspace/brok/brok-agent
   brew install --formula brokspace/brok/brok && brew test brokspace/brok/brok
   ```
5. Resolve every review conversation, then squash merge. The branch is deleted on merge.

## Reviewing a generated formula PR

A PR titled `chore: update Homebrew formulae (vX, vY)` should change only versions, URLs and SHA-256 values. Check that the tags match the published releases, that `tests` is green, and that nothing else moved. Then squash merge.

## Licence

By contributing you agree your work is licensed `MIT OR Apache-2.0`, like the rest of the project.
