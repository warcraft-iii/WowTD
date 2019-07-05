require('base')
require('enum')
require('oop')

-- @debug@
require('console')
-- @end-debug@

require('System.Config')
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
    dofile('System/Game/PlayerMgr.lua')
    dofile('System/General/CommandMgr.lua')
    dofile('Game.lua')
    dofile('System/Game/Pathing.lua')
    dofile('System/Game/EnemyCheck.lua')

    dofile('System/Game/BattleGroundMgr.lua')
    dofile('System/Game/WaveMgr.lua')
    dofile('System/General/GameModeMgr.lua')
    dofile('System/Game/ScoreMgr.lua')

    dofile('System/General/ReadMe.lua')
    dofile('System/General/ChangeLogs.lua')

    -- init finished
    Timer:after(5, function()
        print(L['Welcome to World of Warcraft TD v1.0.0'])
    end)

end

Timer:after(0.1, main)
