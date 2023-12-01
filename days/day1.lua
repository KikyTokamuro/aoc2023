package.path = package.path .. ";../?.lua"

local utils = require("libs.utils")

local inputData = "days/day1.input"
local digits = {
  'one', 'two', 'three', 
  'four', 'five', 'six', 
  'seven', 'eight', 'nine'
}

local function compare(first, second)
  local n = math.min(#first, #second)
  
  for i = 1, n do
    if first[i] < second[i] then
      return true
    elseif first[i] > second[i] then
      return false
    end
  end
  
  return #first < #second
end

return function()
  local result = 0

  for _, line in pairs(utils:linesFrom(inputData)) do
    local pair = {}

    for i = 1, #line do
      local val = tonumber(line:sub(i, i))
      if val then
        table.insert(pair, {i, val})
      end
    end

    for v, n in pairs(digits) do
      for i = 1, #line do
        if line:sub(i, i + #n - 1) == n then
          table.insert(pair, {i, v})
        end
      end
    end
    
    table.sort(pair, compare)
    result = result + pair[1][2] * 10 + pair[#pair][2]
  end

  print("Result: " .. result)
end
