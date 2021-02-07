-- Use the following from shell to get&run this script:
--> pastebin get Ma8jch0e MCI
--> MCI
local args = { ... }
local devTools = (string.lower(args[1] or "false")) == "true"

local tmpDir = "/tmp-CalebSerafin-ComputerCraft-Apps-MinedChunks"
local appsDir = "/apps"

if not fs.exists(appsDir.."/gitget.lua") then
  shell.run("pastebin","get","W5ZkVYSi",appsDir.."/gitget.lua")
end
shell.run(appsDir.."/gitget.lua","CalebSerafin","ComputerCraft-Apps","main",tmpDir)

print("Installing MinedChunks...")
fs.move(tmpDir.."/MinedChunks",appsDir.."/MinedChunks")
if devTools then
  print("Installing DevTools...")
  fs.move(tmpDir.."/DevTools",appsDir.."/DevTools")
end

print("Deleting "..tmpDir.."...")
fs.delete(tmpDir)
