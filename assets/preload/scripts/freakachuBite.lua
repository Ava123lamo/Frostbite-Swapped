FreakachuBiteEnabled = false

function onCreatePost()
    setProperty("TyplosDead.visible", false)
    precacheSound("thunderPunch")
end

function onEvent(name, v1, v2)
    if name == "Change Character" then
        if v1 == "dad" then
            if v2 == "deadgold" then
                FreakachuBiteEnabled = true
                setProperty("TyplosDead.visible", true)
            end
        end
    end
end

function onBeatHit()
    randomBite = math.random(1, 30)
    if FreakachuBiteEnabled == true then
        if randomBite == 15 then
            playSound("thunderPunch", 1.5)
            objectPlayAnimation("TyplosDead", "Pain", true)
            runTimer("BFAnim", 0.18)
            setProperty("health", getProperty("health") - 1)
            if getProperty("health") <= 0.01 then
                setProperty("health", 0.01)
            end
        end
    end
end

function onTimerCompleted(tag)
    if tag == "BFAnim" then
        playAnim("boyfriend", "singUPmiss", true)
    end
end