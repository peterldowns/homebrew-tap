#!/usr/bin/env bash
#
# Update a Formula or Cask file based on a completed Github release.
#
# Update a Formula:
#
#   ./scripts/update-formula.sh peterldowns/localias Formula/localias.rb
#
# Update a Cask:
#
#   ./scripts/update-formula.sh peterldowns/localias Casks/localias.app.rb Localias.app.zip
#

set -ex
repo=$1 # peterldowns/localias
recipe=$2 # Formulas/localias.rb
artifact=$3 # (optional) Localias.app.zip

mkdir -p tmp
tag_name=$(curl -X GET -H Accept: application/json https://api.github.com/repos/${repo}/releases/latest | jq -r .tag_name)

if [ -z "$artifact" ]; then
  release_url="https://github.com/${repo}/archive/refs/tags/${tag_name}.tar.gz"
  wget "$release_url" -O "tmp/${tag_name}.tar.gz" -o /dev/null
  release_hash=$(shasum -a 256 tmp/"${tag_name}.tar.gz" | cut -d ' ' -f 1)
  sed -i '' 's,tag_name = ".*",tag_name = "'"$tag_name"'",g' $recipe
  sed -i '' 's,url ".*",url "'"$release_url"'",g' $recipe
  sed -i '' 's,sha256 ".*",sha256 "'"$release_hash"'",g' $recipe
else
  artifact_url="https://github.com/${repo}/releases/download/${tag_name}/${artifact}"
  wget "${artifact_url}" -O "tmp/${artifact}" -o /dev/null
  artifact_hash=$(shasum -a 256 "tmp/${artifact}" | cut -d ' ' -f 1)

  sed -i '' 's,tag_name = ".*",tag_name = "'"$tag_name"'",g' $recipe
  sed -i '' 's,url ".*",url "'"$artifact_url"'",g' $recipe
  sed -i '' 's,sha256 ".*",sha256 "'"$artifact_hash"'",g' $recipe
fi
