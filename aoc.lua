local utils = require("libs.utils")

local function help()
  print("Usage: lua aoc.lua [day]")
  os.exit()
end

local function loadDay(day)
  if utils:fileExists("./days/day" .. day .. ".lua") then
    local run = require("days.day" .. day)
    run()
  else
    print("day " .. day .. " not exists")
  end
end

if arg[1] == nil then
  help()
else
  loadDay(arg[1])
end
