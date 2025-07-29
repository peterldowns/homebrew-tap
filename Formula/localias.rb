class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  version "v3.0.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/localias/releases/download/v3.0.0+commit.30eb016/localias-darwin-arm64"
      sha256 "f027edb9f929446877a46953b379494aec94ae3d9915bf2fed1609ad6b6ad41d" # darwin-arm64
      def install
        bin.install "localias-darwin-arm64" => "localias"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/localias/releases/download/v3.0.0+commit.30eb016/localias-darwin-amd64"
      sha256 "bfd8326837fcc4f8fa52d19f421a2ccaa1847287272c9585bb471346444886fc" # darwin-amd64
      def install
        bin.install "localias-darwin-amd64" => "localias"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/v3.0.0+commit.30eb016/localias-linux-arm64"
      sha256 "b8c2c1ccdc67342995a0347e0df97e24ee4d87e9bd8750dc59e6ff1e117e8eae" # linux-arm64
      def install
        bin.install "localias-linux-arm64" => "localias"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/v3.0.0+commit.30eb016/localias-linux-amd64"
      sha256 "2031d747d9197e4f9671dc03da2ed1ed0b6f413556a78245b14b48ddf881551c" # linux-amd64
      def install
        bin.install "localias-linux-amd64" => "localias"
      end
    end
  end

  test do
    system "#{bin}/localias --version"
  end
end
