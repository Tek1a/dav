push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

player_x=0
player_y=0
speed=80
num=0
function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync= true

    })
    big_font = love.graphics.newFont('font.ttf', 36)
    love.graphics.setFont(big_font)

end

function love.keypressed(key)
    if key == 'q' then
        love.event.quit()
    end
    if key == 'space' then
        num=num+1
    end
end

function love.update(dt)
    if love.keyboard.isDown('d') then
        player_x = math.min( VIRTUAL_WIDTH-40, player_x + speed * dt )
        
    end
    if love.keyboard.isDown('a') then
        player_x = math.max (0, player_x - speed * dt )
    end

    if love.keyboard.isDown('w') then
        player_y = math.max( 0, player_y - speed * dt) 
    end

    if love.keyboard.isDown('s') then
        player_y = math.min( VIRTUAL_HEIGHT-40, player_y + speed * dt) 
    end
end

function love.draw()
    push:apply('start')
    love.graphics.clear(100/255, 0/255, 200/255, 255/255)

    love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
    love.graphics.printf(
        num,
        0,
        VIRTUAL_HEIGHT/2,
        VIRTUAL_WIDTH,
        'center'
)
   
    
    love.graphics.rectangle('fill', player_x, player_y, 40, 40)
    push:apply('end')
end
