local assets = {}

local registry = {}

--[[
    Function: fontLoader
    Scope: Private Helper Function
    Description: Loads an asset of type "font" given a manifest entry of type "font".
    Parameters:
        manifestEntry (table) - The manifest entry representing an asset of type "font".
    Returns:
        font (love2d Font) - The love2d Font object
]]
local function fontLoader(manifestEntry)
    local filePath = manifestEntry.filePath
    local size = manifestEntry.size
    return love.graphics.newFont(filePath, size)
end

--[[
    Function: imageLoader
    Scope: Private Helper Function
    Description: Loads an asset of type "image" given a manifest entry of type "image".
    Parameters:
        manifestEntry (table) - The manifest entry representing an asset of type "image".
    Returns:
        image (love2d Image) - The love2d Image object
]]
local function imageLoader(manifestEntry)
    local filePath = manifestEntry.filePath
    return love.graphics.newImage(filePath)
end

local assetLoaders = {
    ["font"] = fontLoader,
    ["image"] = imageLoader,
}

--[[
    Function: assets.load
    Scope: Public API Function
    Description: Loads the assets described in a given manifest. Once loaded, assets are available in the top-level
                 module table by using: assets["name"].
    Parameters:
        manifest (table) - The manifest table containing asset information. Each entry describes a single asset and
                           contains at least the asset name, type, and filePath.
    Returns:
        N/A
]]
function assets.load(manifest)
    for i, entry in ipairs(manifest) do
        local loadFunction = assetLoaders[entry.type]
        registry[entry.name] = loadFunction(entry)
    end
end

function assets.get(assetName)
    return registry[assetName]
end

return assets
