class NixSearchCli < Formula
  desc "Search for nix packages via search.nixos.org."
  homepage "https://github.com/peterldowns/nix-search-cli"
  version "v0.3"
  license "MIT"

  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.3+commit.8ecb614/nix-search-darwin-arm64"
      sha256 "76d0b06a231b43ccfa2c7adcbf28feb379058d38ce94cac5acbe54a65144b344" # darwin-arm64
      def install
        bin.install "nix-search-darwin-arm64" => "nix-search"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.3+commit.8ecb614/nix-search-darwin-amd64"
      sha256 "2e6f8abdd8f8e22789ca97f294c109691a6b0290e40d094cf1cb53dadad26a89" # darwin-amd64
      def install
        bin.install "nix-search-darwin-amd64" => "nix-search"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.3+commit.8ecb614/nix-search-linux-arm64"
      sha256 "ed40ef60496d76ad4655a24d182a55a19d526e7b0f0cdaf489876384defe9083" # linux-arm64
      def install
        bin.install "nix-search-linux-arm64" => "nix-search"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/v0.3+commit.8ecb614/nix-search-linux-amd64"
      sha256 "07235e62d55b7fcb4eea487784cf800261f574c5f5edb1507d2a02ed44a8bd82" # linux-amd64
      def install
        bin.install "nix-search-linux-amd64" => "nix-search"
      end
    end
  end

  test do
    system "#{bin}/nix-search --help"
  end
end
