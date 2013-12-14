local class = require 'middleclass.middleclass'

Entity = class('entity.Entity')
Entity.x = 0
Entity.y = 0
Entity.width = 0
Entity.height = 0
Entity.sprite = nil
Entity.visible = true
Entity.hitbox = nil
Entity.dead = false
Entity.angle = 0
Entity.dx = 0
Entity.dy = 0
Entity.collider = nil

function Entity:initialize(x, y, sprite, collider)
    self.x = x
    self.y = y
    self.width = sprite:getWidth()
    self.height = sprite:getHeight()
    self.sprite = sprite

    self.collider = collider
    self.hitbox = collider:addRectangle(self:top(),
                                        self:left(),
                                        self.width,
                                        self.height)
end

function Entity:left()
    return self.x - self.width/2
end

function Entity:top()
    return self.y - self.height/2
end

function Entity:rotate(angle)
    self.angle = angle
    self.hitbox:setRotation(angle)
end

function Entity:draw()
    if self.visible then
        love.graphics.draw(self.sprite, self.x, self.y, self.angle, 1, 1, self.width/2, self.height/2)
    end
end

function Entity:tick()
    self:move(self.x + self.dx,
              self.y + self.dy)
end

function Entity:move(x, y)
    self.x = x
    self.y = y
    self.hitbox:moveTo(x, y)
end

function Entity:hit(other, dx, dy)

end

function Entity:startLeft()
end

function Entity:startRight()
end

function Entity:stop()
    self.dx = 0
    self.dy = 0
end
