RomeroKao = {}
RomeroKao.__index = RomeroKao
setmetatable(RomeroKao, Character)

function RomeroKao:new()
    local romeroKao = Character:new()
    setmetatable(romeroKao, RomeroKao)

    -- icon image
    romeroKao.icon = love.graphics.newImage('img/RomeroKao.icon.png')

    -- max and current health
    romeroKao.maxHealth = 100
    romeroKao.curHealth = 100

    romeroKao.backstory = font:printToCanvas('a powerful warrior who deals blistering damage.', 189, 38, 'left')

    -- set move speed
    romeroKao.speed = 2

    -- basic attack stats
    romeroKao.basicSpeed = 8
    romeroKao.basicName = 'basic.sprite' 
    romeroKao.basicCooldown = 1

    -- basic attack cooldown
    romeroKao.attackTimerMax = 0.5
    romeroKao.attackTimer = romeroKao.attackTimerMax

    -- set sprite location, size, and name for image file
    romeroKao.sprite:set(500, 250, 16, 16, 'RomeroKao')

    -- set name
    romeroKao.textName = 'Romero Kao'
    romeroKao.name = font:printToCanvas('Romero Kao', 160, 10, 'center')

    -- initialize ability table
    romeroKao.abilities = {}
    
    -- add ability
    romeroKao:addAbility(RomeroScatterShot:new())
    romeroKao:addAbility(RomeroRapidAttack:new())
    romeroKao:addAbility(RomeroAOE:new())
    -- romeroKao:addAbility(AbilityExamplePassive:new())

    -- finish adding abilities
    romeroKao:endAbility()

    return romeroKao
end

function RomeroKao:update()
    Character.update(self)
end