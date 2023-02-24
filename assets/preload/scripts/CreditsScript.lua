TextScale = 36
TextString = "Forced To"
TextString2 = "Mix by:"

function onCreatePost()
    makeLuaSprite("CreditsTagImage", "MixLabel", -700, 10)
    setObjectCamera("CreditsTagImage", "camOther")
    addLuaSprite("CreditsTagImage", true)

    makeLuaText("MixBy", "Mix by:", 300, 0, 50)
    setTextColor("MixBy", "FFFFFF")
    setTextFont("MixBy", "PokemonGB.ttf")
    setTextAlignment("MixBy", "left")
    setObjectCamera("MixBy", "camOther")
    setTextSize("MixBy", 24)
    addLuaText("MixBy", true)

    makeLuaText("Author", "Puppet Master", 550, 0, 100)
    setTextColor("Author", "FFFFFFF")
    setTextFont("Author", "PokemonGB.ttf")
    setTextAlignment("Author", "left")
    setObjectCamera("Author", "camOther")
    addLuaText("Author", true)
    
    setTextBorder("MixBy", 2, "000000")
end

function onCountdownStarted()
    if songName == "Frostbite" then
        TextString2 = "Song by:"
        TextString = "punkett"
    elseif songName == "Frostbite-swap" then
        TextString2 = "Mix by:"
        TextString = "Forced To"
    elseif songName == "Frostbite-swap-alt" then
        TextString2 = "Mix by:"
        TextScale = 17
        TextString = "Puppet Master and IceyDrip"
    end
end

function onSongStart()
    setTextString("Author", TextString)
    setTextString("MixBy", TextString2)
    setTextSize("Author", TextScale)
    doTweenX("CreditsTween", "CreditsTagImage", 0, 0.25, "expoInOut")
    runTimer("FuckYouBitchchch", 3)
end

function onTimerCompleted(tag)
    if tag == "FuckYouBitchchch" then
        doTweenX("CreditsTween", "CreditsTagImage", -700, 0.25, "expoInOut")
    end
end

function onUpdatePost()
    setProperty("MixBy.x", getProperty("CreditsTagImage.x") + 24)
    setProperty("Author.x", getProperty("CreditsTagImage.x") + 50)
end