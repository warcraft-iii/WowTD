-- Unit.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/1/2019, 8:39:07 PM
---@class TowerData
---@field nextLevel integer
---@field prevLevel integer
TowerData = {}

TowerType = {
    Air = 1, --
    Chaos = 2,
    Frost = 3,
    Siege = 4,
    Poison = 5,
}

TowerUpgradeLine = {

    [TowerType.Air] = {
        FourCC('n009'), --
        FourCC('n00B'), --
        FourCC('n00D'), --
        FourCC('n000'), --
        FourCC('n003'), --
        FourCC('n001'), --
        FourCC('n005'), --
        FourCC('n004'), --
        FourCC('n00C'), --
        FourCC('n00E'), --
    },

    [TowerType.Chaos] = {
        FourCC('h01O'), --
        FourCC('h01N'), --
        FourCC('h017'), --
        FourCC('h018'), --
        FourCC('h019'), --
        FourCC('h01P'), --
        FourCC('h01Q'), --
        FourCC('h00T'), --
        FourCC('h00X'), --
        FourCC('h00Y'), --
    },

    [TowerType.Frost] = {
        FourCC('n006'), --
        FourCC('n007'), --
        FourCC('n00A'), --
        FourCC('n008'), --
        FourCC('h01G'), --
        FourCC('h01H'), --
    },

    [TowerType.Siege] = {
        FourCC('h000'), --
        FourCC('h002'), --
        FourCC('h003'), --
        FourCC('h004'), --
        FourCC('h005'), --
        FourCC('h006'), --
        FourCC('h001'), --
        FourCC('h007'), --
        FourCC('h00K'), --
        FourCC('h00L'), --
        FourCC('h00M'), --
        FourCC('h00S'), --
        FourCC('h00R'), --
        FourCC('h00W'), --
        FourCC('h00Z'), --
        FourCC('h013'), --
        FourCC('h01A'), --
        FourCC('h01B'), --
        FourCC('h01C'), --
        FourCC('h01D'), --
        FourCC('h01E'), --
        FourCC('h01M'), --
    },

    [TowerType.Poison] = {
        FourCC('h008'), --
        FourCC('h00D'), --
        FourCC('h00C'), --
        FourCC('h00B'), --
        FourCC('h00A'), --
        FourCC('h009'), --
        FourCC('h00E'), --
        FourCC('h00J'), --
        FourCC('h00N'), --
        FourCC('h00F'), --
        FourCC('h00U'), --
        FourCC('h00V'), --
        FourCC('h014'), --
        FourCC('h015'), --
        FourCC('h016'), --
        FourCC('h01J'), --
    },
}

for towerType, list in pairs(TowerUpgradeLine) do
    for i, unitId in ipairs(list) do
        TowerData[unitId] = TowerData[unitId] or {}
        TowerData[unitId].nextLevel = list[i + 1]
        TowerData[unitId].prevLevel = list[i - 1]
    end
end

---@class WaveUintItem : table
---@field id integer
---@field count integer
---@field fly boolean

---WaveUnits
---@class WaveUintItem[]
WaveUnits = {
    [1] = {id = FourCC("hfoo"), count = 82},
    [2] = {id = FourCC("hrif"), count = 189},
    [3] = {id = FourCC("hsor"), count = 24},
    [4] = {id = FourCC("hspt"), count = 104},
    [5] = {id = FourCC("hmpr"), count = 73},
    [6] = {id = FourCC("hkni"), count = 185},
    [7] = {id = FourCC("hgyr"), count = 133, fly = true},
    [8] = {id = FourCC("hmtm"), count = 189},
    [9] = {id = FourCC("hmtt"), count = 16},
    [10] = {id = FourCC("ogru"), count = 101},
    [11] = {id = FourCC("ohun"), count = 100},
    [12] = {id = FourCC("odoc"), count = 32},
    [13] = {id = FourCC("oshm"), count = 80},
    [14] = {id = FourCC("otbr"), count = 40},
    [15] = {id = FourCC("otau"), count = 20},
    [16] = {id = FourCC("orai"), count = 182},
    [17] = {id = FourCC("okod"), count = 121, fly = true},
    [18] = {id = FourCC("ospw"), count = 40},
    [19] = {id = FourCC("ugho"), count = 200},
    [20] = {id = FourCC("ucry"), count = 70},
    [21] = {id = FourCC("ugar"), count = 25},
    [22] = {id = FourCC("uban"), count = 105},
    [23] = {id = FourCC("unec"), count = 20, fly = true},
    [24] = {id = FourCC("uabo"), count = 140},
    [25] = {id = FourCC("umtw"), count = 111},
    [26] = {id = FourCC("uobs"), count = 20},
    [27] = {id = FourCC("Obla"), count = 200, fly = true},
    [28] = {id = FourCC("ufro"), count = 15},
    [29] = {id = FourCC("Edem"), count = 165},
    [30] = {id = FourCC("Hmkg"), count = 200},
    [31] = {id = FourCC("ninf"), count = 30},
    [32] = {id = FourCC("Nngs"), count = 80},
    [33] = {id = FourCC("Ucrl"), count = 15},
    [34] = {id = FourCC("Udea"), count = 200},
    [35] = {id = FourCC("nrwm"), count = 145, fly = true},
    [36] = {id = FourCC("nsgh"), count = 120},
}

---@type table<integer, Unit[]>
DarkSummoner = {}
local summonerIndex = 1
for i = 0, GameConfig.MaxPlayers - 1 do
    local units = {}
    for j = 1, 3 do
        table.insert(units, Unit:fromUd(udg_DarkSummoner[summonerIndex]))
        summonerIndex = summonerIndex + 1
    end
    DarkSummoner[Player:get(i)] = units
end
