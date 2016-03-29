Bird = class()

function Bird:init()
    -- you can accept and set parameters here
    -- here we should start the physics engine parameters
    self.body = physics.body(CIRCLE, 200)
    self.body.interpolate = true
    self.body.x = WIDTH/8
    self.body.y = CurrentTouch.y
    --self.speed = speed
    --self.frames = {"Platformer Art:Battor Flap 1", "Platformer Art:Battor Flap 2", "Platformer Art:Battor Dead"} -- these are the bird states drawn, accessed via animFrame I believe
    self.body.tag = self
    self.body.type = STATIC
    self.body.restitution = 1
end

function Bird:draw()
    pushStyle()
    --translate(self.body.x,self.body.y)
    -- Codea does not automatically call this method
    font("HelveticaNeue-Light")
    fontSize(30)
    fill(255, 255, 255, 255)
    text("Avoid the obstacles.\nScore: " .. string.format("%.1f",distance) .. "m\nYou've dodged "..dodged.." obstacles.",WIDTH/2,HEIGHT/1.33)
    sprite("Documents:Swag pelicN",WIDTH/8,CurrentTouch.y,200)
    popStyle()
    self:isColliding()
end

function Bird:isColliding()
    -- traditional collision detection between Bird and UFO
    -- should be improved without using too many lines of code
    -- use physics bodies, find out how to incorporate them into the current touch and draw functions with constantly changing vars
    self.body.y = CurrentTouch.y
    if CurrentTouch.y >= UFO.y - UFO.radius and CurrentTouch.y <= UFO.y+UFO.radius and movement > WIDTH/8-UFO.radius and movement < WIDTH/8+UFO.radius then
        self:restart()
    end
end

function Bird:touched(touch)
    -- Codea does not automatically call this method
end

function Bird:restart()
    sound(SOUND_EXPLODE, 14750, 1)
    dodged = 0
    physics.pause() -- disable physics detection at start screen
    gameover = true
    if distance > highscore then
        highscore = distance
        saveLocalData("highscore", highscore)
    end
end