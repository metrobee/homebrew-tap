class Seen < Formula
  desc "PlutoFF: Professionaalne CLI tööriist seenevaatluste edastamiseks PlutoF / eElurikkuse andmebaasi"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "c1e00a0b4aeee766a03d9d1e0bbd3e8522f91df6c33b09f00c24284de31317ad"
  license "MIT"

  def install
    libexec.install "seen.py", "requirements.txt", ".env.example" if File.exist?(".env.example")
    libexec.install "google_photos_sync.py" if File.exist?("google_photos_sync.py")

    (bin/"seen").write <<~EOS
      #!/usr/bin/env bash
      exec python3 "#{libexec}/seen.py" "$@"
    EOS
    chmod 0755, bin/"seen"

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
      PlutoFF ('seen') on edukalt paigaldatud!
      
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
