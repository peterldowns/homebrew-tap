#!/usr/bin/env bash
set -ex
repo=$1 # peterldowns/nix-search-cli
recipe=$2 # Formulas/nix-search-cli.rb

tag_name=$(curl -X GET -H Accept: application/json https://api.github.com/repos/${repo}/releases/latest | jq -r .tag_name)
release_url="https://github.com/${repo}/archive/refs/tags/${tag_name}.tar.gz"
wget "$release_url" -o /dev/null
release_hash=$(shasum -a 256 "${tag_name}.tar.gz" | cut -d ' ' -f 1)
sed -i '' 's,url ".*",url "'"$release_url"'",g' $recipe
sed -i '' 's,sha256 ".*",sha256 "'"$release_hash"'",g' $recipe
