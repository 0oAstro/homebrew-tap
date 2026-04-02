cask "noro-player" do
  version "1.0.0"
  sha256 "04dd9086fd5f6b04cf62d263ead4845ff483d76a657898ebed99e00828e4c981"

  url "https://github.com/0oAstro/noro-player-mac/releases/download/v#{version}/NoroPlayer.zip"
  name "Noro Player"
  desc "Retro-styled music player for Apple Music"
  homepage "https://github.com/0oAstro/noro-player-mac"

  depends_on macos: ">= :sonoma"

  app "NoroPlayer.app"

  uninstall quit: "com.0oAstro.NoroPlayer"

  zap trash: [
    "~/Library/Preferences/com.0oAstro.NoroPlayer.plist",
  ]
end
