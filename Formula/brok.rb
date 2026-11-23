class Brok < Formula
  desc "Local-first developer workspace search and agents"
  homepage "https://brokspace.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.5.0/brok-macos-aarch64", using: :nounzip
      sha256 "4436a99b00837a4b35f7b0fd9c5163713bccc526835abbcd647730f7d51caa67"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.5.0/brok-macos-x86_64", using: :nounzip
      sha256 "f3a5784cfff71b9653a3ee5befaadd661992b87f0503bce09854ff22355ef20c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.5.0/brok-linux-aarch64", using: :nounzip
      sha256 "1056e76519092ba879268b3bc930fbe81f6b9cc1092df6342ba543c4d956bf68"
    end

    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.5.0/brok-linux-x86_64", using: :nounzip
      sha256 "a073c8fac729b877aa9a85e1d9955fd025f56f1e735de65ee32c02780b4c70b5"
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
