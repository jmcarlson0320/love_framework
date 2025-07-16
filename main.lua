local lowres = require("lowres")
local assets = require("assets")
local assetData = require("assets.manifest")
local spriteSheet = require("spriteSheet")
local spriteInfo = require("spriteInfo")
local scene = require("scenes.scene")
local gameScene = require("scenes.gameScene")

function love.load()
    sprId = 1

    assets.load(assetData)
    lowres.init(128, 128, 5)

    love.graphics.setFont(assets.get("lowresFont"))
    mySpriteSheet = spriteSheet.new(assets.get("mySprites"), spriteInfo)

    scene.switch(gameScene)
end

function love.update(dt)
    scene.update(dt)
end

function love.draw()
    lowres.beginDraw()

    scene.draw()

    lowres.endDraw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        sprId = sprId + 1
    end
end
