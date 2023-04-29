class Localias < Formula
  desc "Manage local domain aliases for devservers"
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/0.0.6+commit.58395d1.tar.gz"
  sha256 "fde4fcd6b67a0008493b1c2842f818b3d934905e4785e320f6e03fadad06686e"
  license "MIT"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/localias/releases/download/0.0.6+commit.58395d1/"
    sha256 arm64_montery: "ef002aa52d8cb0ed88432e194070bd5377c144998939234151d5ee039fcf30e1"
    sha256 montery:       "fcb507b1f47eb867956a2a68c3c6f8c454a3cae880a1cd6893004c7df200dfde"
    sha256 arm64_linux:   "a2897538201f5d0767638f4a7b9ea15b328532d5cee0b18f026c869075203fa4"
    sha256 linux:         "26d86bcf9f1a5a75a225664f47ace401d76907ed0be379f363e7c9f621bd80e5"
  end

  def install
    # Parse the version and commit from the tagref URL because the downloaded
    # .tar.gz isn't a git repository.
    tag_name = "0.0.6+commit.58395d1"
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
