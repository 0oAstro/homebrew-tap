cask "noro-player" do
  version "1.0.0"
  sha256 "b27d2032d0441269c92b14cb66120adbab3cdbaac8e748bcb9281cd94bf8744d"

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
