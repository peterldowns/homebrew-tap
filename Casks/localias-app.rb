cask "localias-app" do
  version "1.0.0"
  sha256 "a8c6985926cb72f1089b64d7f03413861619b6202ced53b860f63e85cbbfc61d"
  url "https://github.com/peterldowns/localias/releases/download/1.0.0+commit.736a4e1/Localias.app.zip"
  name "Localias.app"
  desc "Localias.app is a menu bar app for developers to securely manage local aliases for development servers."
  homepage "https://github.com/peterldowns/localias"

  auto_updates false
  depends_on macos: ">= :monterey"

  app "Localias.app"

  uninstall quit: "com.peterldowns.Localias"
end
