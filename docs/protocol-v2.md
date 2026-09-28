# Protocol v2 Specification

## BLE Advertising Payload (20 bytes total)

Advertisement broadcast from master and relayed by each satellite every 50 ms.

Payload structure:

Byte  Field                 Type    Range       Notes
---   ---                   ---     ---         ----
0     Frame type            u8      0x42        Fixed, identifies as PixaPulse
1-2   Company ID            u16     0x059C      Bluetooth SIG assigned ID
3-4   Sequence number       u16     0-6535      Incremented by master; satellites copy
5-7   Show clock (ms)       u24     0-16M       Master's millisecond counter
8     Zone ID               u8      0-15        0 = all zones; 1-15 = zones A-O
9-11  RGB                   3x u8   0-255       Red, Green, Blue
12    Effect ID             u8      0-18        Effect selection
13    Haptic intensity      u8      0-255       0 = off; 255 = maximum
14    Haptic pattern        u8      0-2         0 = off, 1 = pulse, 2 = double
15    Logo slot             u8      0-4         0 = off; 1-5 = logo graphics
16    Torch mode + speed    u8      0-3         Mode and speed
17    Video clip            u8      0-1         0 = off, 1-2 = video IDs
18    Hop count             u8      0-15        Incremented by each relay
19    HMAC tag [0:3]        u8      varies      First 4 bytes of HMAC

Total: 20 bytes. Fits in legacy BLE advertisement.

## Authentication

Master and app share a 32-byte secret key. Before broadcasting, master computes:

HMAC = HMAC-SHA256(key, bytes 0:19)

App verifies HMAC on receive. If tag does not match, packet is dropped.

## Shared Clock

Master runs internal millisecond counter (NTP-synced if networked, or GPS-disciplined outdoors).
Every outgoing packet includes this counter in bytes 5-7.
Phones receive clock, add 50ms, and schedule effect transitions at that future clock tick.
This ensures all phones transition colours/effects simultaneously.