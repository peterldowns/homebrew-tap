class Localias < Formula
  desc "Manage local domain aliases for devservers"
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/0.0.7+commit.79e36f7.tar.gz"
  sha256 "8c8d6a7f310e5669fac44de1db0a9c00ab1cc2012431b9f57fd218283db5690c"
  license "MIT"
  version "0.0.7"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/localias/releases/download/0.0.7%2Bcommit.79e36f7"
    sha256 cellar: :any, arm64_monterey: "08929f20d0c99967c54c2c8767476ad3dbe409d011a120488e995f5402ccf78f"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "0.0.7+commit.79e36f7"
    version = "0.0.7"
    commit = "79e36f7"
    ldflags = "-X github.com/peterldowns/localias/cmd/localias/shared.Version=0.0.7 -X github.com/peterldowns/localias/cmd/localias/shared.Commit=79e36f7"
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
