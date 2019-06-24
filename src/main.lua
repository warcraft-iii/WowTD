require('lib.base')
local Timer = require('lib.oop.timer')

local function main()

    print('Hello warcraft-vscode !')

    -- register command
    require('commandline')

end

Timer:after(0.1, main)

