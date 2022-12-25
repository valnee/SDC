# SDC
Segment Display Controller for RetroGadgets


Use this to write text:
```lua
-- sdc.write(display, "number", start)
--[[
  Start is where start from, if you enter 4, it would write text from last char
  sdc.write(gdt.SegmentDisplay0, "2", 4) -- would print a 2 in the end
]]
sdc.write(gdt.SegmentDisplay0, "1.653", 1)
```

To clear just:
```lua
sdc.clear(gdt.SegmentDisplay0)
```
