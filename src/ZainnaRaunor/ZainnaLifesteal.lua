-- example of an ability that deals direct damage
ZainnaLifesteal = {}
ZainnaLifesteal.__index = ZainnaLifesteal
setmetatable(ZainnaLifesteal, Ability)

function ZainnaLifesteal:new(user)
    -- true because targetable
    local zainnaLifesteal = Ability:new(false)
    setmetatable(zainnaLifesteal, ZainnaLifesteal)

    -- set x, y, width, height, cooldown (in seconds), and name
    zainnaLifesteal:set(0, 0, 80, 80, 4, 'zainnaheal')

    -- create description text
    zainnaLifesteal.desc = font:printToCanvas('regain damage dealt as health', 189, 38, 'left')

    zainnaLifesteal.character = user

    zainnaLifesteal.damage = 10

    return zainnaLifesteal
end

function ZainnaLifesteal:attach(character)
    Ability.attach(self, character)
end

function ZainnaLifesteal:use(dir)
    if Ability.use(self) then
        local angle = nil
        if self.character.isAI then angle = dir 
        else angle = math.atan2(self.character.sprite.y - mouse.y, self.character.sprite.x - mouse.x) end
        --self.character:addBasicAttack(self.damage, angle, 0.4, 0, 'lifesteal', 0)
        --self.character:addBasicAttack(self.damage, angle, 0.4, 0, 'root', 2)
        local ind = #self.character.basicAttacks + 1
                                           --damage, char, ind, x, y, cooldown, name, speed, angle, delay, effect, effectTimer
        local basicAttack = BasicAttack:new(self.damage, self.character, ind, self.character.sprite.x, self.character.sprite.y, 0.4, 'zainnaheal.sprite', self.character.basicSpeed, angle, 0, 'lifesteal', 1)
        self.character.basicAttacks[ind] = basicAttack
        --self.character:addBasicAttack(self.damage, angle, 0.4, 0)
    end
end