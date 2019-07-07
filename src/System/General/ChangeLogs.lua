local ChangeLog = require('ui.changelog')

ChangeLog:create(1, 0, 0):normal(L['First version'])

ChangeLog:create(2, 0, 0):normal(L['Second version'])

ChangeLog:update()
