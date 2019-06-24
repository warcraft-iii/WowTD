-- game.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 6/24/2019, 9:59:20 PM

-- 还不知道有什么用
local numberInMapCheckTimer = Timer:create()
numberInMapCheckTimer:start(9, function()
    local val = 0.0

    for unit in Iterate:iterateUnitsOfPlayer(Player:get(11)) do
        print(unit)

        if unit:isAlive() then
            val = val + 225 / udg_NumberToSpawn[unit:getLevel()]
        end
    end

    print('numberInMapCheckTimer', val)

    -- udg_CurrentlyOnMap = val
end)

-- local sellTrigger = Trigger:create()

-- sellTrigger:registerPlayerUnitEvent(Player:get(0), PlayerUnitEvent.UnitTrainFinish)
-- sellTrigger:addCondition(Condition:create(function()
--     return Event:getTrainedUnit():getTypeId() == FourCC('ncop')
-- end))
-- sellTrigger:addAction(function()
--     Event:getTriggerUnit():remove()
-- end)
