#!/usr/bin/env bash

set -oue pipefail

OS_VERSION=$1

sed -i "s|image-version: .*|image-version: $OS_VERSION|" ./recipes/recipe.yml
sed -i "s|ghcr.io/ublue-os/akmods-nvidia-open:main-[^ ]* /rpms/|ghcr.io/ublue-os/akmods-nvidia-open:main-$OS_VERSION /rpms/|" ./recipes/common/nvidia-open-modules.yml
sed -i "s|ghcr.io/ublue-os/akmods:main-[^ ]* |ghcr.io/ublue-os/akmods:main-$OS_VERSION |" ./recipes/common/common-modules.yml
sed -i "s|https://copr.fedorainfracloud.org/coprs/ublue-os/packages/repo/fedora-[^/]*/ublue-os|https://copr.fedorainfracloud.org/coprs/ublue-os/packages/repo/fedora-$OS_VERSION/ublue-os|" ./recipes/common/common-modules.yml
sed -i "s|repo/fedora-$OS_VERSION/ublue-os-packages-fedora-[^.]*.repo|repo/fedora-$OS_VERSION/ublue-os-packages-fedora-$OS_VERSION.repo|" ./recipes/common/common-modules.yml
