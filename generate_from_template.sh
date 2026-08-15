#!/usr/bin/env bash

set -euo pipefail

#SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")")"
SCRIPT_PATH=$( realpath "$0"  )
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

export OS_VERSION="44"
export ANDROID_UDEV_RELEASE="20260423"

rm -rf generated
for in_name in $(find "$SCRIPT_DIR/template" -type f -name "*"); do

    out_name="${in_name//template\//generated\/}"
    echo $out_name
    mkdir -p "$(dirname "${out_name}")"
    envsubst '$OS_VERSION $ANDROID_UDEV_RELEASE' < "$in_name" > "$out_name"
done

