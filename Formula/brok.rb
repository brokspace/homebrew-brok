class Brok < Formula
  desc "Local-first developer workspace search and agents"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.7.0/brok-macos-aarch64", using: :nounzip
      sha256 "cfb144860ad3a26519fdd6902a8ee6fa570a57a543ffc8396d23109c5a8dcfc6"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.7.0/brok-macos-x86_64", using: :nounzip
      sha256 "b241195132a7efed0ab19ffe3610e2f5c16f29648a28e0719514a452b8f78c4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.7.0/brok-linux-aarch64", using: :nounzip
      sha256 "91a149089d3ada1a1194f5a0b47e8857d19af421d3381dc9fc1b7f2f84cb661f"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.7.0/brok-linux-x86_64", using: :nounzip
      sha256 "5f5ffad7216c49032a2739a1ae60c095ba2c48386ca2bd387023a47a4e7efccc"
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
