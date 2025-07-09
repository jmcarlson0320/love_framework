local assets = {}

function assets.load()
    assets.lowresFont = love.graphics.newFont("assets/font.ttf", 8)
    assets.sprites = love.graphics.newImage("assets/sprites.png")
end

return assets