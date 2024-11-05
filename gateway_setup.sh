#!/bin/bash

clear

echo "------------------------------------------------"
echo "----------- MAKE GATEWAY ON UBUNTU -------------"
echo "------------------------------------------------"
echo "                                               "

#show network interfaces in the system
echo "Available network interfaces"
echo "----------------------------------------------------"
ip a | grep -E "^[0-9]+: ens" | awk '{print $2}'

echo "-----------------------------------------------------"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root. Exit"
  exit 1
fi

# Network Interface Variables
WAN_INTERFACE="ens18"  # Change this to your WAN interface
LAN_INTERFACE="ens19"  # Change this to your LAN interface

# Check if the interfaces exist
if ! ip a show $WAN_INTERFACE &>/dev/null; then
  echo "Error: WAN interface ($WAN_INTERFACE) does not exist."
  exit 1
fi

if ! ip a show $LAN_INTERFACE &>/dev/null; then
  echo "Error: LAN interface ($LAN_INTERFACE) does not exist."
  exit 1
fi

# Update system
echo "Updating the system..."
apt update && apt upgrade -y

# Install iptables if not installed
echo "Installing iptables..."
apt install -y iptables iptables-persistent

# Enable IP forwarding
echo "Enabling IP forwarding..."
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Flush existing iptables rules (optional)
echo "Flushing existing iptables rules..."
iptables -F
iptables -t nat -F

# Configure iptables for NAT
echo "Configuring NAT in iptables..."
iptables -t nat -A POSTROUTING -o $WAN_INTERFACE -j MASQUERADE
iptables -A FORWARD -i $WAN_INTERFACE -o $LAN_INTERFACE -j ACCEPT
iptables -A FORWARD -i $LAN_INTERFACE -o $WAN_INTERFACE -m state --state RELATED,ESTABLISHED -j ACCEPT

# Save iptables rules
echo "Saving iptables rules..."
netfilter-persistent save

# Restart iptables service
echo "Restarting the iptables service..."
systemctl restart netfilter-persistent

# Enable iptables-persistent to start on boot
echo "Enabling iptables-persistent at boot..."
systemctl enable netfilter-persistent

echo "Router successfully configured on $WAN_INTERFACE and $LAN_INTERFACE."
