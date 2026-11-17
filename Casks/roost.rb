cask "roost" do
  version "1.1.0"
  sha256 "ec17b0107bbec969c89f294658dd9e3e39da7fd70420109e1bff1eea83ce9640"

  url "https://github.com/letoan1/notch-app/releases/download/v#{version}/Roost-#{version}.dmg"
  name "Roost"
  desc "Turns the MacBook notch into a home for music, calendar, files and Claude Code"
  homepage "https://roost-flame.vercel.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Roost updates itself through Sparkle after the first install.
  auto_updates true
  depends_on macos: :sonoma

  app "Roost.app"

  # Roost is not notarized: clear the quarantine flag so the first launch is not blocked by Gatekeeper.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Roost.app"],
        writable_paths: ["Roost.app"],
        writable_base:  :appdir
  end

  uninstall quit: "io.github.letoan1.roost"

  zap trash: [
    "~/Library/Application Support/Roost",
    "~/Library/Caches/io.github.letoan1.roost",
    "~/Library/HTTPStorages/io.github.letoan1.roost",
    "~/Library/HTTPStorages/io.github.letoan1.roost.binarycookies",
    "~/Library/Preferences/io.github.letoan1.roost.plist",
  ]
end
