# Turn USB lamp on/off automatically when the webcam is used

## Context

A USB lamp is plugged into port 4 of the internal VIA Labs USB2.0 hub (`1-1`,
vendor:product `2109:2817`) on this machine. The lamp has no data lines — it
never enumerates as a USB device, so it can't be controlled directly. It draws
power straight from the hub port, and the hub supports independent per-port
power switching (`uhubctl` reports the `ppps` flag), so the lamp can be
switched by cutting/restoring power to that specific port.

The webcam is a UVC device exposing `/dev/video0` and `/dev/video1`.

## Goal

Whenever any application opens the webcam, turn the lamp on. When the webcam
is no longer in use by anything, turn the lamp off (after a short debounce so
it doesn't flicker if an app briefly closes/reopens the device).

## How it's implemented

- `devices/lamp-camera.yml` — Ansible playbook (Omarchy only) that:
  - installs `inotify-tools` (pacman)
  - installs `uhubctl` from the AUR via `yay` (not in official repos)
  - renders `files/lamp-camera-watch.sh.j2` to `/usr/local/bin/lamp-camera-watch.sh`
    (hub/port are Jinja2 vars set at the top of the playbook — currently `1-1`
    / `4`, adjust if the lamp ends up on a different port/hub on the new machine)
  - copies `files/lamp-camera-watch.service` to
    `/etc/systemd/system/lamp-camera-watch.service`
  - enables and starts the `lamp-camera-watch` systemd service (runs as root,
    since `uhubctl` needs root to toggle port power)
- The script watches `/dev/video0` and `/dev/video1` with `inotifywait -m -e
  open -e close`. On open it checks `fuser` on those devices and turns the
  lamp on; on close it waits 2s then re-checks `fuser` and turns the lamp off
  only if nothing still has the devices open.
- Wired into `Makefile`'s `install_environment` target, inside the
  `if [ "$(OS)" = "omarchy" ]` block, alongside `devices/monitor.yml` and
  `devices/keyboard.yml`.

## To restore on a fresh install

Nothing extra needed beyond the normal `./main.sh omarchy` bootstrap — this
playbook runs automatically as part of `make install_environment` on Omarchy.

If the lamp ends up on a different hub/port on the new machine:
1. Find the lamp's hub/port the hard way (it won't show up in `lsusb`/`/sys/bus/usb/devices` since it has no data lines): run `sudo uhubctl` to list hubs with the `ppps` flag (per-port power switching support), then toggle ports one at a time with `sudo uhubctl -l <hub> -p <port> -a off` until the lamp goes dark.
2. Update `hub`/`port` vars at the top of `devices/lamp-camera.yml`.
