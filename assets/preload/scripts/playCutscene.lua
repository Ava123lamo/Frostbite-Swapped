playVideo = true;
playDialogue = true;

function onEndSong()
	if playVideo then --Video cutscene plays first
		startVideo('whatdehell'); --Play video file from "videos/" folder
		playVideo = false;
		return Function_Stop; --Prevents the song from starting naturally
	end
	return Function_Continue; --Played video and dialogue, now the song can start normally
end