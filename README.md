# letoan1/homebrew-tap

Homebrew casks for [Roost](https://roost-flame.vercel.app/), the MacBook notch app.

```bash
brew install --cask letoan1/tap/roost
```

Roost is not notarized yet, so the cask removes the quarantine flag after installing. Updates after that come through Roost's built-in updater (Sparkle).

Uninstall: `brew uninstall --cask roost`. Add `--zap` to also delete settings and data.
