local xyx2y2 = {580, 450, 540, 450}
local xx = 580;
local yy = 450;
local xx2 = 540;
local yy2 = 450;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;

FreakachuBiteEnabled = false
location = "NormMix"

function onCreatePost()	
    if songName == "Frostbite-swap-alt" then
        location = "AltMix"
    else
        location = "NormMix"
    end

    precacheSound("thunderPunch")

    makeLuaSprite("white", "", 0, 0)
    makeGraphic("white", 1280, 720, "F1EBFA")
    setObjectCamera("white", "camOther")
    addLuaSprite("white")

    makeLuaSprite('bg', 'mountain/bg', -590, -400);
    addLuaSprite('bg',false) 
    scaleObject('bg', 2, 2)

    makeLuaSprite('fog', 'mountain/fog', 0, 0);
    addLuaSprite('fog',true)
    setObjectCamera("fog", "camHud")
    
    makeLuaSprite('Blastoise', 'mountain/' .. location .. '/Blastoise',-560, -10);
    addLuaSprite('Blastoise',false)
    scaleObject('Blastoise', 0.5, 0.5)	
    
    makeLuaSprite('Charizard', 'mountain/' .. location .. '/Charizard',-70, -50);
    addLuaSprite('Charizard',false)
    scaleObject('Charizard', 0.5, 0.5)

    makeLuaSprite('Pokemons', 'mountain/' .. location .. '/Pokemons',220, 130);
    addLuaSprite('Pokemons',false)
    scaleObject('Pokemons', 0.3, 0.3)	

    makeAnimatedLuaSprite("TyplosDead", "typhlosionFixedOffset", 350, 280)
    addAnimationByPrefix("TyplosDead", "Pain", "Freakachu PAIN SPLIT", 24, false)
    addAnimationByPrefix("TyplosDead", "Idle", "Freakachu IDLE", 24, false)
    addLuaSprite("TyplosDead")
    setProperty("TyplosDead.visible", false)
    scaleObject("TyplosDead", 0.7, 0.7)

    makeAnimatedLuaSprite("CharizardAlive", "charizardMech", -60, 550)
    addAnimationByPrefix("CharizardAlive", "flame", "CharFlame", 24, false)
    addAnimationByPrefix("CharizardAlive", "idle", "CharIdle", 24, false)
    addLuaSprite("CharizardAlive", true)
    scaleObject("CharizardAlive", 1.3, 1.3)
end

function onSongStart()
    runTimer("whitedOut", 3)
end

function onStepHit()
    setProperty("health", getProperty("health") - 0.002)
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
			if canZoom == true then
            	doTweenZoom('camz','camGame',0.45,0.040,'sineInOut')
			end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if canZoom == true then
            	doTweenZoom('camz','camGame',0.4,0.040,'sineInOut')
			end
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function onEvent(name, v1, v2)
    if name == "Freakachu Zoom" then
        freakX = 700
        freakY = 600
        if v1 == "Zoom In" then
            doTweenZoom('camz','camGame',2,0.055,'sineInOut')
            setProperty('defaultCamZoom',2)
            ofs = 0
            xx = freakX
            yy = freakY
            xx2 = freakX
            yy2 = freakY
        elseif v1 == "Zoom In 2" then
            doTweenZoom('camz','camGame',2.5,0.040,'sineInOut')
            setProperty('defaultCamZoom',2.5)
            ofs = 0
            xx = freakX + 60
            yy = freakY + 60 
            xx2 = freakX + 60
            yy2 = freakY + 60
        end
        if v1 == "Zoom Out" then
            doTweenZoom('camz','camGame',0.7,0.040,'sineInOut')
            setProperty('defaultCamZoom',0.7)
            xx = xyx2y2[1]
            yy = xyx2y2[2]
            xx2 = xyx2y2[3]
            yy2 = xyx2y2[4]
            ofs = 10
        end
    end
    if name == "Enable Freakachu" then
        if v1 == "yes" then
            FreakachuBiteEnabled = true
            setProperty("TyplosDead.visible", true)
        elseif v1 == "no" then
            FreakachuBiteEnabled = false
        end
    end
end

function onBeatHit()
    randomBite = math.random(1, 30)
    if curBeat % 2 == 0 then
        objectPlayAnimation("TyplosDead", "Idle", false)
    end
    if FreakachuBiteEnabled == true then
        if randomBite == 15 then
            playSound("thunderPunch", 1.5)
            objectPlayAnimation("TyplosDead", "Pain", true)
            setProperty("health", getProperty("health") - 1)
            if getProperty("health") <= 0.01 then
                setProperty("health", 0.01)
            end
        end
    end
end

function onTimerCompleted(tag)
    if tag == "whitedOut" then
        doTweenAlpha("whiteTween", "white", 0, 5, "linear")
    end
end