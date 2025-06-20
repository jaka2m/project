#!/usr/bin/env bash
set -e

unzip_tools_list=('unzip' '7z' 'busybox')

usage() { echo "Usage: curl https://rclone.org/install.sh | sudo bash [-s beta]" 1>&2; exit 1; }

if [ -n "$1" ] && [ "$1" != "beta" ]; then
  usage
fi

if [ -n "$1" ]; then
  install_beta="beta "
fi

tmp_dir=$(mktemp -d 2>/dev/null || mktemp -d -t 'rclone-install.XXXXXXXXXX')
cd "$tmp_dir"

set +e
for tool in "${unzip_tools_list[@]}"; do
  hash "$tool" 2>>errors
  if [ "$?" -eq 0 ]; then
    unzip_tool="$tool"
    break
  fi
done
set -e

if [ -z "$unzip_tool" ]; then
  printf "\nNone of the supported tools for extracting zip archives (${unzip_tools_list[*]}) were found. "
  printf "Please install one of them and try again.\n\n"
  exit 4
fi

export XDG_CONFIG_HOME=config

version=$(rclone --version 2>>errors | head -n 1)
if [ -z "$install_beta" ]; then
  current_version=$(curl -fsS https://downloads.rclone.org/version.txt)
else
  current_version=$(curl -fsS https://beta.rclone.org/version.txt)
fi

if [ "$version" = "$current_version" ]; then
  printf "\nThe latest ${install_beta}version of rclone ${version} is already installed.\n\n"
  exit 3
fi

OS="$(uname)"
case $OS in
  Linux)
    OS='linux'
    ;;
  FreeBSD)
    OS='freebsd'
    ;;
  NetBSD)
    OS='netbsd'
    ;;
  OpenBSD)
    OS='openbsd'
    ;;
  Darwin)
    OS='osx'
    ;;
  SunOS)
    OS='solaris'
    echo 'OS not supported'
    exit 2
    ;;
  *)
    echo 'OS not supported'
    exit 2
    ;;
esac

OS_type="$(uname -m)"
case "$OS_type" in
  x86_64|amd64)
    OS_type='amd64'
    ;;
  i?86|x86)
    OS_type='386'
    ;;
  aarch64|arm64)
    OS_type='arm64'
    ;;
  arm*)
    OS_type='arm'
    ;;
  *)
    echo 'OS type not supported'
    exit 2
    ;;
esac

if [ -z "$install_beta" ]; then
  download_link="https://downloads.rclone.org/rclone-current-${OS}-${OS_type}.zip"
  rclone_zip="rclone-current-${OS}-${OS_type}.zip"
else
  download_link="https://beta.rclone.org/rclone-beta-latest-${OS}-${OS_type}.zip"
  rclone_zip="rclone-beta-latest-${OS}-${OS_type}.zip"
fi

curl -OfsS "$download_link"
unzip_dir="tmp_unzip_dir_for_rclone"
case "$unzip_tool" in
  'unzip')
    unzip -a "$rclone_zip" -d "$unzip_dir"
    ;;
  '7z')
    7z x "$rclone_zip" "-o$unzip_dir"
    ;;
  'busybox')
    mkdir -p "$unzip_dir"
    busybox unzip "$rclone_zip" -d "$unzip_dir"
    ;;
esac

cd "$unzip_dir"/*

case "$OS" in
  'linux')
    cp rclone /usr/bin/rclone.new
    chmod 755 /usr/bin/rclone.new
    chown root:root /usr/bin/rclone.new
    mv /usr/bin/rclone.new /usr/bin/rclone
    if ! [ -x "$(command -v mandb)" ]; then
      echo 'mandb not found. The rclone man docs will not be installed.'
    else
      mkdir -p /usr/local/share/man/man1
      cp rclone.1 /usr/local/share/man/man1/
      mandb
    fi
    ;;
  'freebsd'|'openbsd'|'netbsd')
    cp rclone /usr/bin/rclone.new
    chown root:wheel /usr/bin/rclone.new
    mv /usr/bin/rclone.new /usr/bin/rclone
    mkdir -p /usr/local/man/man1
    cp rclone.1 /usr/local/man/man1/
    makewhatis
    ;;
  'osx')
    mkdir -p /usr/local/bin
    cp rclone /usr/local/bin/rclone.new
    mv /usr/local/bin/rclone.new /usr/local/bin/rclone
    mkdir -p /usr/local/share/man/man1
    cp rclone.1 /usr/local/share/man/man1/
    ;;
  *)
    echo 'OS not supported'
    exit 2
    ;;
esac

version=$(rclone --version 2>>errors | head -n 1)

printf "\n${version} has successfully installed."
printf '\nNow run "rclone config" for setup. Check https://rclone.org/docs/ for more details.\n\n'
exit 0
