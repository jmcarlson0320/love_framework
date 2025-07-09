local lowres = require("lowres")
local scene = require("scenes.scene")
local gameScene = require("scenes.gameScene")
local assets = require("assets")

function love.load()
    lowres.init(128, 128, 5)
    assets.load()
    love.graphics.setFont(assets.lowresFont)
    scene.switch(gameScene)
end

function love.update(dt)
    scene.update(dt)
end

function love.draw()
    lowres.beginDraw()
    love.graphics.draw(assets.sprites,0,0)
    scene.draw()
    lowres.endDraw()
end
