cask "clipsnippet" do
  version "1.4.0"
  sha256 "95d6e50688f2a78802effd6000736e6613046701134ad5eb55bac95ac87264cc"

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
