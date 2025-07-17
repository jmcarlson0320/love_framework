local lowres = require("lowres")
local assets = require("assets")
local SpriteSheet = require("spriteSheet")
local Player = require("objects.player")

local Signal = require("signal")

function love.load()
    lowres.init(128, 128, 5)
    assets.load()

    love.graphics.setFont(assets.get("lowresFont"))

    myPlayer = Player.new(100, 100)
end

function love.update(dt)
    myPlayer:update(dt)
end

function love.draw()
    lowres.beginDraw()
    myPlayer:draw()
    lowres.endDraw()
end