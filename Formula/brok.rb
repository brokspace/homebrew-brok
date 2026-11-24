class Brok < Formula
  desc "Local-first developer workspace search and agents"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.6.0/brok-macos-aarch64", using: :nounzip
      sha256 "b1b8735afc823ed27e2f7e2bbbe932564555a74c6024201943ad3d1cc184f2b6"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.6.0/brok-macos-x86_64", using: :nounzip
      sha256 "9b84a4eda1d86e6d704297f33c0e0f47c204f2698ef9274c3bdc8684aeca064b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.6.0/brok-linux-aarch64", using: :nounzip
      sha256 "b0c7b0a9eb0c09cabec8cc46831f12dbfed74f33b2b8ceb49f4e067e900d147f"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.6.0/brok-linux-x86_64", using: :nounzip
      sha256 "2d2f770041463249ac37624016c305e3d72881aeb8c7d52c2a0ca177c1620495"
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
