local utils = {}

function utils:fileExists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function utils:linesFrom(file)
  if not utils:fileExists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

return utils
