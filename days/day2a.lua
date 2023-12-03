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
    
    for colorData in colors:gmatch('([^;]+)') do
      for count, color in colorData:gmatch('(%d+) ([^,]+)') do
        currentValues[color] = math.max(currentValues[color], tonumber(count))
      end
    end

    local goodDay = true
    for color, max in pairs(maxColors) do
      goodDay = goodDay and currentValues[color] <= max
    end
    if goodDay then
      result = result + day
    end
  end

  print("Result: " .. result)
end
