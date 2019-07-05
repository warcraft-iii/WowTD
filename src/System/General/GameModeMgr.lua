--- 游戏模式管理
---
local DialogBox = require('ui.dialogbox')
local Force = require('oop.force')
local Timer = require('oop.timer')
local Observer = require('utils.observer')
local Event = require('oop.event')
local Native = require('native')

local GameModeMgr = Observer:new()

function GameModeMgr:init()
    ---@type DialogItem[]
    self.menus = {
        {
            text = string.format(L['|c0000FF00Easy (Handicap: %d%%)|r'], GameModeHandicap.Easy), --
            value = GameModeType.Easy,
        }, {
            text = string.format(L['|c000080FFNormal (Handicap: %d%%)|r'], GameModeHandicap.Normal), --
            value = GameModeType.Normal,
        }, {
            text = string.format(L['|c00FF0000Hard (+%d%% Handicap)|r'], GameModeHandicap.Hard), --
            value = GameModeType.Hard,
        },
    }
    self.hardVotes = 0
    self.insaneVotes = 0

    self:showVote()

    Timer:after(GameConfig.VoteDuration, function()
        self:voteResult()
    end)
end

---onVote
---@param dialogItem DialogItem
function GameModeMgr:onVote(dialogItem)
    local hardVote, insaneVote = 0, 0
    local text
    if dialogItem.value == GameModeType.Easy then
        text = L['%s voted |c0000FF00Easy|r']
    elseif dialogItem.value == GameModeType.Normal then
        text = L['%s voted |c000080FFNormal|r']
        hardVote = 1
    elseif dialogItem.value == GameModeType.Hard then
        text = L['%s voted |c00FF0000Hard|r']
        insaneVote = 1
    end
    local player = Event:getTriggerPlayer()
    local playerId = Event:getTriggerPlayer():getId() + 1
    self.hardVotes = self.hardVotes + hardVote
    self.insaneVotes = self.insaneVotes + insaneVote
    print(string.format(text, player:getName()))
end

function GameModeMgr:showVote()
    if self.dlg then
        self.dlg:delete()
    end
    self.dlg = DialogBox:question(L['|c00008080What mode?|r'], self.menus, function(dialogItem)
        self:onVote(dialogItem)
        self.dlg = nil
    end)
end

function GameModeMgr:voteResult()
    if self.dlg then
        self.dlg:delete()
    end

    Native.SetMapFlag(MapFlag.UseHandicaps, true)

    ---@type Force
    local players = Force:fromUd(udg_ConnectedPlayers)
    local votes = players:size() - self.hardVotes - self.insaneVotes
    local text, handicap
    if votes >= self.hardVotes and votes >= self.insaneVotes then
        text = L['|c0000FF00Gamemode is set to: Easy|r']
        handicap = GameModeHandicap.Easy
    elseif votes >= self.insaneVotes then
        text = L['|c000080FFGamemode is set to: Normal|r']
        handicap = GameModeHandicap.Normal
    elseif votes >= self.hardVotes then
        text = L['|c00FF0000Gametyp is set to: Hard|r']
        handicap = GameModeHandicap.Hard
    end

    print(text)
    Player:get(11):setHandicap(handicap * 0.01)
    Player:get(10):setHandicap(handicap * 0.01)
end

GameModeMgr:init()
