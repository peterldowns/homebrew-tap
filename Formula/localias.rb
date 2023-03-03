# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Localias < Formula
  desc "search for nix packages via search.nixos.org"
  homepage "https://github.com/peterldowns/localias"
  license "MIT"
  # update this by:
  # 1) set the url
  # 2) run brew fetch peterldowns/tap/localias --build-from-source
  # 3) run brew edit peterldowns/tap/localias and add the SHA printed in step 2
  url "https://github.com/peterldowns/localias/archive/refs/tags/release-1677875318-623d886.tar.gz"
  sha256 "f2c6200b6085a78fe9fa1320b9335f296fb1e50b9b41e107e7035f568ee3cd56"

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
