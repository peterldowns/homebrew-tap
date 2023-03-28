class NixSearchCli < Formula
  desc "Search for nix packages via search.nixos.org"
  homepage "https://github.com/peterldowns/nix-search-cli"
  url "https://github.com/peterldowns/nix-search-cli/archive/refs/tags/release-1680019370-866017b.tar.gz"
  sha256 "6cadc554fbc08c45902564f919d01485fd3a6ac8aabd11c74525263c01bb6981"
  license "MIT"

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
