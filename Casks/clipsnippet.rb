cask "clipsnippet" do
  version "1.0.1"
  sha256 "519f49f78bb9a72cd5fd8b4e809cb6b7975e3a292b2b3710b6eef97f86d2e737"

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
