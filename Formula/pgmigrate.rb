class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  url "https://github.com/peterldowns/pgmigrate/archive/refs/tags/v0.0.6+commit.b4febf4.tar.gz"
  sha256 "a86337989aeb480efdd335219e7d9876408725bedf94b058ea6dedf46410ce1e"
  license "MIT"
  version "v0.0.6"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/pgmigrate/releases/download/v0.0.6+commit.b4febf4"
    sha256 cellar: :any, arm64_monterey: "fa14ed0c502e1c82d702e1c94af98ce240722c002c3006bb3b07df064c277e20"
    sha256 cellar: :any, monterey: "8c9ce3d3c54f46a9bf782ad352fd077302ed82e9a19a4917e20120df073efcc0"
    sha256 cellar: :any, x86_64_linux: "bafebd06639373d9c006795a643d2118dd90a54bd0668fa115b5ad6a6e2170ef"
    sha256 cellar: :any, arm64_linux: "8442cabf752e2f41301bb93828e9aa26e01f2d025530577a65102595f636cee2"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "v0.0.6+commit.b4febf4"
    version = "v0.0.6"
    commit = "b4febf4"
    ldflags = "-X github.com/peterldowns/pgmigrate/cli/shared.Version=v0.0.6 -X github.com/peterldowns/pgmigrate/cli/shared.Commit=b4febf4"
    # -s -w is standard to make small binaries without debugging information or symbol tables
    # https://stackoverflow.com/a/22276273/829926
    # std_go_args definition is here
    # https://github.com/Homebrew/brew/blob/6db7732fa33ab808e405f8ac7673735edd2c8787/Library/Homebrew/formula.rb#L1565
    system "go", "build", *std_go_args(ldflags: "-s -w " + ldflags, output: bin/"pgmigrate"), "./cli"
  end

  test do
    system bin/"pgmigrate", "--help"
  end
end

