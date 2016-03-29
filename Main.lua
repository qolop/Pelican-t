-- Pelican't
-- ToDo list:
-- *use physics engine to improve collision detection (will require many points for each sprite)
-- *possibly add settings menu where user can change settings
-- *change the bird, make it so wings point upward when going down and vice versa.
-- *make more than one obstacle appear on the screen at once, maybe using tables containing random nums
-- *make a collide function after physics engine is implemented?
-- *change background (environment), not just daytime and nighttime but also reflect nature view
-- *allow user to control the speed of the bird in some way (either through settings panel or touch)

--music("Game Music One:Funk Blue Cube",true,0.7)

function setup()
    displayMode(FULLSCREEN)
    supportedOrientations(LANDSCAPE_ANY)
    -- get current hour to determine if we start at day or night
    hour = tonumber(os.date("%H"))
    -- start screen background color
    if hour >= 18 or hour <= 6 then -- we know it's dark after 6 pm and before 6 am
        bgbrightness = 30
    else
        bgbrightness = 255
    end
    dodged = 0
    distance = 0 --distance is the current score in meters
    count = 0
    gameover = true
    movement = WIDTH
    settingsOpen = false
    highscore = readLocalData("highscore")
    if not highscore then -- if this is their first time playing
        highscore = 0
    end
    settings = Settings()
end

-- This function gets called once every 1/60th of a second; avoid putting lots of things in here other than visual things
function draw()
    -- think of making a var called state so we can have more than 2 vals (to only show last score after you have crashed)
    -- sky blue
    background(0,bgbrightness*.7,bgbrightness)
    -- initiate when user taps and is at start screen
    if gameover ~= true and settingsOpen == false then
        Pelican:draw()
        UFO:draw()
        --we need a better landscape, let's add clouds and make them move (new class possibly)
        movement = movement + UFO.position --creates obstacle animation (UFO.position is around -24)
        distance = distance + .0025 -- this is how much the score goes up every 1/60th of a second
        -- the dark variable controls if our brightness is increasing or decreasing
        if bgbrightness < 50 then
            dark = true
        elseif bgbrightness > 210 then
            dark = false
        end
        if dark == true then
            -- this is the speed of background color change (Mar 3)
            -- full change in about 3.5 seconds with 0.15 +/- value
            bgbrightness = bgbrightness + 1
        else
            bgbrightness = bgbrightness - 1
        end
    --[[elseif gameover == true and CurrentTouch.x >= WIDTH-WIDTH/8-90 and CurrentTouch.x <= WIDTH-WIDTH/8+90 and CurrentTouch.y < WIDTH/8+90 then
        settingsOpen = true
        settings:draw()
    --]]
    elseif settingsOpen == true and gameover == false then
        print("settings has opened")
        settings:draw()
    else
        startScreen()
    end
end

function touched(t)
    -- things to do once user has initiated new game
    if t.state == BEGAN then
        if gameover == true then -- if user tapped and we're at start screen, initiate
            physics.resume()
            distance = 0
            gameover = false
            movement = WIDTH
            Pelican = Bird()
            UFO = Obstacle()
            if hour >= 18 or hour <= 6 then -- we know it's dark between 6 pm and 6 am
                bgbrightness = 30
            else
                bgbrightness = 255
            end
        end
        if t.x >= WIDTH-WIDTH/8 then
            print("settings")
            settings:draw()
        end
    end
end

function collide(c)
    if c.state == BEGAN then
        gameover = true
        print("oops we have a mothafuckin collision")
    end
end

function startScreen()
    textAlign(CENTER)
    pushStyle()
    fontSize(80)
    fill(255, 255, 255, 255)
    font("Futura-Medium")
    text("Pelican't",WIDTH/2,HEIGHT/1.33)
    popStyle()
    pushStyle()
    fontSize(40)
    fill(255, 255, 255, 255)
    font("HelveticaNeue-Light")
    text("Tap to start\n\nYour last score: " .. string.format("%.1f",distance).."m" .. "\nHigh score: " .. string.format("%.1f",highscore) .. "m",WIDTH/2,HEIGHT/2)
    ellipse(WIDTH-WIDTH/8,WIDTH/8,90,90)
    popStyle()
end
