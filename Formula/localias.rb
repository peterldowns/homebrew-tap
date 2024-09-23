class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  version "v2.2.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/localias/releases/download/v2.2.0+commit.d73df9b/localias-darwin-arm64"
      sha256 "c95348a170893ac9c95edffc61ab04542001e0abc0f972a09166b14c4520f57e" # darwin-arm64
      def install
        bin.install "localias-darwin-arm64" => "localias"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/localias/releases/download/v2.2.0+commit.d73df9b/localias-darwin-amd64"
      sha256 "68f0ca33fe7378bc5dc1ccf1eb7dfdf4666cea4d30a6c98b05f9a1ab4653c78b" # darwin-amd64
      def install
        bin.install "localias-darwin-amd64" => "localias"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/v2.2.0+commit.d73df9b/localias-linux-arm64"
      sha256 "6473e5228f15367f016f3d88c0ca48aede6b674fb64ac8b869479a2fa5566105" # linux-arm64
      def install
        bin.install "localias-linux-arm64" => "localias"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/v2.2.0+commit.d73df9b/localias-linux-amd64"
      sha256 "50c1802c34724c01add0830572a58f091d82eb85acc2bba2f33d02160c265362" # linux-amd64
      def install
        bin.install "localias-linux-amd64" => "localias"
      end
    end
  end

  test do
    system "#{bin}/localias --version"
  end
end
