class Seen < Formula
  desc "Professionaalne käsureatööriist seenevaatluste edastamiseks PlutoF / eElurikkuse andmebaasi"
  homepage "https://github.com/metrobee/seen-cli"
  url "https://github.com/metrobee/seen-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b6947521632801bf398f5741b7829b78354666365efedacfca6495cd32a3e3d5"
  license "MIT"

  def install
    libexec.install "seen.py", "google_photos_sync.py", "requirements.txt", ".env.example"

    (bin/"seen").write <<~EOS
      #!/usr/bin/env bash
      exec python3 "#{libexec}/seen.py" "$@"
    EOS
    chmod 0755, bin/"seen"
  end

  def caveats
    <<~EOS
      🍄 PlutoF 'seen' CLI on edukalt paigaldatud!
      
      Esmakordsel seadistamisel loo fail ~/.plutof_env oma PlutoF volitustega:
        PLUTOF_CLIENT_ID=sinu_id
        PLUTOF_CLIENT_SECRET=sinu_secret
        PLUTOF_USERNAME=sinu_kasutajanimi
        PLUTOF_PASSWORD=sinu_parool

      Käsu testimiseks käivita:
        seen --help
    EOS
  end

  test do
    system "#{bin}/seen", "--help"
  end
end
