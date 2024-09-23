#!/bin/bash

# set -euo pipefail

FORMULA_PATH="$1" # "Formula/localias.rb"
PROJECT_NAME="$2" # "localias"
BINARY_NAME="$3" # "localias"
if [ -z "$FORMULA_PATH" ] || [ -z "$PROJECT_NAME" ] || [ -z "$BINARY_NAME" ]; then
  echo "Usage: $0 Formula/localias.rb localias localias"
  echo "       $0 Formula/nix-search-cli.rb nix-search-cli nix-search"
  exit 1
fi

# Get the latest release URL
LATEST_URL=$(curl -sI "https://github.com/peterldowns/$PROJECT_NAME/releases/latest" | grep -i "location:" | awk '{print $2}' | tr -d '\r')
RELEASE=$(echo "$LATEST_URL" | cut -d'/' -f8)
VERSION=$(echo "$RELEASE" | cut -d'+' -f1)
# COMMIT=$(echo "$RELEASE" | cut -d'+' -f2 | cut -d'.' -f2)
echo "updating $FORMULA_PATH to $RELEASE"

# Download binaries and calculate SHA256
DARWIN_ARM64_SHA=""
DARWIN_AMD64_SHA=""
LINUX_ARM64_SHA=""
LINUX_AMD64_SHA=""

mkdir -p binaries
for arch in "darwin-arm64" "darwin-amd64" "linux-arm64" "linux-amd64"; do
  url="https://github.com/peterldowns/$PROJECT_NAME/releases/download/${RELEASE}/${BINARY_NAME}-${arch}"
  curl -sLo "binaries/${BINARY_NAME}-${arch}" "$url"
  sha=$(shasum -a 256 "binaries/${BINARY_NAME}-${arch}" | cut -d ' ' -f 1)
  # rm "binaries/${BINARY_NAME}-${arch}"
  echo "calculated sha256 of ${BINARY_NAME}-${arch} => $sha";
  
  case $arch in
    "darwin-arm64") DARWIN_ARM64_SHA="$sha" ;;
    "darwin-amd64") DARWIN_AMD64_SHA="$sha" ;;
    "linux-arm64") LINUX_ARM64_SHA="$sha" ;;
    "linux-amd64") LINUX_AMD64_SHA="$sha" ;;
  esac
done

# Update the formula file
sed -i.bak \
  -e "s/version \".*\"/version \"$VERSION\"/" \
  -e "s/url \".*${BINARY_NAME}-darwin-arm64\"/url \"https:\/\/github.com\/peterldowns\/${PROJECT_NAME}\/releases\/download\/${RELEASE}\/${BINARY_NAME}-darwin-arm64\"/" \
  -e "s/sha256 \".*\" # darwin-arm64/sha256 \"${DARWIN_ARM64_SHA}\" # darwin-arm64/" \
  -e "s/url \".*${BINARY_NAME}-darwin-amd64\"/url \"https:\/\/github.com\/peterldowns\/${PROJECT_NAME}\/releases\/download\/${RELEASE}\/${BINARY_NAME}-darwin-amd64\"/" \
  -e "s/sha256 \".*\" # darwin-amd64/sha256 \"${DARWIN_AMD64_SHA}\" # darwin-amd64/" \
  -e "s/url \".*${BINARY_NAME}-linux-arm64\"/url \"https:\/\/github.com\/peterldowns\/${PROJECT_NAME}\/releases\/download\/${RELEASE}\/${BINARY_NAME}-linux-arm64\"/" \
  -e "s/sha256 \".*\" # linux-arm64/sha256 \"${LINUX_ARM64_SHA}\" # linux-arm64/" \
  -e "s/url \".*${BINARY_NAME}-linux-amd64\"/url \"https:\/\/github.com\/peterldowns\/${PROJECT_NAME}\/releases\/download\/${RELEASE}\/${BINARY_NAME}-linux-amd64\"/" \
  -e "s/sha256 \".*\" # linux-amd64/sha256 \"${LINUX_AMD64_SHA}\" # linux-amd64/" \
  "$FORMULA_PATH"

echo "Updated ${FORMULA_PATH}"