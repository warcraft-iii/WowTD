local CommandLine = require('utils.commandline')
local Observer = require('utils.observer')
local Timer = require('oop.timer')

---@class CommandMgr: Observer
local CommandMgr = Observer:new()

function CommandMgr:init()
    CommandLine:addOptionToAll('-next', function(player, data)
        self:next(player)
    end)

    CommandLine:addOptionToAll('-air', function(player)
        Message:toPlayer(player, [[|c007EBFF1== The Air Wave ==|r

        |c00FFEAEA- The air creeps spawn every 7 waves
        - The most effective towers are the |r|c00C7FFBBAir tower|r |c00FFEAEAand the |r|c00C7FFBBPoison tower|r
        |c00FFEAEA- The tower with NO effect is the |r|c00C7FFBBSiege tower|r]])
    end)

    CommandLine:addOptionToAll('-hero', function(player)
        Message:toPlayer(player, [[|c007EBFF1== The Hero Wave ==|r

        |c00FFEAEA- The most effective tower are the |r|c00C7FFBBSiege tower|r |c00FFEAEAand the |r|c00C7FFBBPoison tower|r
        |c00FFEAEA- The low effective towers is the |r|c00C7FFBBIce tower|r
        |c00FFEAEA- The tower with NO effect is the |r|c00C7FFBBAir tower|r]])
    end)

    CommandLine:addOptionToAll('-immun', function(player)
        Message:toPlayer(player, [[|c007EBFF1== The Immun Wave ==|r

        |c00FFEAEA- The immun creeps spawns every 5 waves.
        - The effective tower is the |r |c00C7FFBBChaos tower|r
        |c00FFEAEA- The tower with NO effect is the |r|c00C7FFBBIce tower|r]])
    end)

    Timer:create():start(35, function()
        Message:toPlayer(Player:getLocal(), [[|c00EEEEEENeed help?
        Type |r|c007EBFF1-immun|r|c00EEEEEE, |r|c007EBFF1-air |r|c00EEEEEEor |r|c007EBFF1-hero|r]])
    end)

    self:registerEvent(Events.NextWave, function()
        self:next(Player:getLocal())
    end)
end

function CommandMgr:next(player)
    local lvl = WaveMgr:getCurrentLevel()
    Message:toPlayer(player,
                     string.format(L['The current wave is %s %s.'], WaveMgr:getInfo(lvl).count, self:getWaveInfo(lvl)))
    Message:toPlayer(player, string.format(L['The wave after this is %s %s.'], WaveMgr:getInfo(lvl + 1).count,
                                           self:getWaveInfo(lvl + 1)))
    Message:toPlayer(player, string.format(L['The wave after that is %s %s.'], WaveMgr:getInfo(lvl + 2).count,
                                           self:getWaveInfo(lvl + 2)))
end

function CommandMgr:getWaveInfo(lvl)
    if WaveMgr:getInfo(lvl).fly then
        return L['flying enemies']
    elseif math.modf(lvl, 5) == 0 then
        return L['immune enemies']
    end
    return L['normal enemies']
end

CommandMgr:init()
