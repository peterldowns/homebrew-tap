# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class NixSearchCli < Formula
  desc "search for nix packages via search.nixos.org"
  homepage "https://github.com/peterldowns/nix-search-cli"
  license "MIT"
  # update this by:
  # 1) set the url
  # 2) run brew fetch peterldowns/tap/nix-search-cli --build-from-source
  # 3) run brew edit peterldowns/tap/nix-search-cli and add the SHA printed in step 2
  url "https://github.com/peterldowns/nix-search-cli/archive/refs/tags/release-1677460599-0ee46b2.tar.gz"
  sha256 "5c5ed81f5aa5b995f8e45713dfab910ee422d6515ea1401d78daaad3fa8112cb"

  depends_on "go" => :build

  def install
    # -s -w is standard to make small binaries without debugging information or symbol tables
    # https://stackoverflow.com/a/22276273/829926
    # std_go_args definition is here
    # https://github.com/Homebrew/brew/blob/6db7732fa33ab808e405f8ac7673735edd2c8787/Library/Homebrew/formula.rb#L1565
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"nix-search"), "./cmd/nix-search"
  end

  test do
    system bin/"nix-search", "--help"
  end
end
