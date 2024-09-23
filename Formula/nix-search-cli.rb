class NixSearchCli < Formula
  desc "Search for nix packages via search.nixos.org."
  homepage "https://github.com/peterldowns/nix-search-cli"
  version "v0.2"
  license "MIT"

  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.2+commit.7d6b4c5/nix-search-darwin-arm64"
      sha256 "3e400fa4c83b6a338d55f618ebcc014a1b24c03ee7c0a6cc44bd384732dcaba0" # darwin-arm64
      def install
        bin.install "nix-search-darwin-arm64" => "nix-search"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.2+commit.7d6b4c5/nix-search-darwin-amd64"
      sha256 "d62f23e0063456dcc5d6704a14ea0166feb11adb20ac27ad72b40773e9b630fe" # darwin-amd64
      def install
        bin.install "nix-search-darwin-amd64" => "nix-search"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.2+commit.7d6b4c5/nix-search-linux-arm64"
      sha256 "3d7d7eaa8a261f716921d9ca70c5fc8e56631a5148d2cd408cbcfa23a2e67e2e" # linux-arm64
      def install
        bin.install "nix-search-linux-arm64" => "nix-search"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.2+commit.7d6b4c5/nix-search-linux-amd64"
      sha256 "63c02c4a44277fa69f50ab790718c5d188de1fd2f6ee51b08f2a5bfbf6ac56af" # linux-amd64
      def install
        bin.install "nix-search-linux-amd64" => "nix-search"
      end
    end
  end

  test do
    system "#{bin}/nix-search --help"
  end
end
