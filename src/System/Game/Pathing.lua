-- Pathing.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/3/2019, 9:33:54 PM
local Observer = require('utils.observer')
local Trigger = require('oop.trigger')
local Player = require('oop.player')
local Unit = require('oop.unit')
local Order = require('enum.order')

local Pathing = Observer:new()

function Pathing:init()
    local function onEnter()
        self:onEnter()
    end

    for k, rect in pairs(PathingRects) do
        local trigger = Trigger:create()
        trigger:registerEnterRect(rect)
        trigger:addAction(onEnter)
    end
end

---getUnitTargetRect
---@param unit Unit
---@param rect Rect
function Pathing:getUnitTargetRect(unit, rect)
    local targetRects = rect:getTargetRects()
    if #targetRects == 1 then
        return targetRects[1]
    end
    local lastRect = unit:getLastRect()

    return table.random(table.filter(targetRects, function(rect)
        return lastRect ~= rect
    end))
end

function Pathing:onEnter()
    local unit = Event:getEnteringUnit()
    local player = unit:getOwner()
    if not (player == PlayerMgr:getBirthPlayer() or player == PlayerMgr:getWavePlayer()) then
        return false
    end

    local rect = Event:getTriggerRect()
    local targetRect = self:getUnitTargetRect(unit, rect)
    local lastRect = unit:getLastRect()

    if rect:isBirth() then
        unit:addAbility(FourCC('Aeth'))
    end

    if rect:isEnter() and unit:isFromBirth() then
        self:fireEvent(Events.UnitEnterBattleground, unit)
        unit:setOwner(Player:get(11), false)
    end

    unit:issuePointOrder(Order.move, targetRect:getCenterX(), targetRect:getCenterY())
    unit:setLastRect(rect)
end

Pathing:init()
