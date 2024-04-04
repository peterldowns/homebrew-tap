class TestLocalias < Formula
  desc "fake"
  homepage "https://github.com/peterldowns/localias"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/peterldowns/localias/releases/download/2.0.3%2Bcommit.c3c6d97/localias-darwin-arm64"
      sha256 "1a303647a8d58de124b0a4101e3252f0802bd089a439be3e163c96477cc04a03"
      bin.install "localias-darwin-arm64" => "localias"
    end
    def install
      bin.install "localias-darwin-arm64" => "localias"
    end
  end

  test do
    system "#{bin}/localias --version"
  end
end
