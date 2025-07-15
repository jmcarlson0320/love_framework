local lowres = require("lowres")
local scene = require("scenes.scene")
local gameScene = require("scenes.gameScene")
local assets = require("assets")
local assetData = require("assets.manifest")
local spriteSheet = require("spriteSheet")

function love.load()
    lowres.init(128, 128, 5)

    assets.load(assetData)
    love.graphics.setFont(assets["lowresFont"])
    sprites = spriteSheet.new(assets["mySprites"], 16)

    scene.switch(gameScene)

    sprId = 1
end

function love.update(dt)
    scene.update(dt)
end

function love.draw()
    lowres.beginDraw()
    scene.draw()
    sprites:draw(sprId, 64, 64)
    lowres.endDraw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        sprId = sprId + 1
    end
end