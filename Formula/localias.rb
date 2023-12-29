class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/2.0.1+commit.c358250.tar.gz"
  sha256 "025bec2dea965e02aa913c60a1907eccc5c7a82644c8cb20693488b78d217dd8"
  license "MIT"
  version "2.0.1"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/localias/releases/download/2.0.1+commit.c358250"
    sha256 cellar: :any, arm64_monterey: "d356744df1c0de15e897461f54535ef9e2339e4ad021769acbe14d9f72dade23"
    sha256 cellar: :any, monterey: "a446adb1e8320d8e80fc3edcb3896bc661d34f6628c5abb62d3727881c9f4582"
    sha256 cellar: :any, x86_64_linux: "cbcf7bfc7b983e28a9eee1516cb65bb3bb7c6d4e178836a6bfdd732ca338638c"
    sha256 cellar: :any, arm64_linux: "3e58d596512247fffbf4a924040d4eb6215df6cc4556304dc6e577bf0c3c492f"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "2.0.1+commit.c358250"
    version = "2.0.1"
    commit = "c358250"
    ldflags = "-X github.com/peterldowns/localias/cmd/localias/shared.Version=2.0.1 -X github.com/peterldowns/localias/cmd/localias/shared.Commit=c358250"
    # -s -w is standard to make small binaries without debugging information or symbol tables
    # https://stackoverflow.com/a/22276273/829926
    # std_go_args definition is here
    # https://github.com/Homebrew/brew/blob/6db7732fa33ab808e405f8ac7673735edd2c8787/Library/Homebrew/formula.rb#L1565
    system "go", "build", *std_go_args(ldflags: "-s -w " + ldflags, output: bin/"localias"), "./cmd/localias"
  end

  test do
    system bin/"localias", "--help"
  end
end
