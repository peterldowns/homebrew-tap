class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.3.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.0+commit.600ab78/pgmigrate-darwin-arm64"
      sha256 "827be4a55b0efba7fc7563799f48704b2ae4e55b01fdd2a53a502557b8bf5d0d" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.0+commit.600ab78/pgmigrate-darwin-amd64"
      sha256 "6fddf979fee67ec798d372932bf41cdfc06adc023b81a424403cbe172bb451c7" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.0+commit.600ab78/pgmigrate-linux-arm64"
      sha256 "fd30a48a0f2f3ad8180121fb0f1cef936f04dbd81f6aa15cbc67abbe552b50a4" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.3.0+commit.600ab78/pgmigrate-linux-amd64"
      sha256 "dc340bc5b2879eaf8134cde9a0bdebfacd41094b9d66a5678c037376b569ef19" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
