class Seen < Formula
  desc "Tormiliselt kiire PlutoF seenevaatluste sisestamise CLI tööriist"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.6.4.tar.gz"
  sha256 "372045838799dcee51e9e054d69dbe2f5444b6249da10f9d02dad541fcd89913"
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
