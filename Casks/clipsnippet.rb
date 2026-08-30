cask "clipsnippet" do
  version "1.5.1"
  sha256 "4380cc3a7d933042eb85b2e83854b2cbf6d4146aa5521a21d4d58fd47a4edb9e"

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
