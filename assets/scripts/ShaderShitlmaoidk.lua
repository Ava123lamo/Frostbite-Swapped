--That Code is stolen from somewhere EAT SHIT

function onUpdate(elapsed)
    setShaderFloat('ShaderCont','time',getShaderFloat('ShaderCont','time')+0.01)
 
end
function onCreate()
    AmountSnow=100
    makeLuaSprite("ShaderCont")

  


if shadersEnabled then
    initLuaShader('snowfall',150)
    local Shader='snowfall'
    runHaxeCode([[
        var shaderName = "]]..Shader..[[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        //game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("ShaderCont").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        
        
        shader0.setFloat('intensity', 0.2);
        shader0.setInt('amount', 100);
        shader0.setFloat('time', 1);
    ]])
    if lowQuality then
        d=2
    else
        d=1
    end
end
   

    runHaxeCode([[
   Application.current.window.title="]]..songName..'-'..Dificulty(difficulty)..[[";
   ]])
    
end
function onEvent(tag,v1,v2)
if tag =='SnowFall_amount' then
   setShaderInt('ShaderCont','amount',tonumber(v1)/d)
   AmountSnow=tonumber(v1)
  

end
if tag =='SnowFall_intensity' then
    
   setShaderFloat('ShaderCont','intensity',tonumber(v1))
end
--130.435=stepCrochet
end
function onTimerCompleted(tag, loops, loopsLeft)
  
end
function onDestroy()
    runHaxeCode([[
        Application.current.window.title="Friday Night Funkin': Psych Engine";
        ]])
end


