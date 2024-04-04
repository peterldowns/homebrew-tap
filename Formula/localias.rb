class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  version "2.0.3"
  license "MIT"


  on_macos do
    # darwin-arm-64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/localias/releases/download/2.0.3%2Bcommit.c3c6d97/localias-darwin-arm64"
      sha256 "1a303647a8d58de124b0a4101e3252f0802bd089a439be3e163c96477cc04a03"
      def install
        bin.install "localias-darwin-arm64" => "localias"
      end
    end
    # darwin-amd-64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/localias/releases/download/2.0.3%2Bcommit.c3c6d97/localias-darwin-amd64"
      sha256 "cb707dedb074244a0a69a6a71ba593e4bf68538a9749e80ec4646bf93f4b1cc9"
      def install
        bin.install "localias-darwin-amd64" => "localias"
      end
    end
  end
  on_linux do
    # linux-arm-64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/2.0.3%2Bcommit.c3c6d97/localias-linux-arm64"
      sha256 "097975183d998d8d11357122cd95f045d2468534d41abc07be72c8a287dbf08e"
      def install
        bin.install "localias-linux-arm64" => "localias"
      end
    end
    # linux-amd-64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/2.0.3%2Bcommit.c3c6d97/localias-linux-amd64"
      sha256 "cc498a02272d3358277df13887517a7d432cc933d5754657fac69c893e39a943"
      def install
        bin.install "localias-linux-amd64" => "localias"
      end
    end
  end

  test do
    system "#{bin}/localias --version"
  end
end
