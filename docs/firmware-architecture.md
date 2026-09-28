# Firmware Architecture

## Master Node (nRF52840)

### Threads

1. Main thread: state machine, event processing
2. USB thread: command parsing from console
3. BLE advertisement thread: broadcasts every 50ms
4. Backhaul thread: sends state to satellites

### State Structure

State = {rgb (3 bytes), effect (1 byte), intensity (1 byte), pattern (1 byte), zone (1 byte), logo (1 byte), torch (1 byte), video (1 byte), sequence (2 bytes), clock (3 bytes)}

State is atomic. Only main thread writes. Other threads read snapshot.

### USB Command Format

Commands from console over USB CDC:

#C:R,G,B          - Set color (e.g., #C:255,0,0 for red)
#E:effect_id      - Set effect (e.g., #E:2 for fade)
#Z:zone           - Set zone (e.g., #Z:0 for all)
#V:intensity      - Set intensity (e.g., #V:255)

Example: #C:255,0,0 (red) on all zones

### UART Debug Output

Every state change logged:

[12345] STATE: rgb=FF0000 effect=02 zone=00 seq=0001 clock=00A4F2

Timestamps in milliseconds since boot.

### Build Command

(Once SDK is installed)

west build -b nrf52840dk_nrf52840 firmware/master

## Satellite Node (nRF52840)

Same structure as master, but:
- No USB thread
- Backhaul thread listens (does not send)
- BLE thread re-broadcasts received state
- Hop count incremented before broadcast