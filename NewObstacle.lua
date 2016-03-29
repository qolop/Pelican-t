NewObstacle = class()

function NewObstacle:init()
    -- you can accept and set parameters here
    self.x = x
end

function NewObstacle:draw()
    -- Codea does not automatically call this method
end

-- this was more or less copied from the Cloud Jump game which is provided in the demos.
function generateNextObstacle()
    UFO = Obstacle()
    UFO.x = WIDTH
end

function NewObstacle:touched(touch)
    -- Codea does not automatically call this method
end
