#!/bin/bash

# Fungsi untuk memeriksa apakah user adalah root
check_root() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please switch to root user."
    exit 1
  fi
}

# Fungsi untuk menjalankan instalasi CyberPanel
install_cyberpanel() {
  echo "Starting CyberPanel installation..."

  # Memberikan input otomatis melalui pipeline
  {
    echo "1"   # Pilih CyberPanel
    echo "1"   # Pilih CyberPanel OpenLiteSpeed
    echo "Y"   # Konfirmasi instalasi
    echo "Y"   # Tidak menggunakan remote MySQL
    echo "2.3.4"   # Tidak menggunakan remote MySQL
    echo "r"   # Generate password secara acak
    echo "Y"   # Instal Memcached
    echo "Y"   # Instal Redis
    echo "Y"   # Instal Watchdog
  } | bash <(curl -s https://cyberpanel.net/install.sh || wget -qO - https://cyberpanel.net/install.sh)

  echo "CyberPanel installation has been completed."
}

# Fungsi untuk menampilkan informasi penting setelah instalasi
finalize_installation() {
  echo "Installation finished. Please copy the configuration details displayed on the screen to a safe place."
}

# Main script
check_root
install_cyberpanel
finalize_installation
