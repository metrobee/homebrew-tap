cask "clipsnippet" do
  version "1.5.0"
  sha256 "e2da7b57d8a46952795609436f18af3a4b6d2e7cd64fe161a4388d31cec4f413"

  url "https://github.com/metrobee/clipsnippet/releases/download/v#{version}/ClipSnippet.zip"
  name "ClipSnippet"
  desc "Lightweight macOS clipboard history and text expansion tool"
  homepage "https://github.com/metrobee/clipsnippet"

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
