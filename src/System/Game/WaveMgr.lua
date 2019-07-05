local Observer = require('utils.observer')
local Timer = require('oop.timer')

WaveMgr = Observer:new()

function WaveMgr:init()
    self.currentLvl = 0
    self.spawningGroup = false
    self.spawningRate = 0
    self.spawnCounter = 0
    self.emptySpawnCounter = 0
    self.nextSpawnTracker = 0.0
    self.spawningCalc = 0
    self.spawnUnit = 0

    self:registerEvent(Events.GameModeFinished, function()

        self:firstWaveTip()

        -- 开始第一波
        Timer:after(GameConfig.FirstWave, function()
            self:next()
        end)

        -- 刷兵
        self.timerSpawnWave = Timer:create()
        self.timerSpawnWave:start(0.15, function()
            self:spawnWave()
        end)

    end)

    self:registerEvents({Events.GameVictory, Events.GameLose}, function()
        if self.timerSpawnWave then
            self.timerSpawnWave:delete()
        end
    end)

end

function WaveMgr:next()
    self.currentLvl = self.currentLvl + 1
    if self.currentLvl >= GameConfig.MaxWave then
        Timer:after(15, function()
            self:fireEvent(Events.GameVictory)
            self.spawnUnit = 0
            print(L['You win, nice going!'])
        end)
        return
    end

    local data = self:getInfo(self.currentLvl)

    print(string.format(L['|c008000FFWave %d of 36.|r'], self.currentLvl))

    LeaderboardSetPlayerItemValueBJ(Player(9), udg_LEADERBOARD, self.currentLvl)

    self.spawningRate = 450.00 / data.count
    self.spawnCounter = 0
    self.emptySpawnCounter = 0
    self.nextSpawnTracker = 0.0
    self.spawningCalc = 0
    self.spawnUnit = data.id

    self:fireEvent(Events.NextWave, self.currentLvl)

    Timer:after(GameConfig.WaveInterval, function()
        self:next()
    end)
end

function WaveMgr:getCurrentLevel()
    return self.currentLvl
end

function WaveMgr:getCurrentCount()
    return WaveUnits[self.currentLvl].count
end

---@return WaveUintItem
function WaveMgr:getInfo(lvl)
    return WaveUnits[lvl]
end

---@param players Player[]
function WaveMgr:createUnit(players)
    for _, p in ipairs(players) do
        local id = p:getId() + 1
        local rt = PathingRects['Spawn' .. id]
        if not rt then
            print('error spawn id ', id)
            return
        end
        local pt = rt:randomPosition()
        Unit:create(PlayerMgr:getBirthPlayer(), self.spawnUnit, pt.x, pt.y, bj_UNIT_FACING)
    end
end

function WaveMgr:spawnWave()
    if self.spawnCounter >= self.spawningCalc and self.spawnUnit > 0 then
        if self.spawningGroup then
            self.spawningGroup = false
            self:createUnit(PlayerMgr:getOutSide())
            self.nextSpawnTracker = self.nextSpawnTracker + self.spawningRate
            self.spawningCalc = self.nextSpawnTracker
        else
            self:createUnit(PlayerMgr:getInSide())
            self.spawningGroup = true
        end

        self.emptySpawnCounter = self.emptySpawnCounter + 1
    end
    self.spawnCounter = self.spawnCounter + 1
end

function WaveMgr:firstWaveTip()
    print(
        L['|CFFBBFF00F|CFFBEF200i|CFFC2E500r|CFFC5D700s|CFFC9CA00t |CFFD0AF00w|CFFD3A200a|CFFD79400v|CFFDB8700e |CFFE26C00i|CFFE55E00n |CFFEC44001|CFFF036005 |CFFF71B00s|CFFFB0E00e|CFFFE0100c'])

    local sound = Sound:create([[Sound\Ambient\DoodadEffects\TheHornOfCenarius.wav]], false, false, false, 10, 10,
                               'DefaultEAXON')
    sound:setParamsFromLabel('HornOfCenariusSound')
    sound:setDuration(12120)
    sound:start()

    for _, player in ipairs(PlayerMgr:getPlayers()) do
        for _, unit in ipairs(DarkSummoner[player]) do
            unit:setAnimation('stand channel')
        end
    end

end

WaveMgr:init()
