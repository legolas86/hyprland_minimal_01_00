#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf5 -y copr enable solopasha/hyprland
dnf5 group install -y --nobest base-graphical container-management core fonts hardware-support multimedia networkmanager-submodules printing development-tools c-development
dnf5 -y install tmux code bootc podmansh tcpdump podman-machine podman-compose podman-tui virt-v2v tiptop qemu-kvm libvirt virt-install virt-manager toolbox distrobox flatpak tmux rust cargo rustup golang helix bat zoxide fzf tldr btop ripgrep rust rustup cargo fish hyprshot hyprpaper hyprsunset hyprland mako kitty fuzzel hyprpolkitagent NetworkManager-tui pipewire cava alsa-tools qt6ct
dnf5 -y copr disable solopasha/hyprland
dnf5 clean all
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
