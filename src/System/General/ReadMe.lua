local Observer = require('utils.observer')
local Icons = require('ui.icons')

---@class ReadMe: Observer
local ReadMe = Observer:new()

function ReadMe:init()
    local towers = Quest:create()
    towers:setTitle(L['|c00FF0303The Towers|r'])
    towers:setDescription([[|c00FF0303--> Siegetowers <--|r

    - Increase the attackspeed of some towers
    - Now ALL! siegetowers got new and better splash

    |c0000FF00--> Poisontowers <--|r

    - Remove Poisonattack
    - Addet 350 AOE Poisonaura
    - Reduced the damage of some towers
    - Fixed attackspeed of one tower
    - Now the towers realy have multi-attack

    |c007EBFF1--> Airtowers <--|r

    - Increased attackspeed of some towers
    - Increased damage of some towers
    - Now ALL air towers have splash
    - Fixed some tooltips

    |c00959697--> Auratowers <--|r
    - Increase Speedbonus of the speed-aura-tower
    - Increase Attackbonus of the damage-aura-tower
    - Change the tooltips

    |c000042FF--> Frosttowers <--|r

    - Increase the attackspeed of some towers
    - Increase the damage of all towers
    - Change some tooltips

    ]])
    towers:setIconPath(Icons.bTNStatUp)
    towers:setRequired(true)
    towers:setState(Quest.StateType.Discovered)

    local gamePlay = Quest:create()
    gamePlay:setTitle(L['|c00FF0303The Gameplay|r'])
    gamePlay:setDescription([[- Change the mapdesign
    - Change the difficult-system
      - Easy: 75% Handicap
      - Normal: 100% Handicap
      - Hard: 125% Handicap
    - Removes 3 cheats
    - Change the help-system
    - Change buildermodel
    - Change damagesystem
    - Change armorsystem
    - Change wavebugs
    - Change spawnbug
    - Now the spawn closed, when a player leave the game]])
    gamePlay:setIconPath(Icons.pASBTNStatUp)
    gamePlay:setRequired(true)
    gamePlay:setState(Quest.StateType.Discovered)

    local contact = Quest:create()
    contact:setTitle(L['Contact me'])
    contact:setDescription(L['Welcome to concat us.'])
    contact:setIconPath(Icons.pASBTNStatUp)
    contact:setRequired(false)
    contact:setState(Quest.StateType.Discovered)

    local suggestion = Quest:create()
    suggestion:setTitle(L['I hope you ...'])
    suggestion:setDescription(
        [[.. mail me some feedback about the map because only so i can patch this map and bring your ideas on.

    .. you have fun to play this new Green Circle TD All Stars]])
    suggestion:setIconPath(Icons.pASBTNStatUp)
    suggestion:setRequired(false)
    suggestion:setState(Quest.StateType.Discovered)

end

ReadMe:init()
