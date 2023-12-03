package.path = package.path .. ";../?.lua"

local utils = require("libs.utils")

local inputData = "days/day2.input"

local maxColors = {
  red   = 12,
  green = 13,
  blue  = 14
}

return function()
  local result = 0
  
  for _, line in pairs(utils:linesFrom(inputData)) do
    local day, colors = line:match('Game (%d+): (.+)')
    local currentValues = { red = 0, green = 0, blue = 0}
    local power = 1
    
    for colorData in colors:gmatch('([^;]+)') do
      for count, color in colorData:gmatch('(%d+) ([^,]+)') do
        currentValues[color] = math.max(currentValues[color], tonumber(count))
      end
    end

    for _, count in pairs(currentValues) do
      power = power * count
    end

    result = result + power
  end

  print("Result: " .. result)
end
