local Player = {}

local assets = require("assets")
local SpriteSheet = require("spriteSheet")
local Animation = require("animation")

local SPRITE_IMAGE = "colored_balls"

local function update(self, dt)
    self.x = self.x - 0.5
    self.y = self.y - 0.5
    self.currentAnim:update(dt)
end

local function draw(self)
    self.currentAnim:draw(self.x, self.y)
end

function Player.new(x, y)
    local self = {}

    self.x = x
    self.y = y

    self.spriteSheet = SpriteSheet.new(assets.get(SPRITE_IMAGE), 16)
    self.animations = {
        ["idle"] = Animation.new(self.spriteSheet, {1, 2}, 1),
        ["walk"] = Animation.new(self.spriteSheet, {1,2,3,4}, 10),
        ["run"] = Animation.new(self.spriteSheet, {5,6,7,8}, 2),
        ["flash"] = Animation.new(self.spriteSheet, {1, 6}, 3)
    }

    self.currentAnim = self.animations["run"]

    self.update = update
    self.draw = draw

    return self
end

return Player
