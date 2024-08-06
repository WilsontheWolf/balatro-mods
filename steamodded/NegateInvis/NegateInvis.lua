--- STEAMODDED HEADER
--- MOD_NAME: Negative Invis
--- MOD_ID: NegateInvis
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: Negative Invis
----------------------------------------------
------------MOD CODE -------------------------
local origDraw = Card.draw

function Card:draw(layer)
    if self.edition and self.edition.negative then
        return
    end
    origDraw(self, layer)
end
----------------------------------------------
------------MOD CODE END----------------------
