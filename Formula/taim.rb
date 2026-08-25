class Taim < Formula
  desc "Tormiliselt kiire PlutoF taimevaatluste sisestamise CLI tööriist"
  homepage "https://github.com/metrobee/taim"
  url "https://github.com/metrobee/taim/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "python@3.11"
  depends_on "exiftool"

  def install
    bin.install "taim.py" => "taim"
  end

  test do
    system "#{bin}/taim", "--help"
  end
end
