-- Flight
-- Use this function to perform your initial setup
function setup()
    displayMode(FULLSCREEN)
    supportedOrientations(LANDSCAPE_ANY)
    distance = 0 --distance is the current score in meters
    gameover = true
    movement = WIDTH
    print("Welcome to Pelican't, an app where you try to avoid the obstacles that fly in your way.")
    highscore = readLocalData("highscore")
    if not highscore then -- if this is their first time playing
        highscore = 0
    end
    Pelican = Bird()
    UFO = Obstacle()
end

-- This function gets called once every frame
function draw()
    background(178, 214, 215, 255)
    if gameover ~= true then
        pushStyle()
        Pelican:draw()
        UFO:draw()
        fill(0)
        --we need a better landscape, let's add clouds and make them move (new class possibly)
        movement = movement + UFO.velocity --essentially the speed
        distance = distance + .00250 -- makes distance travelled more dependent on movement
        popStyle()
    else
        fill(30, 38, 68, 255)
        font("Vegur")
        fontSize(50)
        textAlign(LEFT)
        text("Tap to start\n\nYour last score: " .. string.format("%.1f",distance).."m" .. "\nHigh score: " .. string.format("%.1f",highscore) .. "m",WIDTH/2,HEIGHT/1.5)
        movement = WIDTH
    end
end

function touched(t)
    -- restart the game
    if t.state == BEGAN and gameover == true then
        distance = 0
        gameover = false
    end
end
