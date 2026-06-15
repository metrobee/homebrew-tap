cask "clipsnippet" do
  version "1.0.0"
  sha256 "5a6c41707a4b501cc1ed904b16cdd82acaf9940c3123bf1db6b656a8fa5cd450"

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
