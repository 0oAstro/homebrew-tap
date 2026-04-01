cask "tuna" do
  version "0.52,1098"
  sha256 "401d4e9466fa7e5fa311d8b1ab0b5fa73615d5bdfad23584cc3ebb7044fc0b18"

  url "https://tunaformac.com/download/latest"
  name "Tuna"
  desc "Modern, native macOS launcher built on the ideas of Quicksilver"
  homepage "https://tunaformac.com/"

  depends_on macos: ">= :sequoia"

  auto_updates true

  uninstall quit:       "com.brnbw.Tuna",
            login_item: "Tuna"

  app "Tuna.app"

  zap trash: [
    "~/Library/Application Support/com.brnbw.Tuna",
    "~/Library/Application Support/Tuna",
    "~/Library/Caches/com.brnbw.Tuna",
    "~/Library/Cookies/com.brnbw.Tuna.binarycookies",
    "~/Library/HTTPStorages/com.brnbw.Tuna",
    "~/Library/Preferences/com.brnbw.Tuna.plist",
    "~/Library/Saved Application State/com.brnbw.Tuna.savedState",
    "~/Library/WebKit/com.brnbw.Tuna",
  ]
end
