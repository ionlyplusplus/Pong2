
Class = require 'class'
push = require 'push'
require 'objects/paddle'

Window_width = 640
Window_height = 360

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243
PADDLE_SPEED = 200


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, Window_width, Window_height, {
            fullscreen = false,
            resizable = false,
            vsync = true
        }
    )
    math.randomseed(os.time())
    P1 = Paddle( 5 ,VIRTUAL_HEIGHT / 2 - 10, 5, 20)
    P2 = Paddle( VIRTUAL_WIDTH - 10 ,VIRTUAL_HEIGHT / 2 - 10, 5, 20)
    gamestate = 'start'
end


function love.update(dt)
    if love.keyboard.isDown('w') then
        P1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        P1.dy = PADDLE_SPEED
    else
        P1.dy = 0
    end

    if love.keyboard.isDown('up') then
        P2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('down') then
        P2.dy = PADDLE_SPEED
    else
        P2.dy = 0
    end
    if gamestate == 'play' then
        B1:update(dt)
    end
    
    P1:update(dt)
    P2:update(dt)

end

function love.draw()
    
    push:apply('start')
    love.graphics.clear(r, g, b, a)
    love.graphics.printf( 'hello word', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    P1:draw()
    P2:draw()
    push:apply('end')
end


function love.keypressed(key)
    if (key == 'escape') then
        love.event.quit()
    end
end