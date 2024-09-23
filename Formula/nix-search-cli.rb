class NixSearchCli < Formula
  desc "Search for nix packages via search.nixos.org."
  homepage "https://github.com/peterldowns/nix-search-cli"
  version "0.1"
  license "MIT"

  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1+commit.e765237/nix-search-darwin-arm64"
      sha256 "1bd51251fffcd5f451ea164ba8448d533d5a4bfe576dc6e0e3862d44c6e41a5a" # darwin-arm64
      def install
        bin.install "nix-search-darwin-arm64" => "nix-search"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1+commit.e765237/nix-search-darwin-amd64"
      sha256 "2c0f54e0bd0afdb9f7598b3c676c7f68d5d137a17f870f4441440f9d0be08caa" # darwin-amd64
      def install
        bin.install "nix-search-darwin-amd64" => "nix-search"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1+commit.e765237/nix-search-linux-arm64"
      sha256 "8e0cad9f839605facff3a8f093a7a2105887f7ef81b0fd5525628964a8bb9e8c" # linux-arm64
      def install
        bin.install "nix-search-linux-arm64" => "nix-search"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1+commit.e765237/nix-search-linux-amd64"
      sha256 "09e188e9d96ba598b2a8bd85ddcc38fb9017130efbf5607b19d27eaddae35a49" # linux-amd64
      def install
        bin.install "nix-search-linux-amd64" => "nix-search"
      end
    end
  end

  test do
    system "#{bin}/nix-search --help"
  end
end
