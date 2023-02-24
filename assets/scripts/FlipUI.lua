function onUpdatePost()
    p1Mult = getProperty("healthBar.x") + ((getProperty("healthBar.width") * getProperty("healthBar.percent") * 0.01) + (150 * getProperty("iconP1.scale.x", true) - 150) / 2 - 26)
    p2Mult = getProperty("healthBar.x") + ((getProperty("healthBar.width") * getProperty("healthBar.percent") * 0.01) + (150 * getProperty("iconP2.scale.x", true)) / 2 - 26 * 2)

    scaleObject("healthBar", -1, 1)
    setProperty("iconP1.x", p1Mult -110)
    setProperty("iconP2.x", p2Mult -45)
    setProperty("iconP1.origin.x", 140)
    setProperty("iconP2.origin.x", 140)
    setProperty("iconP1.flipX", true)
    setProperty("iconP2.flipX", true)
    setProperty("animatedicon.flipX", true)
    setProperty("animatedicon2.flipX", true)

    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
        for i = -2, 11 do
            local key = (i % 4)
            local name = i > 3 and "defaultOpponentStrum" or "defaultPlayerStrum"
            
            setPropertyFromGroup("strumLineNotes", i, "x", _G[name .. "X" .. key])
        end
    end
end