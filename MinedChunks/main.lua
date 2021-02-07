local saveDataList = {
  spreadSheet = {path = "/ect/MinedChunks/spreadSheet.json", firstLine = "MinedChunks-spreadSheet-JSON-1.0"},
  config = {path = "/ect/MinedChunks/config.json", firstLine = "MinedChunks-config-JSON-1.0"}
}

local function feedBack(text)
  print(text)
end

local function loadJSON(saveData)
  local data = {};
  if fs.exists(saveData.path) then
    local fileHandle = fs.open(saveData.path,"r");
    if fileHandle.readLine() == saveData.firstLine then
      data = textutils.unserialiseJSON(fileHandle.readAll())
      fileHandle.close();
      feedBack("Found "..saveData.firstLine.."!")
    end
  end
  return data;
end

local function saveJSON(saveData,data)
  local fileHandle = fs.open(saveData.path,"w");
  fileHandle.writeLine(saveData.firstLine)
  fileHandle.writeLine(textutils.serialiseJSON(data))
  fileHandle.close();
  feedBack("Saved "..saveData.firstLine.."!")
end

local spreadSheet = loadJSON(saveDataList.spreadSheet)
local config = loadJSON(saveDataList.spreadSheet)
local _const_configDefualts = {
  useGPS = true
}

local function validateConfig()
  local valid = true
  for key, value in pairs(_const_configDefualts) do
    if type(config[key]) ~= type(value) then
      valid = false
      break
    end
  end
  return valid
end

local function readTypedInput(textType)
  write(textType..": ")
  local text = read()
  local invalid = type(text) ~= textType
  while invalid do
    print("Invalid type!")
    write(textType..": ")
    text = read()
    invalid = type(text) ~= textType
  end
  return text;
end

local function setupConfig()
  config = {};
  feedBack("Set values for config. Enter number or press enter for defualt")
  for key, value in pairs(_const_configDefualts) do
    feedBack("Set value for "..key)
    
    config[key] = readTypedInput(type(value));
  end

  saveJSON(saveDataList.config,config)
end

if not validateConfig() then
  setupConfig()
end


saveJSON(saveDataList.spreadSheet,spreadSheet)