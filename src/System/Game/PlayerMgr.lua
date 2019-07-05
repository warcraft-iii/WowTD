local Observer = require('utils.observer')

PlayerMgr = Observer:new()

function PlayerMgr:init()
    self.validPlayers = {}
    self.outSidePlayers = {}
    self.inSidePlayers = {}

    self.birthPlayer = Player:get(10)
    self.birthPlayer:setColor(PlayerColor.Violet)

    self.wavePlayer = Player:get(11)
    self.wavePlayer:setColor(PlayerColor.Wheat)

    for i = 0, GameConfig.MaxPlayers - 1 do
        local p = Player:get(i)
        if p:getSlotState() == PlayerSlotState.Playing and p:getController() == MapControl.User then
            if i == 0 or i == 3 or i == 4 or i == 7 then
                table.insert(self.outSidePlayers, p)
            else
                table.insert(self.inSidePlayers, p)
            end
            table.insert(self.validPlayers, p)
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
