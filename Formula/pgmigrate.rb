class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  version "v0.1.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.d9f6b58/pgmigrate-darwin-arm64"
      sha256 "3914c5692bba3f75f4168d812de0f8406cd57bb31876fc7fc2b6fafe97d6e64d" # darwin-arm64
      def install
        bin.install "pgmigrate-darwin-arm64" => "pgmigrate"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.d9f6b58/pgmigrate-darwin-amd64"
      sha256 "c6bfe1059a88a890185e8128e373f9bd4f4f06d0e3e182eee48718e6eb197787" # darwin-amd64
      def install
        bin.install "pgmigrate-darwin-amd64" => "pgmigrate"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.d9f6b58/pgmigrate-linux-arm64"
      sha256 "5cc1b156a5cbdf1a30c66ad04dd95c1474eeb4ada13755503f49ff59449fae6d" # linux-arm64
      def install
        bin.install "pgmigrate-linux-arm64" => "pgmigrate"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/pgmigrate/releases/download/v0.1.0+commit.d9f6b58/pgmigrate-linux-amd64"
      sha256 "7bc6d9854e9f483cf013fc0e19343ad839ad63c2463964f5e558bb4310da1c9e" # linux-amd64
      def install
        bin.install "pgmigrate-linux-amd64" => "pgmigrate"
      end
    end
  end

  test do
    system "#{bin}/pgmigrate --help"
  end
end
