local scene = {}

local currentScene = nil

function scene.switch(newScene)
    currentScene = newScene
    if currentScene.load then
        currentScene.load()
    end
end

function scene.update(dt)
    if currentScene and currentScene.update then
        currentScene.update()
    end
end

function scene.draw()
    if currentScene and currentScene.draw then
        currentScene.draw()
    end
end

return scene