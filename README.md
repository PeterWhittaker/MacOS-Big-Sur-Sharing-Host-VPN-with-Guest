# Fix sharing VPN from macOS Big Sur to guest VMs 

Inspired by and based on [Nikusha Kalatozi's MacOS Big Sur Sharing Host VPN with Guest](https://github.com/NikushaKalatozi/MacOS-Big-Sur-Sharing-Host-VPN-with-Guest) but rewritten as a single command using a single `awk` script (because I wanted to figure out how, is why :->).

1. Ensure your guest VM is configured to share its network connection with your Mac
1. Download fixnat.sh to your Mac **<- VERY IMPORTANT - must run on your Mac**
1. Connect your VPN on your Mac (and not in the guest VM)
1. On your Mac, run fixnat.sh, e.g., `sh fixnat.sh` or `chmod +x fixnat.sh; ./fixnat.sh`

This works with Tunnelblick. I have not confirmed where it works with other VPNs, including other OpenVPN-based VPNs.
