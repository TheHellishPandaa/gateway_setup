# gategay_server_on_ubuntu
 Script for setting up a basic gateway on an Ubuntu system. It configures the system to route traffic from a local network (LAN) to the internet through a WAN interface using Network Address Translation (NAT). 
 
## Prerequisites

Before running this script, make sure you meet the following requirements:

- Ubuntu (or similar Linux distribution)
- Root (sudo) access on the machine
- Two network interfaces: one for WAN (internet connection) and one for LAN (local network)

---

## Installation

To install and use this script, follow these steps:

### Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/TheHellishPandaa/ubuntu-gateway-setup.git

Step 2: Make the Script Executable

Navigate to the directory containing the script and make it executable:


cd ubuntu-gateway-setup
chmod +x gateway_setup.sh

Step 3: Run the Script

Run the script as root (sudo):


sudo ./gateway_setup.sh


Script Configuration

By default, the script assumes the following interface names:

    WAN Interface: ens18 (Change this if your WAN interface is different)
    LAN Interface: ens19 (Change this if your LAN interface is different)

You can modify these variables directly in the script or update them to match your specific network configuration.


