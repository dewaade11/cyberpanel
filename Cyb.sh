#!/usr/bin/expect -f

# Fungsi untuk memastikan hanya user root yang dapat menjalankan skrip
if {[exec id -u] != 0} {
    puts "This script must be run as root. Exiting."
    exit 1
}

# Jalankan instalasi CyberPanel
spawn bash <(curl -s https://cyberpanel.net/install.sh || wget -qO - https://cyberpanel.net/install.sh)

expect "Please enter the right number"
send "1\r"

expect "Do you want to install full service"
send "Y\r"

expect "Do you want to install LiteSpeed Enterprise"
send "N\r"

expect "Do you want to set up PowerDNS"
send "Y\r"

expect "Do you want to set up Postfix"
send "Y\r"

expect "Do you want to set up Pure-FTPd"
send "Y\r"

expect "Would you like to use a remote database"
send "N\r"

expect "Please select WebAdmin password"
send "r\r"

expect "Would you like to enable Memcached"
send "Y\r"

expect "Would you like to enable Redis"
send "Y\r"

expect "Would you like to enable Watchdog"
send "Y\r"

# Tunggu proses instalasi selesai
interact
