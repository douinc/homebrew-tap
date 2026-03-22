cask "clicker-remote-receiver" do
  version "1.8"
  sha256 "dffaffaca5ab8091683a63aa9b9a4e12ab6a16500182edf750e188013542d6e8"

  url "https://github.com/douinc/clicker/releases/download/v#{version}/ClickerRemoteReceiver-#{version}.dmg"
  name "Clicker Remote Receiver"
  desc "Presentation remote control - Mac receiver for iOS ClickerRemote app"
  homepage "https://github.com/douinc/clicker"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "ClickerRemoteReceiver.app"

  postflight do
    # Open Privacy & Security > Accessibility settings (works on macOS Ventura+)
    system_command "/usr/bin/open",
                   args: ["x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.dou.clicker-mac.plist",
    "~/Library/Application Support/ClickerRemoteReceiver",
  ]
end
