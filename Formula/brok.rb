class Brok < Formula
  desc "Local-first developer workspace search and agents"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.8.0/brok-macos-aarch64", using: :nounzip
      sha256 "182ff21ed1f52f598be08c8608803315476ee251d52002712c93de31874feab3"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.8.0/brok-macos-x86_64", using: :nounzip
      sha256 "653ae2a70e83315c8a3d883ff9e574e2e397c25060c589fd8ebd84d9eb3fe1d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.8.0/brok-linux-aarch64", using: :nounzip
      sha256 "a23bfb1aedbe302fc283b77eb1ec8b280ac54dd09777a69d4471c920f9cfbb72"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.8.0/brok-linux-x86_64", using: :nounzip
      sha256 "2bcc342789e34484b6bcf50fa876a48fb8f33bf6fd7a36755304f2f89829a8f3"
    end
  end

  def install
    candidates = Dir.glob("brok-*").select { |path| File.file?(path) }
    odie "Expected one downloaded brok executable, found #{candidates.length}" if candidates.length != 1
    bin.install candidates.first => "brok"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brok --version")
  end
end
