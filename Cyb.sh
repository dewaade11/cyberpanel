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
  
  # Jalankan perintah instalasi
  bash <(curl -s https://cyberpanel.net/install.sh || wget -qO - https://cyberpanel.net/install.sh) <<EOF
1   # Pilih CyberPanel OpenLiteSpeed
y   # Konfirmasi instalasi
n   # Tidak menginstal versi enterprise
y   # Instal PowerDNS
y   # Instal Postfix
y   # Instal Pure-FTPd
n   # Tidak menggunakan remote MySQL
r   # Generate password secara acak
y   # Instal Memcached
y   # Instal Redis
y   # Instal Watchdog
EOF

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
