#!/bin/bash

XDG_DATA_HOME="$HOME/.local/share"

if hash curl 2>/dev/null; then
  DOWNLOADER="curl"
  DOWNLOADER_OPTS="-fsSL"
elif hash wget 2>/dev/null; then
  DOWNLOADER="wget"
  DOWNLOADER_OPTS="-qO-"
else
  echo "please install curl or wget"
  exit 1
fi

case "$OSTYPE" in
  linux*) DENO_OS="unknown-linux-gnu" ;;
  darwin*) DENO_OS="apple-darwin" ;;
esac

DENO_ARCH=$(uname -m)
DENO_ZIP="deno-$DENO_ARCH-$DENO_OS.zip"

DENO_VERSION="$1"
if [[ "x$1" == "x" -or "x$1" == "xlatest" ]]; then
  DENO_VERSION=$( \
    "$DOWNLOADER" "$DOWNLOADER_OPTS" https://api.github.com/repos/denoland/deno/releases/latest \
    | grep '"tag_name"' \
    | perl -pe 's/"tag_name": "(.*)",/$1/' \
    | tr -d ' ' \
  )
fi

DENO_URL="https://github.com/denoland/deno/releases/download/${DENO_VERSION}/$DENO_ZIP"

"$DOWNLOADER" "$DOWNLOADER_OPTS" "$DENO_URL" > "/tmp/$DENO_ZIP"
mkdir -p "$XDG_DATA_HOME/denops-deno/$VERSION"
unzip -qo "/tmp/$DENO_ZIP" -d "$XDG_DATA_HOME/denops-deno/$DENO_VERSION" 

if [[ "x$1" == "x" ]]; then
  rm -f "$XDG_DATA_HOME/denops-deno/latest"
  ln -s "$XDG_DATA_HOME/denops-deno/$DENO_VERSION" "$XDG_DATA_HOME/denops-deno/latest"
fi
