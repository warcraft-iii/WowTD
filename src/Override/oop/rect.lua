-- rect.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/3/2019, 9:32:07 PM

---@type Rect
local Rect = require('stdlib.oop.rect')

---getTargetRects
---@return Rect[]
function Rect:getTargetRects()
    return self.targets
end

---isBirth
---@return boolean
function Rect:isBirth()
    return self.type == RectType.Birth
end

---isEntering
---@return boolean
function Rect:isEntering()
    return self.type == RectType.Entering
end

---isEnter
---@return boolean
function Rect:isEnter()
    return self.type == RectType.Enter
end

return Rect
