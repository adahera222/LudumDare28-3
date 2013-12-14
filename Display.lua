local class = require 'middleclass.middleclass'
require 'Background'

Display = class('Display')
Display.static.background = Background:new()

function Display:draw(entities)
    Display.static.background:draw()

    for key,entity in pairs(entities) do
        entity:draw()
    end
end

return Display
