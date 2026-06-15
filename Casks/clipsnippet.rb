cask "clipsnippet" do
  version "1.1.0"
  sha256 "cfc5ae222e51bbd7b21fea0ca9501a4a9958138d3b7a2c5e4c7568c18e17f2b4"

  url "https://github.com/metrobee/clipsnippet/releases/download/v#{version}/ClipSnippet.zip"
  name "ClipSnippet"
  desc "Lightweight macOS clipboard history and text expansion tool"
  homepage "https://github.com/metrobee/clipsnippet"

  app "ClipSnippet.app"

  zap trash: [
    "~/.clipsnippet_history.json",
    "~/.clipsnippet_snippets.json",
    "~/.clipsnippet_log.txt",
    "~/Library/LaunchAgents/com.metrobee.clipsnippet.plist",
  ]
end
