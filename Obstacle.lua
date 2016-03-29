Obstacle = class()

-- find a way to automatically call a new object every x seconds

function Obstacle:init()
    -- you can accept and set parameters her
    -- Yes! February 26th, we finally got the object to not pass the screen.
    self.y = math.random(10,HEIGHT)
    self.position = vec2(0,0)
    self.velocity = WIDTH -- this is what makes the object start at the far right
    self.radius = math.random(100,250) -- decent size of UFO
    speed = math.random(-20,-10) -- comfortable speed range
end

function Obstacle:draw()
    self.x = movement
    -- Codea does not automatically call this method
    self.velocity = speed --this is the SPEED!
    -- this is what repeats the sprites! regenerates at 50px
    if self.x < 50 then
        generateNextObstacle()
    end
    sprite("Space Art:UFO",movement,self.y,self.radius)
end

function Obstacle:sendNewObject()
    self.y = math.random(30,HEIGHT) -- the new object originates from a random point on the y scale from the far rigt of the screen
end

function Obstacle:touched(touch)
    -- Codea does not automatically call this method
end
