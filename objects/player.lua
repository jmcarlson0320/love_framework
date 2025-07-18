local Player = {}

local assets = require("assets")
local SpriteSheet = require("spriteSheet")
local Animation = require("animation")

local SPRITE_IMAGE = "dungeon_monsters"

local function update(self, dt)
    self.y = self.y + 1/4
    self.currentAnim:update(dt)
end

local function draw(self)
    self.currentAnim:draw(self.x, self.y)
end

function Player.new(x, y)
    local self = {}

    self.x = x
    self.y = y

    self.spriteSheet = SpriteSheet.new(assets.get(SPRITE_IMAGE), 24, 32)
    self.animations = {
        ["walk"] = Animation.new(self.spriteSheet, {7, 8, 9, 8}, 4),
    }

    self.currentAnim = self.animations["walk"]

    self.update = update
    self.draw = draw

    return self
end

return Player
