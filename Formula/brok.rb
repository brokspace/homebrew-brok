class Brok < Formula
  desc "Local-first developer workspace search and agents"
  homepage "https://brokspace.org"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.4.1/brok-macos-aarch64", using: :nounzip
      sha256 "85b5098bb7a501513da1e8f824f0ec19110be8ff0ba69392655c5bf7889f4ec8"
    end
  end

  on_macos do
    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.4.1/brok-macos-x86_64", using: :nounzip
      sha256 "816cdea1863604364c996991ff123e4b2572d18eb83a6712619c3533bbd2a5b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brokspace/brok/releases/download/v0.4.1/brok-linux-aarch64", using: :nounzip
      sha256 "38465814aebcc739e0ad66815dcf5f7b4900a99584a1ce78402335a59e6df297"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokspace/brok/releases/download/v0.4.1/brok-linux-x86_64", using: :nounzip
      sha256 "787dc6a9309985046c92a657c5f3d904ecb3561fe114c3e5975ddeb0a7d70559"
    end
  end

  def install
    candidates = Dir.glob("brok-*").select { |path| File.file?(path) }
    odie "Expected one downloaded brok executable, found #{candidates.length}" unless candidates.length == 1
    bin.install candidates.first => "brok"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brok --version")
  end
end
