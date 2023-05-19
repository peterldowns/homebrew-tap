class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/1.0.0+commit.736a4e1.tar.gz"
  sha256 "0752f6beec30d89860c4e165b2812091059ccfdc2db93e0c84b7d9efb6205ede"
  license "MIT"
  version "1.0.0"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/localias/archive/refs/tags/1.0.0+commit.736a4e1.tar.gz"
    sha256 cellar: :any, arm64_monterey: "2d1f85deda3b0fc856fea6b0c917c57b3a607e54449a7ddef4e6f921559ac344"
    sha256 cellar: :any, monterey: "5fdf5e93b035d77b683e0e5af78aaf5b2246921220c5938fec240a32ba1648e1"
    sha256 cellar: :any, x86_64_linux: "c509800b505175d7e4b5c24bc4221e3b131bd35f1a166e65f2e852033faeab78"
    sha256 cellar: :any, arm64_linux: "ff5703aeef677a808093f6a412ebdbbb45bd0cc0a5fed5771bc7bfc16a604842"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "1.0.0+commit.736a4e1"
    version = "1.0.0"
    commit = "736a4e1"
    ldflags = "-X github.com/peterldowns/localias/cmd/localias/shared.Version=1.0.0 -X github.com/peterldowns/localias/cmd/localias/shared.Commit=736a4e1"
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
