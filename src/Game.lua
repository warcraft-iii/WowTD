-- game.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 6/24/2019, 9:59:20 PM
local Unit = require('oop.unit')
local Timer = require('oop.timer')
local Player = require('oop.player')

local ReplaceUnitStateMethod = require('enum.replaceunitstatemethod')

-- sell 金币有bug
local sellTrigger = Trigger:create()
do
    sellTrigger:registerAllPlayersUnitEvent(PlayerUnitEvent.UnitTrainFinish)
    sellTrigger:addCondition(function()
        return Event:getTrainedUnit():getTypeId() == FourCC('ncop')
    end)
    sellTrigger:addAction(function()
        local unit = Event:getTriggerUnit()
        unit:getOwner():adjustGold(unit:getPointValue())
        unit:delete()
        Event:getTrainedUnit():delete()
    end)
end

local downgradeTrigger = Trigger:create()
do
    downgradeTrigger:registerAllPlayersUnitEvent(PlayerUnitEvent.UnitTrainFinish)
    downgradeTrigger:addCondition(function()
        return Event:getTrainedUnit():getTypeId() == FourCC('n00F')
    end)
    downgradeTrigger:addAction(function()
        local unit = Event:getTriggerUnit()
        local unitPoint = unit:getPointValue()
        local prevLevelId = unit:getPrevLevelId()

        Event:getTrainedUnit():delete()

        local owner = unit:getOwner()
        local isSelected = unit:isSelected(owner)

        local replaced = unit:replace(prevLevelId, ReplaceUnitStateMethod.Maximum)
        local owner = replaced:getOwner()
        if isSelected then
            owner:selectUnit(replaced)
        end

        owner:adjustGold(unitPoint - replaced:getPointValue())
    end)
end
