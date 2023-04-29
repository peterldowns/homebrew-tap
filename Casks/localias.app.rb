cask "localias.app" do
  version "0.0.6"
  sha256 "110fa3f4c2953596cffaecd39f2c4d4ded5ba0830518a2df319df3cee5a6e1b7"
  url "https://github.com/peterldowns/localias/releases/download/0.0.6+commit.7c42128/Localias.app.zip"
  name "Localias.app"
  desc "Securely proxy local development servers"
  homepage "https://github.com/peterldowns/localias"

  auto_updates false
  depends_on macos: ">= :monterey"

  app "Localias.app"

  uninstall quit: "com.peterldowns.Localias"
end
