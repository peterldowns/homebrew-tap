class Localias < Formula
  desc "Localias is a tool for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"
  url "https://github.com/peterldowns/localias/archive/refs/tags/2.0.2+commit.56d660e.tar.gz"
  sha256 "97341409b46f3988054246fa141aaf907d29fe17c3dd2dc980a706bedec1e532"
  license "MIT"
  version "2.0.2"

  depends_on "go" => :build

  bottle do
    root_url "https://github.com/peterldowns/localias/releases/download/2.0.2+commit.56d660e"
    sha256 cellar: :any, arm64_monterey: "1d29e7cf03b194a986ccd0d429e7870871d51bc9002c70d13d346bba79250081"
    sha256 cellar: :any, monterey: "f620c193db0beee7220559143c58222e18d3283b30a95f24abcd0c7fa0e501db"
    sha256 cellar: :any, x86_64_linux: "e477630875fdec23173063cb4c5dc9b964569f6fcac8914c19d7875bbcc384d4"
    sha256 cellar: :any, arm64_linux: "ed709a0c74c7e3d243a760808d70228b313975af5384612bfe3b50db811d0896"
  end
end
