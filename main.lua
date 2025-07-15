local lowres = require("lowres")
local assets = require("assets")
local assetData = require("assets.manifest")
local spriteSheet = require("spriteSheet")
local scene = require("scenes.scene")
local gameScene = require("scenes.gameScene")

function love.load()
    sprId = 1

    assets.load(assetData)
    lowres.init(128, 128, 5)

    love.graphics.setFont(assets["lowresFont"])
    mySprites = spriteSheet.new(assets["mySprites"], 16)

    scene.switch(gameScene)
end

function love.update(dt)
    scene.update(dt)
end

function love.draw()
    lowres.beginDraw()

    scene.draw()
    mySprites:draw(sprId, 64, 64)

    lowres.endDraw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        sprId = sprId + 1
    end
end