local lowres = require("lowres")
local assets = require("assets")
local SpriteSheet = require("spriteSheet")
local Player = require("objects.player")

local Signal = require("signal")

Q_SIGNAL = Signal.new()

function love.load()
    lowres.init(128, 128, 5)
    assets.load()

    love.graphics.setFont(assets.get("lowresFont"))

    myPlayer = Player.new(56, 0)
    Q_SIGNAL:connect(myPlayer, "on_q_signal")

    anither = Player.new(10,10)

end

function love.update(dt)
    myPlayer:update(dt)
    anither:update(dt)
end

function love.draw()
    lowres.beginDraw()
    myPlayer:draw()
    anither:draw()
    lowres.endDraw()
end

function love.keypressed(key, scancode, isrepeat)
    Q_SIGNAL:emit()
end
