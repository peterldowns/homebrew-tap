class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.2.1"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.1+commit.99e6ac2/pgmigrate-darwin-arm64"
      sha256 "40baa3900871239607a0e7583cad0e71555973eaac3de88afb11633878d5b1f7" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.1+commit.99e6ac2/pgmigrate-darwin-amd64"
      sha256 "ef1cba33ab69b2a3f310ee0c0e7a9f6eea5f57b87b274929d695636ff18360fa" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.1+commit.99e6ac2/pgmigrate-linux-arm64"
      sha256 "a78276149cb6458cc5486188e244fca6a4b92eabf5d3914da1de01ade250ad0b" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.2.1+commit.99e6ac2/pgmigrate-linux-amd64"
      sha256 "35e4f9aff04fff38b6639561c340f0292ef4b2a3948324075770b31a311f33b3" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
