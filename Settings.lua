Settings = class()

-- we need to think about how we can make the settings panel be on top of the other text. perhaps we may need to 
function Settings:init()
    -- you can accept and set parameters here
    print("settings initialized")
end

function Settings:draw()
    background(255, 0, 0, 255)
    -- Codea does not automatically call this method
    rect(WIDTH/3,HEIGHT/4,400,400)
    pushStyle()
    fill(0)
    fontSize(30)
    font("GillSans")
    text("you dont know me b",WIDTH/2,HEIGHT/2)
    popStyle()
end

function Settings:touched(touch)
    -- Codea does not automatically call this method
end