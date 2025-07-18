local Player = {}

local assets = require("assets")
local SpriteSheet = require("spriteSheet")
local Animation = require("animation")

local SPRITE_IMAGE = "dungeon_monsters"

local ANIM_INFO = {
    walk = {
        frames = {1, 2},
        fps = 1,
    },

    idle = {
        frames = {1, 2, 3, 4},
        fps = 10,
    },

    run = {
        frames = {5, 6, 7, 8},
        fps = 2,
    },
}

local function update(self, dt)
    self.currentAnim:update(dt)
end

local function draw(self)
    self.currentAnim:draw(self.x, self.y)
end

local function changeAnimation(self, animation)
    local nextAnim = self.animations[animation]
    if not nextAnim then
        return
    end

    self.currentAnim = nextAnim
    self.currentAnim:reset()
end

local function on_q_signal(self)
    self:changeAnimation("walk")
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

    -- methods
    self.update = update
    self.draw = draw
    self.changeAnimation = changeAnimation
    self.on_q_signal = on_q_signal

    return self
end

return Player
