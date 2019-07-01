-- unit.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 6/30/2019, 11:02:29 PM
local Unit = require('stdlib.oop.unit')

require('Data.Unit')

function Unit:isTower()
    return true
end

---getTowerData
---@return TowerData
function Unit:getTowerData()
    return TowerData[self:getTypeId()]
end

---getNextLevelId
---@return integer
function Unit:getNextLevelId()
    return self:getTowerData().nextLevel
end

---getPrevLevelId
---@return integer
function Unit:getPrevLevelId()
    return self:getTowerData().prevLevel
end
