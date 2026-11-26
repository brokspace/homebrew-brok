class BrokAgent < Formula
  desc "Default Brokspace agent and shard runtime"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.5.0/brok-agent-macos-aarch64", using: :nounzip
      sha256 "7c1225a9ccec40912c08034a9d59d4c04660f1f459d736acbd00a78b1e86d3fa"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.5.0/brok-agent-macos-x86_64", using: :nounzip
      sha256 "8221b4cdce2df5d3ca7e359ab0f9d53f1c7468b91c9ba886920211d01d289d4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.5.0/brok-agent-linux-aarch64", using: :nounzip
      sha256 "d701ec2812d62bc736505459adbe6b722a2a96199dd5da45467b201085fcf015"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.5.0/brok-agent-linux-x86_64", using: :nounzip
      sha256 "3e226ddd3d3b2b996542b7092206ab16b29c37f0903c91fff9ecd949c9b0705e"
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
