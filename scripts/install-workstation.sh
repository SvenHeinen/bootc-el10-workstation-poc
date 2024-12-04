#!/bin/bash -x

# Why this is needed: https://github.com/CentOS/centos-bootc/issues/191
mkdir -p /var/roothome

# Install workstation package group
dnf group install workstation-product-environment -y

# Install additional packages
dnf group install development -y
dnf install -y \
	ansible-core \
	golang \
	rust \
	cargo

# Remove dnf cache after install
dnf clean all

# Install flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install firefox flatpak
flatpak install org.mozilla.firefox --noninteractive --assumeyes
