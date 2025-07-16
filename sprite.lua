local Sprite = {}

local function draw(self, x, y)
    self.spriteSheet:draw(self.id, x, y)
end

function Sprite.new(spriteSheet, spriteName)
    print(spriteName)
    local self = {}
    
    self.spriteSheet = spriteSheet
    self.name = spriteName
    self.id = self.spriteSheet:find(self.name)

    self.draw = draw

    return self
end

return Sprite
