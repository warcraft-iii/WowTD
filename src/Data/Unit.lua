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
