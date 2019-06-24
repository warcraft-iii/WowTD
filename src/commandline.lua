---@class CommandLine
local CommandLine = require('lib.commandline')

local flyWave = {['7'] = true, ['17'] = true, ['23'] = true, ['27'] = true, ['35'] = true}
local function isFlyWave(lvl)
    return not not flyWave[lvl]
end

local function getWaveInfo(lvl)
    if isFlyWave(lvl) then
        return 'flying enemies'
    elseif math.modf(lvl, 5) == 0 then
        return 'immune enemies'
    end
    return 'normal enemies'
end

CommandLine:addOptionAnyPlayer("-next", function(p, data)
    print(string.format("The current wave is %s %s.", udg_NumberToSpawn[udg_LVL], getWaveInfo(udg_LVL)))
    print(string.format("The wave after this is %s %s.", udg_NumberToSpawn[udg_LVL + 1], getWaveInfo(udg_LVL + 1)))
    print(string.format("The wave after that is %s %s.", udg_NumberToSpawn[udg_LVL + 2], getWaveInfo(udg_LVL + 2)))
end)
