cold = 0
coldEnabled = true
allowedPresses = 10

typhlosHalfDiesBigOof = false
typhlosBurst = false
typhlosFuckingDies = false
typhlosDeadAnimTrigger = false

spaceCooldown = false
isTweening = false

function onCreatePost()

    precacheSound("charNoise")
    precacheSound("charizardFuckingDies")

    precacheSound("TyphlosionUse")
    makeLuaSprite("ThermometerBack", "frostbiteMech/barEmpty", 0, 0)
    setObjectCamera("ThermometerBack", "camHud")
    addLuaSprite("ThermometerBack", true)

    makeLuaSprite("ThermometerBar", "frostbiteMech/barFull", 0, 0)
    setObjectCamera("ThermometerBar", "camHud")
    addLuaSprite("ThermometerBar", true)
    
    makeAnimatedLuaSprite("Vit", "frostbiteMech/TyphlosionVit", 23, 98)
    addAnimationByPrefix("Vit", "Burst1", "Typh1", 24, false)
    addAnimationByPrefix("Vit", "Idle1", "Typh2", 24, false)
    addAnimationByPrefix("Vit", "Burst2", "Typh3", 24, false)
    addAnimationByPrefix("Vit", "Idle2", "Typh4", 24, false)
    addAnimationByPrefix("Vit", "Dead", "Typh5", 24, false)
    setObjectCamera("Vit", "hud")
    addLuaSprite("Vit", true)
    objectPlayAnimation("Vit", "Idle1", false)

    makeAnimatedLuaSprite("Thermometer", "frostbiteMech/Thermometer", 20, 150)
    addAnimationByPrefix("Thermometer", "Phase1", "Therm1", 24, false)
    addAnimationByPrefix("Thermometer", "Phase2", "Therm2", 24, false)
    addAnimationByPrefix("Thermometer", "Phase3", "Therm3", 24, false)
    objectPlayAnimation("Thermometer", "Phase1", false)
    setObjectCamera("Thermometer", "hud")
    addLuaSprite("Thermometer", true)

    makeLuaSprite("coldTween", "", 0, 0)
    makeGraphic("coldTween", 1280, 720, "000000")
    setProperty("coldTween.visible", false)
    setObjectCamera("coldTween", "camHud")
    addLuaSprite("coldTween")

    setProperty("ThermometerBack.x", getProperty("Thermometer.x") + 36)
    setProperty("ThermometerBack.y", getProperty("Thermometer.y") + 16)

    setProperty("ThermometerBar.x", getProperty("Thermometer.x") + 36)
    setProperty("ThermometerBar.y", getProperty("Thermometer.y") + 16)
end

function onBeatHit()
    if coldEnabled == true then
        if isTweening == false then
            cold = cold + 0.7
        end
        if cold == 50 or cold >= 50 then
            objectPlayAnimation("Thermometer", "Phase2", true)
        end
        if cold == 75 or cold >= 75 then
            objectPlayAnimation("Thermometer", "Phase3", true)
        end
        if cold == 101 or cold >= 101 then
            setProperty("health", 0)
        end
        if cold <= 25 then
            objectPlayAnimation("Thermometer", "Phase1", true)
        end
    end
    if typhlosBurst == false then
        if typhlosFuckingDies == false then
            if curBeat % 2 == 0 then
                objectPlayAnimation("CharizardAlive", "idle", false)
                if typhlosHalfDiesBigOof == true then
                    objectPlayAnimation("Vit", "Idle2", false)
                end
                if typhlosHalfDiesBigOof == false then
                    objectPlayAnimation("Vit", "Idle1", false)
                end
            end
        end
    end
end

function onUpdatePost()
    coldScale = cold/100
    coldMovement = 324-(coldScale*324)

    if isTweening == true then
        cold = getProperty("coldTween.x")
    elseif isTweening == false then
        setProperty("coldTween.x", cold)
    end

    scaleObject("ThermometerBar", 1, coldScale)
    if allowedPresses >= 0 then
        if spaceCooldown == false then
            if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') then
                isTweening = true
                typhlosBurst = true
                spaceCooldown = true
                playSound("TyphlosionUse", 1.5)
                runTimer("cooldownTimer", 1)
                doTweenX("coldTweenTween", "coldTween", cold -45, 0.25, "linear")
                if typhlosFuckingDies == false then
                playSound("charNoise", 1.5)
                objectPlayAnimation("CharizardAlive", "flame", false)
                    if typhlosHalfDiesBigOof == true then
                        objectPlayAnimation("Vit", "Burst2", false)
                    end
                    if typhlosHalfDiesBigOof == false then
                        objectPlayAnimation("Vit", "Burst1", false)
                    end
                end
                allowedPresses = allowedPresses - 1
                if allowedPresses == 5 then
                    typhlosHalfDiesBigOof = true
                end
                if allowedPresses == 0 then
                    typhlosFuckingDies = true
                end
            end
        end
    end

    setProperty("ThermometerBar.y", (getProperty("Thermometer.y") + 16) + coldMovement)

    if cold <= -0.001 then
        cold = 0
    end

    if typhlosFuckingDies == true then
        if typhlosDeadAnimTrigger == false then
            objectPlayAnimation("Vit", "Dead", false)
            typhlosDeadAnimTrigger = true
            doTweenY("typhlosTween", "CharizardAlive", 1000, 2, "expoInOut")
            playSound("charizardFuckingDies", 1.5)
        end
    end
end

function onEvent(tag)
    if tag == "Play Roar (Frostbite)" then
        objectPlayAnimation("CharizardAlive", "flame", false)
        typhlosBurst = true
        runTimer("EventTimer", 1)
    end
end

function onTweenCompleted(tag)
    if tag == "coldTweenTween" then
        isTweening = false
    end
end

function onTimerCompleted(tag)
    if tag == "cooldownTimer" then
        spaceCooldown = false
        typhlosBurst = false
    end
    if tag == "EventTimer" then
        typhlosBurst = false
    end
end
        
    