
require('lib')

local function main()

    print('Hello warcraft-vscode !')

    -- register command
    dofile('commandline.lua')
    dofile('game.lua')
end

Timer:after(0.1, main)

