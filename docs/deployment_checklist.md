# Deployment Checklist

## Golden‑Image Creation (once)

- [ ] Download latest **Raspberry Pi OS 64‑bit Lite** image.
- [ ] Flash image to **PM9A1a 512 GB NVMe** using `rpi-imager`.
- [ ] Slot SSD in **Argon NEO 5** case, connect fan header.
- [ ] Boot Pi with keyboard/HDMI and run:

      sudo apt-get update && sudo apt-get upgrade-all y
      sudo apt install -y curl python3 python3-pyqt5 python3-pip
      curl https://download.argon40.com/argonneo5.sh | bash -x
      wget https://download.argon40.com/scripts/argonneo5_latest.deb -O /tmp/argonneo5.deb
      sudo ./scripts/create_golden_image.sh

The curl command updates 
- NVMe / PCIe parameters
- USB max current
- EEPROM firmware

- [ ] Shutdown, label drive **generic_pi**.

## Imaging Remaining Pis

- [ ] Clone the golden image to remaining SSDs (`usb‑imager`, `dd`, or `rpi‑cloner`).
- [ ] Insert SSD into host Pi, power on.
- [ ] On first boot respond to `role_specific_provisioning.sh` prompt:

      * `rookery` for coordinator
      * `raven<N>` (1‑8) for field unit

## Field‑Unit Pre‑flight

- [ ] Verify **AWUS036ACM** present (`lsusb`).
- [ ] Confirm Tailscale shows node tagged `field,raven<N>`.
- [ ] `ntfy` test: publish to topic `raven<N>` → confirm receipt.
- [ ] Run hardware self‑test:

      ```bash
      ./scripts/pi_watchdog.sh --selftest
      ```

## Shipping / On‑site
### Shipping
- [ ] Complete `docs/physical_walkthrough_checklist.md`.
- [ ] Photograph install location and cable routing.
- [ ] Email exec summary to intermediary.

### On-site Setup/Testing
#### Power and Peripherals
- [] Smart plug to wall
- [] Raspberry Pi power supply to smart plug
- [] Raspberry Pi connected to power supply 
- [] Alfa card connected via USB 3

#### Testing
- [] wlan1 can scan
    sudo ip link set wlan1 down
    sudo iw dev wlan1 set type managed
    sudo ip link set wlan1 up
    sudo iwlist wlan1 scan | grep ESSID