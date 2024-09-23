class NixSearchCli < Formula
  desc "Search for nix packages via search.nixos.org"
  homepage "https://github.com/peterldowns/nix-search-cli"
  version "0.1"
  license "MIT"

  on_macos do
    # darwin-arm-64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1%2Bcommit.b7ded4d/nix-search-darwin-arm64"
      sha256 "7862fd112df0333c37f16c5133b6d29389ed4847759cb25dd88d34326d21b5dc"
      def install
        bin.install "nix-search-darwin-arm64" => "nix-search"
      end
    end
    # darwin-amd-64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1%2Bcommit.b7ded4d/nix-search-darwin-amd64"
      sha256 "f59d534119b6ab3cd46223e5829491d2c358274659d42b8580db60efde83e6b5"
      def install
        bin.install "nix-search-darwin-amd64" => "nix-search"
      end
    end
  end
  on_linux do
    # linux-arm-64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1%2Bcommit.b7ded4d/nix-search-linux-arm64"
      sha256 "b595834c636011a9e3bce0812a49b4e1b0b91004f32efafb0cf10bb35dbf2056"
      def install
        bin.install "nix-search-linux-arm64" => "nix-search"
      end
    end
    # linux-amd-64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/nix-search-cli/releases/download/0.1%2Bcommit.b7ded4d/nix-search-linux-amd64"
      sha256 "f9a7556499e792ea75cbb587ddf60de64d06dde1abaa5f31054d9137718899cb"
      def install
        bin.install "nix-search-linux-amd64" => "nix-search"
      end
    end
  end

  test do
    system "#{bin}/nix-search --help"
  end
end
