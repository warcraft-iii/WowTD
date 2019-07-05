local Observer = require('utils.observer')

local ScoreMgr = Observer:new()

function ScoreMgr:init()
    self:setup()
    self.kills = {}

    self:registerEvent(Events.EnemyDeath, function(_, player, unit)
        self.kills[player] = self.kills[player] or 0
        self.kills[player] = self.kills[player] + 1
    end)

    self.timerUpdate = Timer:create()
    self.timerUpdate:start(1, function()
        for _, player in ipairs(PlayerMgr:getPlayers()) do
            self.lb:setItemValue(self.lb:getPlayerIndex(player), self.kills[player] or 0)
        end
        local currentOnMap = math.ceil(BattleGroundMgr:getCurrentOnMap())
        self.lb:setItemValue(self.lb:getPlayerIndex(PlayerMgr:getWavePlayer()), currentOnMap >= 0 and currentOnMap or 0)
    end)

    self:registerEvents(Events.GameVictory, Events.GameLose, function()
        self.timerUpdate:delete()
    end)

    self:registerEvent(Events.PlayerLeave, function(_, player)
        self.lb:setItemLabel(self.lb:getPlayerIndex(player), L['<Left Game>'])
    end)

    self:registerEvent(Events.NextWave, function(_, lvl)
        self.lb:setItemValue(self.lb:getPlayerIndex(Player:get(9)), lvl)
    end)

end

function ScoreMgr:setup()
    local lb = LeaderBoard:create()
    self.lb = lb
    lb:setLabel(L['|c0000FF00WoW TD All Stars|r'])
    for _, player in ipairs(PlayerMgr:getPlayers()) do
        player:setLeaderboard(lb)
        lb:addItem(player:getName(), 0, player)
    end
    lb:addItem(L['Current Level'], WaveMgr:getCurrentLevel(), Player:get(9))
    lb:addItem(L['|c007FFFD4% Overrun|r'], 0, PlayerMgr:getWavePlayer())
    lb:setItemValueColor(lb:getPlayerIndex(PlayerMgr:getWavePlayer()), 127, 255, 211, 255)
    lb:display(true)
    lb:setSizeByItemCount(lb:getItemCount())
end

ScoreMgr:init()
