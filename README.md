# gateway_setup
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
git clone https://github.com/TheHellishPandaa/gateway_setup.git
````

Step 2: Make the Script Executable

Navigate to the directory containing the script and make it executable:

````bash
cd ubuntu-gateway-setup
chmod +x gateway_setup.sh
````
Step 3: Run the Script

Run the script as root (sudo):
```
``
sudo ./gateway_setup.sh
````

Released under GNU General Public license

2025 Jaime Galvez Martinez
