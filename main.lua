--sam owes me a tab
function love.load()
    -- load in utility modules
    font = Font:new()
    timer = Timer:new()

    -- set fps to 60
    timer:setFps(60)

    -- set true pixel scaling
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- create window
    scale = 1.5
    width = 1200
    height = 600
    love.window.setMode(width * scale, height * scale, {vsync = false, fullscreen = false})

    -- create game canvas
    canvas = love.graphics.newCanvas(width * scale, height * scale)

    -- create state management variable
    state = {}
    -- class level state, e.g. battle.lua or select.lua
    state.parent = 'select'
    -- substates within a class
    state.child = 'main'

    -- initialize list of possible states
    stateList = {}
    stateList['select'] = Select:new()
    -- stateList['battle'] = Battle:new()

    -- mouse variable
    mouse = {}
    mouse.clicked = false
    mouse.x = 0
    mouse.y = 0
    mouse.img = love.graphics.newImage('img/mouse.png')
    -- love.mouse.setVisible(false)
end

function love.update()
    -- start timer
    timer:start()

    -- get mouse coords
    mouse.x = love.mouse.getX() / scale
    mouse.y = love.mouse.getY() / scale

    -- update current state
    stateList[state.parent]:update()

    -- end timer, limiting to 60fps
    timer:finish()
end

function love.draw()
    -- set canvas
    love.graphics.setCanvas(canvas)
        -- clear game canvas
        love.graphics.clear()
        -- draw current state
        stateList[state.parent]:draw()
    love.graphics.setCanvas()
    
    -- draw game canvas at scale
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)

    -- love.graphics.draw(mouse.img, love.mouse.getX(), love.mouse.getY(), 0, scale)
end

function love.keypressed(key)
    -- check for escape
    if key == 'escape' then
        love.event.push('quit')
    end
end