-- LogMy.lua
local function run_func()
  local i = 0
  setTelemetryValue(0x5121 + i, 0, 0x7F, getValue("gvar8"), 0, 0, "FlCN")
  i = i + 1
  setTelemetryValue(0x5121 + i, 0, 0x7F, getValue("ls10"), 0, 0, "Stky")
  i = i + 1
  setTelemetryValue(0x5121 + i, 0, 0x7F, getValue("ls7"), 0, 0, "LV&H")
  i = i + 1
  setTelemetryValue(0x5121 + i, 0, 0x7F, getValue("ls8"), 0, 0, "Edge")
  i = i + 1
  setTelemetryValue(0x5121 + i, 0, 0x7F, getValue("ls5"), 0, 0, "Tele")
end
return {run=run_func}
