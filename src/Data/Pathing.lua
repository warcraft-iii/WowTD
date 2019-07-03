-- Pathing.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 7/3/2019, 8:35:15 PM
local Rect = require('oop.rect')

Rects = {
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
    Spawn1 = Rect:fromUd(gg_rct_Spawn1),
    Spawn2 = Rect:fromUd(gg_rct_Spawn2),
    Spawn3 = Rect:fromUd(gg_rct_Spawn3),
    Spawn4 = Rect:fromUd(gg_rct_Spawn4),
    Spawn5 = Rect:fromUd(gg_rct_Spawn5),
    Spawn6 = Rect:fromUd(gg_rct_Spawn6),
    Spawn7 = Rect:fromUd(gg_rct_Spawn7),
    Spawn8 = Rect:fromUd(gg_rct_Spawn8),
}

Rects.Spawn1.targets = {Rects.Corner1}
Rects.Spawn2.targets = {Rects.Corner2}
Rects.Spawn3.targets = {Rects.Corner3}
Rects.Spawn4.targets = {Rects.Corner4}
Rects.Spawn5.targets = {Rects.Corner5}
Rects.Spawn6.targets = {Rects.Corner6}
Rects.Spawn7.targets = {Rects.Corner7}
Rects.Spawn8.targets = {Rects.Corner8}

Rects.Corner1.targets = {Rects.OutsideTopLeft}
Rects.Corner2.targets = {Rects.Enters2}
Rects.Corner3.targets = {Rects.Enters3}
Rects.Corner4.targets = {Rects.OutsideTopRight}
Rects.Corner5.targets = {Rects.OutsideBottomLeft}
Rects.Corner6.targets = {Rects.Enters6}
Rects.Corner7.targets = {Rects.Enters7}
Rects.Corner8.targets = {Rects.OutsideBottomRight}

Rects.OutsideTopLeft.targets = {Rects.OutsideTop, Rects.OutsideLeft}
Rects.OutsideTopRight.targets = {Rects.OutsideTop, Rects.OutsideRight}
Rects.OutsideBottomLeft.targets = {Rects.OutsideBottom, Rects.OutsideLeft}
Rects.OutsideBottomRight.targets = {Rects.OutsideBottom, Rects.OutsideRight}

Rects.Enters2.targets = {Rects.InsideTopLeft, Rects.InsideTop}
Rects.Enters3.targets = {Rects.InsideTopRight, Rects.InsideRight}
Rects.Enters6.targets = {Rects.InsideBottomLeft, Rects.InsideLeft}
Rects.Enters7.targets = {Rects.InsideBottomRight, Rects.InsideBottom}

Rects.OutsideTop.targets = {Rects.OutsideTopLeft, Rects.OutsideTopRight, Rects.InsideTop}
Rects.OutsideLeft.targets = {Rects.OutsideTopLeft, Rects.OutsideBottomLeft, Rects.InsideLeft}
Rects.OutsideRight.targets = {Rects.OutsideTopRight, Rects.OutsideBottomRight, Rects.InsideRight}
Rects.OutsideBottom.targets = {Rects.OutsideBottomLeft, Rects.OutsideBottomRight, Rects.InsideBottom}

Rects.InsideTopLeft.targets = {Rects.Enters2, Rects.InsideLeft}
Rects.InsideTopRight.targets = {Rects.Enters3, Rects.InsideTop}
Rects.InsideBottomLeft.targets = {Rects.Enters6, Rects.InsideBottom}
Rects.InsideBottomRight.targets = {Rects.Enters7, Rects.InsideRight}

Rects.InsideLeft.targets = {Rects.Enters6, Rects.InsideTopLeft}
Rects.InsideRight.targets = {Rects.Enters3, Rects.InsideBottomRight}
Rects.InsideTop.targets = {Rects.Enters2, Rects.InsideTopRight}
Rects.InsideBottom.targets = {Rects.Enters7, Rects.InsideBottomLeft}
