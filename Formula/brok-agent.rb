class BrokAgent < Formula
  desc "Default Brokspace agent and shard runtime"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.4.0/brok-agent-macos-aarch64", using: :nounzip
      sha256 "ada42081d99058d42cb3c7851f41e2703a25863d05b8d46a6247a2e93441f514"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.4.0/brok-agent-macos-x86_64", using: :nounzip
      sha256 "0901f0d7f7d82cd749439b44b7ecca7870d73c637d6ee2af2e4000ad427477ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.4.0/brok-agent-linux-aarch64", using: :nounzip
      sha256 "6b2b18e6786795c766ffe91641f6e741c1bf0d15bcd5c4302ffae780e8ff1572"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.4.0/brok-agent-linux-x86_64", using: :nounzip
      sha256 "9b7fec6dd4576d06bf3ce0b293aaecff182255cb562b090c02ef0a95e8008c45"
    end
  end

  def install
    candidates = Dir.glob("brok-agent-*").select { |path| File.file?(path) }
    odie "Expected one downloaded brok-agent executable, found #{candidates.length}" if candidates.length != 1
    bin.install candidates.first => "brok-agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brok-agent --version")
  end
end
