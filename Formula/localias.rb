class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  version "2.1.0"
  license "MIT"


  on_macos do
    # darwin-arm64
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0+commit.fcaac03/localias-darwin-arm64"
      sha256 "e629d4ea687c381a287f393e124e3c2db2dbc7a710dda2d15a96d0b43d23a1db" # darwin-arm64
      def install
        bin.install "localias-darwin-arm64" => "localias"
      end
    end
    # darwin-amd64
    if Hardware::CPU.intel?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0+commit.fcaac03/localias-darwin-amd64"
      sha256 "0a3f6d6ffdab28313ae4d17495e506179bb362a10a5c21e48ecbb0a4b967aab0" # darwin-amd64
      def install
        bin.install "localias-darwin-amd64" => "localias"
      end
    end
  end
  on_linux do
    # linux-arm64
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0+commit.fcaac03/localias-linux-arm64"
      sha256 "9915e2bc7e9101c36a20d5f6394fca238a3252c4f588e741025c769acd30846b" # linux-arm64
      def install
        bin.install "localias-linux-arm64" => "localias"
      end
    end
    # linux-amd64
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/peterldowns/localias/releases/download/2.1.0+commit.fcaac03/localias-linux-amd64"
      sha256 "83964c03bbb4a0a026a6c63108f6807d8ec7c9427759a99975a2d14b15f6140c" # linux-amd64
      def install
        bin.install "localias-linux-amd64" => "localias"
      end
    end
  end

  test do
    system "#{bin}/localias --version"
  end
end
