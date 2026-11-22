class BrokAgent < Formula
  desc "Default Brokspace agent and shard runtime"
  homepage "https://brokspace.org"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.2.1/brok-agent-macos-aarch64", using: :nounzip
      sha256 "cb9ae6434b2db0fead4ff6236b7ef4e07cd164fc689f9fa3ee4f054f86a3d9b0"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.2.1/brok-agent-macos-x86_64", using: :nounzip
      sha256 "74bac46e8dd9fcf33348035cd21d2c906d3054094202922f7624f74572e01e0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.2.1/brok-agent-linux-aarch64", using: :nounzip
      sha256 "5c6d4c1257ee90a381cabd43287d694f3bc57ed0bf86d17515a14f54ac946551"
    end

    on_intel do
      url "https://github.com/brokspace/brok-agent/releases/download/v0.2.1/brok-agent-linux-x86_64", using: :nounzip
      sha256 "a5bc232b21060f0439d47f4d791fdf6c306ce14633c06f3070ada4d8327d0b74"
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
