class Seen < Formula
  desc "Tormiliselt kiire PlutoF seenevaatluste sisestamise CLI tööriist"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "1bf4c165f95218359d2f4f0e12813d196233aa22bb468b1beb30d88cd8bb9df0"
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
