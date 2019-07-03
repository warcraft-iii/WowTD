-- EnemyCheck.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/4/2019, 12:13:03 AM
local Timer = require('oop.timer')
local Observer = require('utils.observer')

local Events = require('System.Game.Events')

local EnemyCheck = Observer:new()

function EnemyCheck:init()
    self:registerEvent(Events.UnitEnterBattleground, self.onUnitEnterBattleground)

    self.timer = Timer:create()
    self.timer:start(9, function()
        local val = 0.0

        for unit in Player:get(11):iterateUnits() do
            if unit:isAlive() then
                val = val + self:getNumberSpawn(unit)
            end
        end

        udg_CurrentlyOnMap = val
    end)
end

---onUnitEnterBattleground
---@param unit Unit
function EnemyCheck:onUnitEnterBattleground(unit)
    udg_CurrentlyOnMap = udg_CurrentlyOnMap + self:getNumberSpawn(unit)
end

---getNumberSpawn
---@param unit Unit
---@return float
function EnemyCheck:getNumberSpawn(unit)
    return 225 / udg_NumberToSpawn[unit:getLevel()]
end

EnemyCheck:init()

