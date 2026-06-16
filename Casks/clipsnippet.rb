cask "clipsnippet" do
  version "1.2.0"
  sha256 "35ef66567af3a0b3842547c792113dc06cb2f7165a2cfa0ba123160e43c8ba08"

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
