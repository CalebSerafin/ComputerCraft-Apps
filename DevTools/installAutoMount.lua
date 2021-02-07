local startupFile = 
"fs.makeDir("/src/")".."\n"..
"mounter.mount(\"/src/CCA\",\"C:/Users/User/Work Spaces/Visual Studio Code/Lua/ComputerCraft-Apps/\")".."\n"

if fs.exists("startup.lua") then
  local fsHandle = fs.open("startup.lua","w")
  fsHandle.write(startupFile)
  fsHandle.close()
end
