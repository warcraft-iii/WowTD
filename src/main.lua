require('base')
require('enum')
require('oop')

-- @debug@
require('console')
-- @end-debug@

require('Data')

---fake locale library
---@class L : table
L = setmetatable({}, {
    __index = function(t, k)
        return k
    end,
})

local function main()

    -- init
    dofile('System/General/CommandLine.lua')
    dofile('Game.lua')
    dofile('System/Game/Pathing.lua')
    dofile('System/Game/EnemyCheck.lua')

    dofile('System/General/GameModeMgr.lua')

    -- init finished
    Timer:after(5, function()
        print(L['Welcome to World of Warcraft TD v1.0.0'])
    end)

end

Timer:after(0.1, main)
