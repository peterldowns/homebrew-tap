class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/2.0.0+commit.6fd5535.tar.gz"
  sha256 "1a19e4a4b22aa6784597e386bfb2a6fb552fb3481c015371e2b9ba268b910eae"
  license "MIT"
  version "2.0.0"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/localias/releases/download/2.0.0+commit.6fd5535"
    sha256 cellar: :any, arm64_monterey: "05cb1be91a62609fdc405c4c6c77cec3a546f6d73a6c8ce56c90d0b7f6a15710"
    sha256 cellar: :any, monterey: "05839c6fd2ac9fe86de3094a9bec955c1e439e57ff274b565d76990140042d70"
    sha256 cellar: :any, x86_64_linux: "ee2fcce633d46a1aca500c0773808add422a6327cceb3402aed17052f98bf3e1"
    sha256 cellar: :any, arm64_linux: "bf67e10654e5efe0ec50591a613b549bca805745566cf7a4c14979c84b890b93"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "2.0.0+commit.6fd5535"
    version = "2.0.0"
    commit = "6fd5535"
    ldflags = "-X github.com/peterldowns/localias/cmd/localias/shared.Version=2.0.0 -X github.com/peterldowns/localias/cmd/localias/shared.Commit=6fd5535"
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
