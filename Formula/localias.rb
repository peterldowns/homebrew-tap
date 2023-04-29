class Localias < Formula
  desc "Manage local domain aliases for devservers"
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/0.0.6+commit.7c42128.tar.gz"
  sha256 "d32e94d05eec3db308e2d658b76d0a6f8d31511a90298db036752d3e2bc577a4"
  license "MIT"

  depends_on "go" => :build

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "0.0.6+commit.7c42128"
    version = tag_name.split("+")[0]
    commit = tag_name.split(".").last

    ldflags = `./scripts/golang-ldflags.sh #{version} #{commit}`
    puts ldflags
    # 0.0.6+commit.037f617.tar.gz
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
