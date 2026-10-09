cask "clipsnippet" do
  version "1.5.5"
  sha256 :no_check

  url "https://github.com/metrobee/clipsnippet/releases/download/v#{version}/ClipSnippet.zip"
  name "ClipSnippet"
  desc "Lightweight macOS clipboard history and text expansion tool"
  homepage "https://github.com/metrobee/clipsnippet"

  # Requires macOS 12 Monterey or later (LSMinimumSystemVersion in Info.plist)
  depends_on macos: :monterey

  app "ClipSnippet.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/ClipSnippet.app"]
  end

  zap trash: [
    "~/.clipsnippet_history.json",
    "~/.clipsnippet_snippets.json",
    "~/.clipsnippet_log.txt",
    "~/Library/LaunchAgents/com.metrobee.clipsnippet.plist",
  ]
end
