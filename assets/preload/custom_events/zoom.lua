function onEvent(name, value1, value2)
	if name == 'zoom' then
		zoomamount = value1;
		zoomrotate = value2;
        setProperty('defaultCamZoom',zoomamount)
		doTweenAngle('camRotate', "camGame", zoomrotate, 0.3, "expoInOut")
	end
end