local lowres = require("lowres")
local assets = require("assets")
local SpriteSheet = require("spriteSheet")
local spriteInfo = require("assets.spriteInfo")

function love.load()
    lowres.init(128, 128, 5)

    assets.load()
    love.graphics.setFont(assets.get("lowresFont"))

    ball_image = assets.get("colored_balls")
    ball_sprites = SpriteSheet.new(ball_image, spriteInfo)
end

function love.update(dt)
end

function love.draw()
    lowres.beginDraw()
    ball_sprites:draw("orange", 0, 0)
    lowres.endDraw()
end