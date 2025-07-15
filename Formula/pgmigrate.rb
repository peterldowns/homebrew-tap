class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.3.1"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.1+commit.80ada56/pgmigrate-darwin-arm64"
      sha256 "b09cfefcb9675fe111d169931f5c6df42187a537ec08c88ba128fc13192e092b" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.1+commit.80ada56/pgmigrate-darwin-amd64"
      sha256 "120a167587371d9320e8d2c655f98ce61c806ea8bc22041f656a31b43f073960" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.1+commit.80ada56/pgmigrate-linux-arm64"
      sha256 "30feb51c1ec8d77cc9dcb97a35ae9ad8c64c813ea8592f96286ba7c5c7bbbf27" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.1+commit.80ada56/pgmigrate-linux-amd64"
      sha256 "fade168a529fd12969d4b8a03f53e063a734b78ed8e72c3581b3c47ae79f9dd7" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
