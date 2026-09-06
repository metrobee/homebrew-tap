class Seen < Formula
  desc "Tormiliselt kiire PlutoF seenevaatluste sisestamise CLI tööriist"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.6.9.tar.gz"
  sha256 "a6ac645e67a28909f032583a9edbb1d0dfc37a91a249d2883fbe332b28157d6e"
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
