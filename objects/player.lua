local Player = {}
local assets = require("assets")
local Sprite = require("sprite")

local spriteSheetName = "mySprites"
local spriteName = "player_sprite_2"

local function update(self, dt)
end

local function draw(self)
    mySpriteSheet:draw(self.sprite, self.x, self.y)
end

function Player.new(x, y)
    local self = {}

    self.x = x
    self.y = y

    -- TODO
    --local spriteSheet = assets.get(spriteSheetName)
    self.sprite = mySpriteSheet.find(spriteName)

    self.update = update
    self.draw = draw

    return self
end

return Player
