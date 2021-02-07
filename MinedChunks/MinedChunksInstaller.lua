-- Utilises http://www.computercraft.info/forums2/index.php?/topic/17387-gitget-version-2-release/
-- Use the following from shell to get&run this script:
--> pastebin run Ma8jch0e
local args = { ... }
local devTools = (string.lower(args[1] or "false")) == "true"

local tmpDir = "/tmp-CalebSerafin-ComputerCraft-Apps-MinedChunks"
local appsDir = "/apps"

local function install(name) --Start with "/folderName"
  if fs.isDir(tmpDir.."/DevTools") then
    print("Installing "..name.."...")
    if fs.isDir(appsDir..name) then
      fs.delete(appsDir..name)
    end
    fs.copy(tmpDir..name,appsDir..name)
  else
    print("Cannot install "..tmpDir..name..", is not found!")
  end
end


if not fs.exists(appsDir.."/gitget.lua") then
  shell.run("pastebin","get","W5ZkVYSi",appsDir.."/gitget.lua")
end
shell.run(appsDir.."/gitget.lua","CalebSerafin","ComputerCraft-Apps","main",tmpDir)

install ("/MinedChunks")
if devTools and fs.isDir(tmpDir.."/DevTools") then
  install ("/DevTools")
end

print("Deleting "..tmpDir.."...")
fs.delete(tmpDir)
print("Deleting self ("..shell.getRunningProgram..")...")
fs.delete(shell.getRunningProgram)
print("Done!")
