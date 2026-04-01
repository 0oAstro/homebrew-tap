cask "tuna" do
  version "0.52,1098"
  sha256 "401d4e9466fa7e5fa311d8b1ab0b5fa73615d5bdfad23584cc3ebb7044fc0b18"

  url "https://tunaformac.com/download/latest"
  name "Tuna"
  desc "Music control and Now Playing for Mac"
  homepage "https://tunaformac.com/"

  app "Tuna.app"

  zap trash: [
    "~/Library/Preferences/com.charliemonroe.Tuna.plist",
    "~/Library/Application Support/Tuna",
  ]
end
