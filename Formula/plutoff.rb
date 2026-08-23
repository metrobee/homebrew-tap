class Seen < Formula
  desc "PlutoFF: Professionaalne CLI tööriist seenevaatluste edastamiseks PlutoF / eElurikkuse andmebaasi"
  homepage "https://github.com/metrobee/plutoff"
  url "https://github.com/metrobee/plutoff/archive/refs/tags/v1.4.9.tar.gz"
  sha256 "cc02b9fc35023441eb551185e93b746ccb1d4605f6f40b301b2f64469f8a54e1"
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
      zsh_completion.install "completions/_seen" => "_seen" if File.exist?("completions/_seen")
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
