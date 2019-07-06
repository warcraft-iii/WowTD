local Observer = require('utils.observer')

---@class PlayerMgr: Observer
PlayerMgr = Observer:new()

function PlayerMgr:init()
    self.validPlayers = {}
    self.outSidePlayers = {}
    self.inSidePlayers = {}
    self.emptyPlayers = {}

    self.birthPlayer = Player:get(10)
    self.birthPlayer:setColor(PlayerColor.Violet)

    self.wavePlayer = Player:get(11)
    self.wavePlayer:setColor(PlayerColor.Wheat)

    local trigger = Trigger:create()
    trigger:addAction(function()
        local triggerPlayer = Event:getTriggerPlayer()
        for _, players in ipairs({self.validPlayers, self.outSidePlayers, self.inSidePlayers}) do
            for i, player in ipairs(players) do
                if player == triggerPlayer then
                    table.remove(players, i)
                    break
                end
            end
        end
        table.insert(self.emptyPlayers, triggerPlayer)
        self:fireEvent(Events.PlayerLeave, triggerPlayer)
    end)

    for i = 0, GameConfig.MaxPlayers - 1 do
        local player = Player:get(i)
        if player:getSlotState() == PlayerSlotState.Playing and player:getController() == MapControl.User then
            if i == 0 or i == 3 or i == 4 or i == 7 then
                table.insert(self.outSidePlayers, player)
            else
                table.insert(self.inSidePlayers, player)
            end
            table.insert(self.validPlayers, player)
            trigger:registerPlayerEvent(player, PlayerEvent.Leave)
        else
            table.insert(self.emptyPlayers, player)
        end
    end
end

---@return Player[]
function PlayerMgr:getPlayers()
    return self.validPlayers
end

---@return Player[]
function PlayerMgr:getOutSide()
    return self.outSidePlayers
end

---@return Player[]
function PlayerMgr:getInSide()
    return self.inSidePlayers
end

function PlayerMgr:getBirthPlayer()
    return self.birthPlayer
end

function PlayerMgr:getWavePlayer()
    return self.wavePlayer
end

PlayerMgr:init()
