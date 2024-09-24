class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.1.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.7f13363/pgmigrate-darwin-arm64"
      sha256 "1e230cc4518de67ba639de7f7351e1a8a7354f418626c3be49103357ea599f0d" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.7f13363/pgmigrate-darwin-amd64"
      sha256 "d0241708d2dce478eacbcf829becd1f6f59347b0481b1e668f69630b1088ece4" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.7f13363/pgmigrate-linux-arm64"
      sha256 "7877a38688d4d9945c0f16984af7e3def1107ed99f04c1e0807dbe5eb7fb323f" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.7f13363/pgmigrate-linux-amd64"
      sha256 "1538d714cdabe5bc29e7eea6c84784efcf491e842b138155b5657215fc2d911e" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
