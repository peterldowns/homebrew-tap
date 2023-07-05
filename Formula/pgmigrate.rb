class Pgmigrate < Formula
  desc "Pgmigrate is a modern Postgres migrations CLI and library for golang."
  homepage "https://github.com/peterldowns/pgmigrate"
  url "https://github.com/peterldowns/pgmigrate/archive/refs/tags/v0.0.5+commit.4996b41.tar.gz"
  sha256 "5e892e95d7408ce63079a9aa7db48b7065cfefdffe6e8949986d481cc90e2626"
  license "MIT"
  version "v0.0.5"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/pgmigrate/releases/download/v0.0.5+commit.4996b41"
    sha256 cellar: :any, arm64_monterey: "0105031e9cecc5d6d2d54ea733727106365b597b41f441b1a165158b8b10298b"
    sha256 cellar: :any, monterey: "89b30517ce0d9007e236a522b21a7005246e584275e09b61f2b8e27361724594"
    sha256 cellar: :any, x86_64_linux: "9a9e1fd98be13825bb7bbac2318d416cda3f8b723a533cab894680fad03abc33"
    sha256 cellar: :any, arm64_linux: "2fba69da4364caaacc043ac7d2e1d02324144636e52e880bddfbeeb6ec5a3ca1"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "v0.0.5+commit.4996b41"
    version = "v0.0.5"
    commit = "4996b41"
    ldflags = "-X github.com/peterldowns/pgmigrate/cli/shared.Version=v0.0.5 -X github.com/peterldowns/pgmigrate/cli/shared.Commit=4996b41"
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

