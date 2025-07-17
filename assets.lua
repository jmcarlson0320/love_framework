local assets = {}


local manifest = require("assets.manifest")
local registry = {}

local function fontLoader(manifestEntry)
    local filePath = manifestEntry.filePath
    local size = manifestEntry.size
    return love.graphics.newFont(filePath, size)
end

local function imageLoader(manifestEntry)
    local filePath = manifestEntry.filePath
    return love.graphics.newImage(filePath)
end

local assetLoaders = {
    ["font"] = fontLoader,
    ["image"] = imageLoader,
}

function assets.load()
    for i, entry in ipairs(manifest) do
        local loadFunction = assetLoaders[entry.type]
        registry[entry.name] = loadFunction(entry)
    end
end

function assets.get(assetName)
    return registry[assetName]
end

return assets
