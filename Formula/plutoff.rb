class Seen < Formula
  desc "PlutoFF: CLI tööriist seene- ja taimevaatluste edastamiseks PlutoF / eElurikkuse andmebaasi"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "db2a9fd9234897831f2798ccd85df1a42e9ee9d8c21b5b03d68b1700b125ec3c"
  license "MIT"

  def install
    libexec.install "seen.py", "requirements.txt", ".env.example" if File.exist?(".env.example")
    libexec.install "taim.py" if File.exist?("taim.py")
    libexec.install "google_photos_sync.py" if File.exist?("google_photos_sync.py")

    (bin/"seen").write <<~EOS
      #!/usr/bin/env bash
      exec python3 "#{libexec}/seen.py" "$@"
    EOS
    chmod 0755, bin/"seen"

    (bin/"taim").write <<~EOS
      #!/usr/bin/env bash
      exec python3 "#{libexec}/taim.py" "$@"
    EOS
    chmod 0755, bin/"taim"

    (bin/"plutoff").write <<~EOS
      #!/usr/bin/env bash
      exec python3 "#{libexec}/seen.py" "$@"
    EOS
    chmod 0755, bin/"plutoff"

    if File.directory?("completions")
      zsh_completion.install "completions/seen.zsh" => "_seen" if File.exist?("completions/seen.zsh")
      bash_completion.install "completions/seen.bash" => "seen" if File.exist?("completions/seen.bash")
    end
  end

  def caveats
    <<~EOS
      PlutoFF ('seen' ja 'taim') on edukalt paigaldatud!
      
      Esmakordsel seadistamisel loo fail ~/.plutof_env oma PlutoF volitustega:
        PLUTOF_CLIENT_ID=sinu_id
        PLUTOF_CLIENT_SECRET=sinu_secret
        PLUTOF_USERNAME=sinu_kasutajanimi
        PLUTOF_PASSWORD=sinu_parool

      Käskude testimiseks:
        seen --help
        taim --help
    EOS
  end

  test do
    system "#{bin}/seen", "--help"
    system "#{bin}/taim", "--help"
  end
end
