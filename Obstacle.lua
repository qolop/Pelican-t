--This is the obstacle class. It contains object type, speed, size, and placement

Obstacle = class()

function Obstacle:init()
    -- you can accept and set parameters her
    -- Yes! February 26th, we finally got the object to not pass the screen.
    self.x = WIDTH
    self.y = math.random(HEIGHT/8-50,HEIGHT)
    self.radius = math.random(130,210) -- decent size of obstacle
    self.position = WIDTH+self.radius -- this is what makes the object start at the far right
    self.body = physics.body(CIRCLE, self.radius)
    self.body.position = vec2(self.x, self.y)
    self.body.type = STATIC
    speed = math.random(-27,-20) -- comfortable speed range for units to move each frame
    obstacleList = {readImage("Space Art:UFO"),readImage("Platformer Art:Block Grass"), 
    readImage("Cargo Bot:Crate Yellow 2"),readImage("Platformer Art:Block Brick")}
    theSprite = obstacleList[math.random(1,#obstacleList)]
    self.body.interpolate = true
    self.body.restitution = 1
    self.body.tag = self
end

function Obstacle:draw()
   -- translate(self.body.x,self.body.y)
    --these vars must be in draw function bc the values are in main draw function, constantly change
    self.x = movement
    self.body.x = movement
    self.body.y = self.y
    -- Codea does not automatically call this method
    self.position = speed --this is the SPEED!
    -- this is what repeats the sprites! regenerates when current obj is no longer visible
    if self.x <= 0-self.radius then
        sound(SOUND_PICKUP, 14735)
        dodged = dodged + 1
        self:generateNextObstacle()
        theSprite = obstacleList[math.random(1,#obstacleList)] -- random value in list, enables all sprites in list to be chosen randomly
    end
    self.body.position = vec2(self.body.x, self.body.y)
    sprite(theSprite,self.body.x,self.body.y,self.radius)
end

function Obstacle:touched(touch)
    -- Codea does not automatically call this method
end

function doANewThing()
    print("A new thing was done")
end

function Obstacle:generateNextObstacle()
    UFO = Obstacle()
    doANewThing()
end