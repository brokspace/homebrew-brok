class BrokAgent < Formula
  desc "Default Brokspace agent and shard runtime"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.3.0/brok-agent-macos-aarch64", using: :nounzip
      sha256 "6f5f9196458321ce592bde4477b7a25c0698ee60976cb659546d66dbf44ed9dc"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.3.0/brok-agent-macos-x86_64", using: :nounzip
      sha256 "52e92fc511e09239416c27fedcf0f3f30a469c3cff888e28d779022ceafac787"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.3.0/brok-agent-linux-aarch64", using: :nounzip
      sha256 "e7f859cee931d217438127b68a6dc8f7d611770991b6987f0234d3ae6fa56ecf"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.3.0/brok-agent-linux-x86_64", using: :nounzip
      sha256 "91925e987ab48e06057e4ec33e0ab4bc0d9bb9810e0f415dd0cb12ff9a533395"
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
