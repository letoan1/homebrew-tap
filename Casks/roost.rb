cask "roost" do
  version "1.0.3"
  sha256 "7ef39351df44c6561cc307580ef9bfb0df5a315e4f59f7ba221290947865cfd9"

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
