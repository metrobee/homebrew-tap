class Seen < Formula
  desc "Tormiliselt kiire PlutoF seenevaatluste sisestamise CLI tööriist"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.7.4.tar.gz"
  sha256 "fa88192b0f03cc1dfb7e8c840f1d6bfa4de59827193d78aac8cee96bbcbfdd43"
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
