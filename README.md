# Seezo Homebrew Tap

Homebrew formulae for [Seezo](https://seezo.io) tools.

The Seezo CLI repository is internal. Reuse an authenticated GitHub CLI session
when Homebrew downloads release assets:

```sh
export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"
brew install seezo-io/tap/seezo
```

Or:

```sh
export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"
brew tap seezo-io/tap
brew install seezo
```

See [Seezo-io/cli](https://github.com/Seezo-io/cli) for CLI documentation.
