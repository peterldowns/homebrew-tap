# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Localias < Formula
  desc "search for nix packages via search.nixos.org"
  homepage "https://github.com/peterldowns/localias"
  license "MIT"

  url "https://github.com/peterldowns/localias/archive/refs/tags/release-1677875419-b50c9a4.tar.gz"
  sha256 "86fa9202281a603d81536b05b75c259aa8f0928ea3d6ed73e015c75fc1ade9e7"

  depends_on "go" => :build

  def install
    # -s -w is standard to make small binaries without debugging information or symbol tables
    # https://stackoverflow.com/a/22276273/829926
    # std_go_args definition is here
    # https://github.com/Homebrew/brew/blob/6db7732fa33ab808e405f8ac7673735edd2c8787/Library/Homebrew/formula.rb#L1565
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"localias"), "."
  end

  test do
    system bin/"localias", "--help"
  end
end