cask "silveredge" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "8554760b22e49b36243a43e4f2828fc7ddde07cab8566622d0aa1550a7fcec18",
         intel: "494289ff82f9fef5d2c31db9ca55491564baba9962cfa875e01bb5e4844c99ba"

  url "https://github.com/akarazniewicz/silveredge/releases/download/v#{version}/SilverEdge-#{version}-#{arch}.zip"
  name "SilverEdge"
  desc "Ultra-light menu-bar CPU and memory monitor"
  homepage "https://github.com/akarazniewicz/silveredge"

  depends_on macos: :sequoia

  app "SilverEdge.app"

  # Self-signed releases need app-specific quarantine removal on install and upgrade.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SilverEdge.app"]
  end

  uninstall quit: "com.silveredge.app"

  caveats <<~EOS
    SilverEdge is self-signed and not notarized by Apple.
    This cask removes download quarantine from SilverEdge.app only.
  EOS
end
