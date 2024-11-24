class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.2.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.0+commit.7b263ca/pgmigrate-darwin-arm64"
      sha256 "c5c1cad089ddea45a679acd74b0771270e981b0f5b58fb40a4b49dc40f13fcc1" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.0+commit.7b263ca/pgmigrate-darwin-amd64"
      sha256 "f9d99d4d079f9356077f0ae093c0701cee132d8b4dd77425243f1a84c3601241" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.0+commit.7b263ca/pgmigrate-linux-arm64"
      sha256 "6a4825d1282df482906a5eb5117ed514f48d1bd4eea1520043922b0e7c6e98bd" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.0+commit.7b263ca/pgmigrate-linux-amd64"
      sha256 "5f639afceb3f9e6c6092af527d19448940424f63ba691b09d476556c8a7e8a2e" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
