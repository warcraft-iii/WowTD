-- Pathing.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/3/2019, 8:35:15 PM
local Rect = require('oop.rect')

---@type table<string, Rect>
PathingRects = {
    Spawn1 = Rect:fromUd(gg_rct_Spawn1),
    Spawn2 = Rect:fromUd(gg_rct_Spawn2),
    Spawn3 = Rect:fromUd(gg_rct_Spawn3),
    Spawn4 = Rect:fromUd(gg_rct_Spawn4),
    Spawn5 = Rect:fromUd(gg_rct_Spawn5),
    Spawn6 = Rect:fromUd(gg_rct_Spawn6),
    Spawn7 = Rect:fromUd(gg_rct_Spawn7),
    Spawn8 = Rect:fromUd(gg_rct_Spawn8),
    Corner1 = Rect:fromUd(gg_rct_Corner1),
    Corner2 = Rect:fromUd(gg_rct_Corner2),
    Corner3 = Rect:fromUd(gg_rct_Corner3),
    Corner4 = Rect:fromUd(gg_rct_Corner4),
    Corner5 = Rect:fromUd(gg_rct_Corner5),
    Corner6 = Rect:fromUd(gg_rct_Corner6),
    Corner7 = Rect:fromUd(gg_rct_Corner7),
    Corner8 = Rect:fromUd(gg_rct_Corner8),
    Enters2 = Rect:fromUd(gg_rct_Enters2),
    Enters3 = Rect:fromUd(gg_rct_Enters3),
    Enters6 = Rect:fromUd(gg_rct_Enters6),
    Enters7 = Rect:fromUd(gg_rct_Enters7),
    InsideBottom = Rect:fromUd(gg_rct_InsideBottom),
    InsideBottomLeft = Rect:fromUd(gg_rct_InsideBottomLeft),
    InsideBottomRight = Rect:fromUd(gg_rct_InsideBottomRight),
    InsideLeft = Rect:fromUd(gg_rct_InsideLeft),
    InsideRight = Rect:fromUd(gg_rct_InsideRight),
    InsideTop = Rect:fromUd(gg_rct_InsideTop),
    InsideTopLeft = Rect:fromUd(gg_rct_InsideTopLeft),
    InsideTopRight = Rect:fromUd(gg_rct_InsideTopRight),
    OutsideBottom = Rect:fromUd(gg_rct_OutsideBottom),
    OutsideBottomLeft = Rect:fromUd(gg_rct_OutsideBottomLeft),
    OutsideBottomRight = Rect:fromUd(gg_rct_OutsideBottomRight),
    OutsideLeft = Rect:fromUd(gg_rct_OutsideLeft),
    OutsideRight = Rect:fromUd(gg_rct_OutsideRight),
    OutsideTop = Rect:fromUd(gg_rct_OutsideTop),
    OutsideTopLeft = Rect:fromUd(gg_rct_OutsideTopLeft),
    OutsideTopRight = Rect:fromUd(gg_rct_OutsideTopRight),
}

RectType = {
    Birth = 1,
    Entering = 2,
    Enter = 3,
}

PathingRects.Spawn1.type = RectType.Birth
PathingRects.Spawn2.type = RectType.Birth
PathingRects.Spawn3.type = RectType.Birth
PathingRects.Spawn4.type = RectType.Birth
PathingRects.Spawn5.type = RectType.Birth
PathingRects.Spawn6.type = RectType.Birth
PathingRects.Spawn7.type = RectType.Birth
PathingRects.Spawn8.type = RectType.Birth

PathingRects.Corner1.type = RectType.Entering
PathingRects.Corner2.type = RectType.Entering
PathingRects.Corner3.type = RectType.Entering
PathingRects.Corner4.type = RectType.Entering
PathingRects.Corner5.type = RectType.Entering
PathingRects.Corner6.type = RectType.Entering
PathingRects.Corner7.type = RectType.Entering
PathingRects.Corner8.type = RectType.Entering

PathingRects.Enters2.type = RectType.Enter
PathingRects.Enters3.type = RectType.Enter
PathingRects.Enters6.type = RectType.Enter
PathingRects.Enters7.type = RectType.Enter
PathingRects.OutsideTopLeft.type = RectType.Enter
PathingRects.OutsideTopRight.type = RectType.Enter
PathingRects.OutsideBottomLeft.type = RectType.Enter
PathingRects.OutsideBottomRight.type = RectType.Enter

BirthRects = {
    [PathingRects.Spawn1] = true,
    [PathingRects.Spawn2] = true,
    [PathingRects.Spawn3] = true,
    [PathingRects.Spawn4] = true,
    [PathingRects.Spawn5] = true,
    [PathingRects.Spawn6] = true,
    [PathingRects.Spawn7] = true,
    [PathingRects.Spawn8] = true,
    [PathingRects.Corner1] = true,
    [PathingRects.Corner2] = true,
    [PathingRects.Corner3] = true,
    [PathingRects.Corner4] = true,
    [PathingRects.Corner5] = true,
    [PathingRects.Corner6] = true,
    [PathingRects.Corner7] = true,
    [PathingRects.Corner8] = true,
    [PathingRects.Enters2] = true,
    [PathingRects.Enters3] = true,
    [PathingRects.Enters6] = true,
    [PathingRects.Enters7] = true,
}

PathingRects.Spawn1.targets = {PathingRects.Corner1}
PathingRects.Spawn2.targets = {PathingRects.Corner2}
PathingRects.Spawn3.targets = {PathingRects.Corner3}
PathingRects.Spawn4.targets = {PathingRects.Corner4}
PathingRects.Spawn5.targets = {PathingRects.Corner5}
PathingRects.Spawn6.targets = {PathingRects.Corner6}
PathingRects.Spawn7.targets = {PathingRects.Corner7}
PathingRects.Spawn8.targets = {PathingRects.Corner8}

PathingRects.Corner1.targets = {PathingRects.OutsideTopLeft}
PathingRects.Corner2.targets = {PathingRects.Enters2}
PathingRects.Corner3.targets = {PathingRects.Enters3}
PathingRects.Corner4.targets = {PathingRects.OutsideTopRight}
PathingRects.Corner5.targets = {PathingRects.OutsideBottomLeft}
PathingRects.Corner6.targets = {PathingRects.Enters6}
PathingRects.Corner7.targets = {PathingRects.Enters7}
PathingRects.Corner8.targets = {PathingRects.OutsideBottomRight}

PathingRects.OutsideTopLeft.targets = {PathingRects.OutsideTop, PathingRects.OutsideLeft}
PathingRects.OutsideTopRight.targets = {PathingRects.OutsideTop, PathingRects.OutsideRight}
PathingRects.OutsideBottomLeft.targets = {PathingRects.OutsideBottom, PathingRects.OutsideLeft}
PathingRects.OutsideBottomRight.targets = {PathingRects.OutsideBottom, PathingRects.OutsideRight}

PathingRects.Enters2.targets = {PathingRects.InsideTopLeft, PathingRects.InsideTop}
PathingRects.Enters3.targets = {PathingRects.InsideTopRight, PathingRects.InsideRight}
PathingRects.Enters6.targets = {PathingRects.InsideBottomLeft, PathingRects.InsideLeft}
PathingRects.Enters7.targets = {PathingRects.InsideBottomRight, PathingRects.InsideBottom}

PathingRects.OutsideTop.targets = {PathingRects.OutsideTopLeft, PathingRects.OutsideTopRight, PathingRects.InsideTop}
PathingRects.OutsideLeft.targets = {
    PathingRects.OutsideTopLeft, PathingRects.OutsideBottomLeft, PathingRects.InsideLeft,
}
PathingRects.OutsideRight.targets = {
    PathingRects.OutsideTopRight, PathingRects.OutsideBottomRight, PathingRects.InsideRight,
}
PathingRects.OutsideBottom.targets = {
    PathingRects.OutsideBottomLeft, PathingRects.OutsideBottomRight, PathingRects.InsideBottom,
}

PathingRects.InsideTopLeft.targets = {PathingRects.Enters2, PathingRects.InsideLeft}
PathingRects.InsideTopRight.targets = {PathingRects.Enters3, PathingRects.InsideTop}
PathingRects.InsideBottomLeft.targets = {PathingRects.Enters6, PathingRects.InsideBottom}
PathingRects.InsideBottomRight.targets = {PathingRects.Enters7, PathingRects.InsideRight}

PathingRects.InsideLeft.targets = {PathingRects.Enters6, PathingRects.InsideTopLeft}
PathingRects.InsideRight.targets = {PathingRects.Enters3, PathingRects.InsideBottomRight}
PathingRects.InsideTop.targets = {PathingRects.Enters2, PathingRects.InsideTopRight}
PathingRects.InsideBottom.targets = {PathingRects.Enters7, PathingRects.InsideBottomLeft}
