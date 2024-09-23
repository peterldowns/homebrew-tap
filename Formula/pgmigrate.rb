class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.0.7"
  license "MIT"

  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.0.7+commit.655bff6/pgmigrate-darwin-arm64"
      sha256 "a2b02fa91c00dfa2a53beeb4fd723181cb56237e3f8ecee571057592c68d2517" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.0.7+commit.655bff6/pgmigrate-darwin-amd64"
      sha256 "fdb38724efcfa44480a56bc3af94277e3abe3659c6b8d2ee7020be66b4c615e1" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.0.7+commit.655bff6/pgmigrate-linux-arm64"
      sha256 "99955dcb8cac7bf77b7b8c8fdfe6624542654ca76646591c0ddf35d7b3d572ea" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.0.7+commit.655bff6/pgmigrate-linux-amd64"
      sha256 "9d761ff781f2bc353520ab25ef11f77ce2abf34383c1e1cefe667d909cb4fa0d" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
