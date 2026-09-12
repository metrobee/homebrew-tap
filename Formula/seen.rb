class Seen < Formula
  desc "Tormiliselt kiire PlutoF seenevaatluste sisestamise CLI tööriist"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.7.3.tar.gz"
  sha256 "f1d5d7c7803183b35614b397248f11282a0eb167874e64d2f9a836156d1c981f"
  license "MIT"

  depends_on "python@3.11"
  depends_on "exiftool"

  def install
    bin.install "seen.py" => "seen"
  end

  test do
    system "#{bin}/seen", "--version"
  end
end
