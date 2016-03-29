Bird = class()

function Bird:init()
    -- you can accept and set parameters here
    self.x = WIDTH/8
    self.y = y
    self.pos = x, y
end

function Bird:draw()
    self:touched()
    pushStyle()
    -- Codea does not automatically call this method
    fill(59, 64, 88, 255)
    font("Vegur-Bold")
    text("Avoid the obstacles.\nScore: " .. string.format("%.1f",distance) .. "m",WIDTH/2,600)
    sprite("Documents:Swag pelicN",WIDTH/8,CurrentTouch.y)
    popStyle()
    self:isColliding()
end

function Bird:isColliding()
    -- traditional collision detection between Bird and UFO
    -- should be improved without using too many lines of code
    -- use physics bodies, find out how to incorporate them into the current touch and draw functions with constantly changing vars
    if CurrentTouch.y >= UFO.y - UFO.radius and CurrentTouch.y <= UFO.y+UFO.radius and movement > WIDTH/8-UFO.radius and movement < WIDTH/8+UFO.radius then
        self:restart()
        if distance > highscore then
            highscore = distance
            saveLocalData("highscore", highscore)
        end
        -- tbh i forgot what return does but ya knownwhy not include it
        return true
    end
end

function Bird:touched(touch)
    -- Codea does not automatically call this method
end

function Bird:restart()
    gameover = true
end
