local class = require 'middleclass.middleclass'
require 'entity.Mob'
require 'entity.EnemyBullet'
require 'utils'

Enemy = class('entity.Enemy', Mob)
Enemy.static.sprite = love.graphics.newImage("assets/character-3.png")
Enemy.static.speed = 5
Enemy.health = 5
Enemy.internalTick = 0
Enemy.behaviour = {}

function Enemy:initialize(id, x, y, behaviour, collider)
   Entity.initialize(self, id, x, y, self.class.sprite, collider)
   self.internalTick = 0
   self.behaviour = behaviour
   self.bullets = {}
   
   self:startLeft()
end


function Enemy:tick(state, collider)
    self.internalTick = self.internalTick + 1
    
    
    if (self.internalTick % 4) == 0 then 
        selectBehaviour = (self.internalTick / 4) % 100
        
        if (self.behaviour[selectBehaviour] == 1 or self.behaviour[selectBehaviour] == 2 or self.behaviour[selectBehaviour] == 3) then
            self:startLeft()
            elseif (self.behaviour[selectBehaviour] == 4) then
                self:startRight()
            elseif (self.behaviour[selectBehaviour] == 5 or self.behaviour[selectBehaviour] == 6 or self.behaviour[selectBehaviour] == 7) then
                self:jump()
            end
    end
    
    if (self.internalTick % 8) == 0 then --Shoot
        local aBullet = EnemyBullet:new(uniqueId(),self.x,self.y,collider,self.orientation)
        table.insert(state ,aBullet)
    end
    
    Mob.tick(self)
    
end

