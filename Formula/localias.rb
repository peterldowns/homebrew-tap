class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  version "2.1.0"
  license "MIT"


  on_macos do
    # darwin-arm-64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0%2Bcommit.46b0a47/localias-darwin-arm64"
      sha256 "8c7922d4675f81babf9855963a16aeb49820fe95423f1309fc553a0bf1e138b3"
      def install
        bin.install "localias-darwin-arm64" => "localias"
      end
    end
    # darwin-amd-64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0%2Bcommit.46b0a47/localias-darwin-amd64"
      sha256 "8513d8d7d0ee2669a71a7ba989d3700cf43feb92ea17656203444ed7b5200d70"
      def install
        bin.install "localias-darwin-amd64" => "localias"
      end
    end
  end
  on_linux do
    # linux-arm-64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0%2Bcommit.46b0a47/localias-linux-arm64"
      sha256 "4a22fd455fc3d1808614bcd610c64467f15489c84524d4f3c2b17bbdbe94c74d"
      def install
        bin.install "localias-linux-arm64" => "localias"
      end
    end
    # linux-amd-64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0%2Bcommit.46b0a47/localias-linux-amd64"
      sha256 "2f058db5520f6860ec4f69ccbe9af33fc59ba20f6e58234f8c6b86d6f2b3babe"
      def install
        bin.install "localias-linux-amd64" => "localias"
      end
    end
  end

  test do
    system "#{bin}/localias --version"
  end
end
