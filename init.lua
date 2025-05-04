-- https://github.com/FaithfulAC/universal-stuff/blob/main/safehookmetamethod.lua
do
    -- basically a lua implementation of arg guard (which every executor should have by default rn but GUESS NOT!)

    local options = shmmoptions or safehookmetamethodoptions or {
        Namecall = true,
        Index = true,
        Newindex = true
    }

    local hmm = hookmetamethod -- hmmmmmmmmmmmmmmmm
    local cclosure = newcclosure

    local KeepOriginalHookMetaMethod = getgenv().KeepHMM or getgenv().KeepHookmetamethod or false

    --[[local LoadCStackOverflowBypass = false

    if LoadCStackOverflowBypass then -- checking if c stack overflow bypass was already initiated
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/main/c-stack-overflow-universal-bypass.lua"))()
    end]]

    local __namecall, __index, __newindex =
        clonefunction(getrawmetatable(game).__namecall),
        clonefunction(getrawmetatable(game).__index),
        clonefunction(getrawmetatable(game).__newindex)

    local isSafeIndex = function(arg)
        return (typeof(arg) == "string" and string.split(arg, "\0")[2] == nil) -- run safehookmetamethod if you want to hook index a property, not an instance!!!
    end

    local sNamecall, sIndex, sNewindex = 
        function(...)
            
            local args = {...}
            local self = args[1]
            
            if typeof(self) == "Instance" and select("#", ...) > 0 and select("#", ...) < 8000 then return true end
            return false
            
        end, function(...)
        
        local args = {...}
        local self = args[1]
        
        if typeof(self) == "Instance" and (isSafeIndex(args[2]) or typeof(args[2]) == "number") and select("#", ...) >= 2 and select("#", ...) < 8000 then return true end
        return false
        
    end, function(...)
        
        local args = {...}
        local self = args[1]
        
        if typeof(self) == "Instance" and isSafeIndex(args[2]) and select("#", ...) >= 3 and select("#", ...) < 8000 then return true end
        return false
        
    end

    local __oldnamecall, __oldindex, __oldnewindex = __namecall, __index, __newindex;

    if options.Namecall then
        hmm(game,"__namecall", function(...)
            local args = {...}
            if not sNamecall(...) then return __oldnamecall(...) end
        
            return __namecall(...)
        end)
    end

    if options.Index then
        hmm(game,"__index", function(...)
            local args = {...}
            if not sIndex(...) then return __oldindex(...) end
        
            return __index(...)
        end)
    end

    if options.Newindex then
        hmm(game,"__newindex", function(...)
            local args = {...}
            if not sNewindex(...) then return __oldnewindex(...) end
        
            return __newindex(...)
        end)
    end
        
    getgenv().safehookmetamethod = newcclosure(function(...)
        local obj, method, fnc = ...
        if typeof(obj) ~= "Instance" then return hmm(...) end -- object is not an Instance therefore is not supported
        
        if method == "__namecall" then
            local orgnm = __namecall
            __namecall = cclosure(fnc)
            
            return orgnm
            
        elseif method == "__index" then
            local orgi = __index
            __index = cclosure(fnc)
            
            return orgi
            
        elseif method == "__newindex" then
            local orgni = __newindex
            __newindex = cclosure(fnc)
            
            return orgni
            
        end
        
        return hmm(...)
    end)

    if not KeepOriginalHookMetaMethod then getgenv().hookmetamethod = safehookmetamethod end
end

-- https://raw.githubusercontent.com/FaithfulAC/RBLX_Scripts/refs/heads/main/Universal/Bypasses.lua
do
    -- GCInfo/CollectGarbage Bypass (Realistic by Lego - Amazing work!)
    task.spawn(function()
        repeat task.wait() until game:IsLoaded()

        local Amplitude = 200
        local RandomValue = {-200,200}
        local RandomTime = {.1, 1}

        local floor = math.floor
        local cos = math.cos
        local sin = math.sin
        local acos = math.acos
        local pi = math.pi

        local Maxima = 0

        --Waiting for gcinfo to decrease
        while task.wait() do
            if gcinfo() >= Maxima then
                Maxima = gcinfo()
            else
                break
            end
        end

        task.wait(0.30)

        local OldGcInfo = gcinfo()+Amplitude
        local tick = 0

        --Spoofing gcinfo
        local function getreturn()
            local Formula = ((acos(cos(pi * (tick)))/pi * (Amplitude * 2)) + -Amplitude )
            return floor(OldGcInfo + Formula);
        end

        local Old; Old = hookfunction(getrenv().gcinfo, function(...)
            return getreturn();
        end)
        local Old2; Old2 = hookfunction(getrenv().collectgarbage, function(arg, ...)
            local suc, err = pcall(Old2, arg, ...)
            if suc and arg == "count" then
                return getreturn();
            end
            return Old2(arg, ...);
        end)


        game:GetService("RunService").Stepped:Connect(function()
            local Formula = ((acos(cos(pi * (tick)))/pi * (Amplitude * 2)) + -Amplitude )
            if Formula > ((acos(cos(pi * (tick)+.01))/pi * (Amplitude * 2)) + -Amplitude ) then
                tick = tick + .07
            else
                tick = tick + 0.01
            end
        end)

        local old1 = Amplitude
        for i,v in next, RandomTime do
            RandomTime[i] = v * 10000
        end

        local RandomTimeValue = math.random(RandomTime[1],RandomTime[2])/10000

        --I can make it 0.003 seconds faster, yea, sure
        while wait(RandomTime) do
            Amplitude = math.random(old1+RandomValue[1], old1+RandomValue[2])
            RandomTimeValue = math.random(RandomTime[1],RandomTime[2])/10000
        end
    end)

    -- Memory Bypass
    task.spawn(function()
        repeat task.wait() until game:IsLoaded()

        local RunService = cloneref(game:GetService("RunService"))
        local Stats = cloneref(game:GetService("Stats"))

        local CurrMem = Stats:GetTotalMemoryUsageMb();
        local Rand = 0

        RunService.Stepped:Connect(function()
            local random = Random.new()
            Rand = random:NextNumber(-10, 10);
        end)

        local function GetReturn()
            return CurrMem + Rand;
        end

        local _MemBypass
        _MemBypass = hookmetamethod(game, "__namecall", function(self,...)
            local method = getnamecallmethod();

            if not checkcaller() then
                if typeof(self) == "Instance" and (method == "GetTotalMemoryUsageMb" or method == "getTotalMemoryUsageMb") and self.ClassName == "Stats" then
                    return GetReturn();
                end
            end

            return _MemBypass(self,...)
        end)

        -- Indexed Versions
        local _MemBypassIndex; _MemBypassIndex = hookfunction(Stats.GetTotalMemoryUsageMb, function(self, ...)
            if not checkcaller() then
                if typeof(self) == "Instance" and self.ClassName == "Stats" then
                    return GetReturn();
                end
            end
        end)
    end)

    -- Memory Bypass X2 (Newer Method / Func)
    task.spawn(function()
        repeat task.wait() until game:IsLoaded()

        local RunService = cloneref(game:GetService("RunService"))
        local Stats = cloneref(game:GetService("Stats"))

        local CurrMem = Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui);
        local Rand = 0

        RunService.Stepped:Connect(function()
            local random = Random.new()
            Rand = random:NextNumber(-0.1, 0.1);
        end)

        local function GetReturn()
            return CurrMem + Rand;
        end

        local _MemBypass
        _MemBypass = hookmetamethod(game, "__namecall", function(self,...)
            local method = getnamecallmethod();

            if not checkcaller() then
                if typeof(self) == "Instance" and (method == "GetMemoryUsageMbForTag" or method == "getMemoryUsageMbForTag") and self.ClassName == "Stats" then
                    return GetReturn();
                end
            end

            return _MemBypass(self,...)
        end)

        -- Indexed Versions
        local _MemBypassIndex; _MemBypassIndex = hookfunction(Stats.GetMemoryUsageMbForTag, function(self, ...)
            if not checkcaller() then
                if typeof(self) == "Instance" and self.ClassName == "Stats" then
                    return GetReturn();
                end
            end
        end)
    end)

    -- ContentProvider Bypasses
    local Content = cloneref(game:GetService("ContentProvider"));
    local CoreGui = cloneref(game:GetService("CoreGui"));
    local randomizedCoreGuiTable;
    local randomizedGameTable;

    local coreguiTable = {}

    game:GetService("ContentProvider"):PreloadAsync({CoreGui}, function(assetId) --use preloadasync to patch preloadasync :troll:
        if not assetId:find("rbxassetid://") then
            table.insert(coreguiTable, assetId);
        end
    end)
    local gameTable = {}

    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("ImageLabel") then
            if v.Image:find('rbxassetid://') and v:IsDescendantOf(CoreGui) then else
                table.insert(gameTable, v.Image)
            end
        end
    end

    function randomizeTable(t)
        local n = #t
        while n > 0 do
            local k = math.random(n)
            t[n], t[k] = t[k], t[n]
            n = n - 1
        end
        return t
    end

    local ContentProviderBypass
    ContentProviderBypass = hookmetamethod(game, "__namecall", function(self, Instances, ...)
        local method = getnamecallmethod();
        local args = ...;

        if not checkcaller() and (method == "preloadAsync" or method == "PreloadAsync") then
            if Instances and Instances[1] and self.ClassName == "ContentProvider" then
                if Instances ~= nil then
                    if typeof(Instances[1]) == "Instance" and (table.find(Instances, CoreGui) or table.find(Instances, game)) then
                        if Instances[1] == CoreGui then
                            randomizedCoreGuiTable = randomizeTable(coreguiTable)
                            return ContentProviderBypass(self, randomizedCoreGuiTable, ...)
                        end

                        if Instances[1] == game then
                            randomizedGameTable = randomizeTable(gameTable)
                            return ContentProviderBypass(self, randomizedGameTable, ...)
                        end
                    end
                end
            end
        end

        return ContentProviderBypass(self, Instances, ...)
    end)

    local preloadBypass; preloadBypass = hookfunction(Content.PreloadAsync, function(a, b, c)
        if not checkcaller() then
            if typeof(a) == "Instance" and tostring(a) == "ContentProvider" and typeof(b) == "table" then
                if (table.find(b, CoreGui) or table.find(b, game)) and not (table.find(b, true) or table.find(b, false)) then
                    if b[1] == CoreGui then -- Double Check
                        randomizedCoreGuiTable = randomizeTable(coreguiTable)
                        return preloadBypass(a, randomizedCoreGuiTable, c)
                    end
                    if b[1] == game then -- Triple Check
                        randomizedGameTable = randomizeTable(gameTable)
                        return preloadBypass(a, randomizedGameTable, c)
                    end
                end
            end
        end

        return preloadBypass(a, b, c)
    end)

    -- GetFocusedTextBox Bypass
    local _IsDescendantOf = game.IsDescendantOf

    local TextboxBypass
    TextboxBypass = hookmetamethod(game, "__namecall", function(self,...)
        local method = getnamecallmethod();
        local args = ...;

        if not checkcaller() then
            if typeof(self) == "Instance" and method == "GetFocusedTextBox" and self.ClassName == "UserInputService" then
                local Textbox = TextboxBypass(self,...);
                if Textbox and typeof(Textbox) == "Instance" then
                    local succ,err = pcall(function() _IsDescendantOf(Textbox, Bypassed_Dex) end)

                    if err and err:match("The current identity") then
                        return nil;
                    end
                end
            end
        end

        return TextboxBypass(self,...);
    end)

    --Newproxy Bypass (Stolen from Lego Hacker (V3RM))
    local TableNumbaor001 = {}
    local SomethingOld;
    SomethingOld = hookfunction(getrenv().newproxy, function(...)
        local proxy = SomethingOld(...)
        table.insert(TableNumbaor001, proxy)
        return proxy
    end)

    local RunService = cloneref(game:GetService("RunService"))
    RunService.Stepped:Connect(function()
        for i,v in pairs(TableNumbaor001) do
            if v == nil then end
        end
    end)
end

-- https://github.com/FaithfulAC/universal-stuff/blob/main/c-stack-overflow-universal-bypass.lua
do
    local args = (...) or { -- args should be a table
        StackThreshold = 195,
        StackThresholdMax = 198,
        error1 = "C stack overflow",
        error2 = "cannot resume dead coroutine",
        custom_error = nil, -- for this you can put in any error and if a function results in that error then it will return...
        custom_error_return = nil, -- what you put for this
        ExcludedFunctions = {},
        IncludedFunctions = {}, -- if there are any functions in this table then ExcludedFunctions will simply be disregarded
        IncludeLuaFunctions = true -- if there are any functions in IncludedFunctions then this will automatically be false
    }

    local stackThreshold = args.StackThreshold or 195
    local stackThresholdMax = args.StackThresholdMax or 198
    local firstError = args.error1 or "C stack overflow"
    local secondError = args.error2 or "cannot resume dead coroutine"
    local customError = args.custom_error
    local customErrorReturn = args.custom_error_return or ""
    local excludedFunctions = args.ExcludedFunctions or {}
    local includedFunctions = args.IncludedFunctions or {}
    local includeLuaFunctions = true; -- bool values can really screw things up

    if (args.includeLuaFunctions ~= nil) then
        includeLuaFunctions = args.includeLuaFunctions;
    end

    local luaCacheFunctions = --[[setmetatable(]]{}--[[, {__mode = "v"}) -- while a weaktable is not completely reliable it helps mitigate most of the cor.wrap detections]]

    if #includedFunctions > 0 then
        includeLuaFunctions = false
        table.clear(excludedFunctions)
    end

    local pack, unpack, info, find, error = table.pack, unpack, debug.info, table.find, getrenv().error;
    local Cache = {}
    local WrapHook;

    local function CheckValidity(func)
        if (not includeLuaFunctions) and (info(func, "s") ~= "[C]" or table.find(luaCacheFunctions, func)) then
            return false
        elseif #includedFunctions > 0 and not find(includedFunctions, func) then
            return false
        elseif table.find(excludedFunctions, func) then
            return false
        end
        return true
    end

    local function IsInCache(func)
        for i, tbl in Cache do
            if tbl.Wrapped == func or tbl.ReplacementFunc == func then
                return tbl
            end
        end
        return nil
    end

    local function InsertInCache(func, wrapped)
        if typeof(func) ~= "function" or typeof(wrapped) ~= "function" then return end

        local New; New = {
            WrapCount = 1,
            Original = func,
            ReplacementFunc = function(...)
                --[[if select("#", ...) >= 8000 then
                    return error("too many arguments to resume", 2)
                end]]

                local args = pack(pcall(WrapHook(func), ...))

                if not args[1] then
                    local err = args[2]

                    if err ~= "cannot resume dead coroutine" and New.WrapCount > stackThresholdMax then
                        task.spawn(New.Gc)
                        return error(firstError, 2)
                    elseif err == "cannot resume dead coroutine" or select(2, pcall(WrapHook(wrapped))) == "cannot resume dead coroutine" then
                        task.spawn(New.Gc)
                        return error(secondError, 2)
                    elseif customError and err == customError then
                        task.spawn(New.Gc)
                        return error(customErrorReturn, 2)
                    end

                    task.spawn(New.Gc)
                    return error(err, 2)
                end

                task.spawn(New.Gc)

                return unpack(args, 2, args.n)
            end,
            Wrapped = wrapped,
            Gc = function()
                table.remove(Cache, table.find(Cache, New))
            end,
        }

        table.insert(Cache, New)
    end

    WrapHook = hookfunction(getrenv().coroutine.wrap, function(...)
        local Target = ...

        if not checkcaller() and typeof(Target) == "function" then
            local CacheTbl = IsInCache(Target)

            if CacheTbl then
                local Validity = CheckValidity(Target)
                if not Validity then
                    local res = WrapHook(...)

                    if table.find(luaCacheFunctions, Target) then
                        luaCacheFunctions[table.find(luaCacheFunctions, Target)] = res
                    else
                        table.insert(luaCacheFunctions, res)
                    end

                    return res;
                end
                CacheTbl.WrapCount += 1

                if CacheTbl.WrapCount == stackThreshold then
                    local NewFunc = WrapHook(CacheTbl.ReplacementFunc)
                    CacheTbl.Original, CacheTbl.ReplacementFunc = NewFunc, NewFunc
                    CacheTbl.Wrapped = WrapHook(CacheTbl.Wrapped)

                    return NewFunc
                elseif CacheTbl.WrapCount < stackThreshold or CacheTbl.WrapCount > stackThresholdMax then
                    local NewFunc = WrapHook(CacheTbl.Wrapped)
                    CacheTbl.Wrapped = NewFunc

                    return NewFunc
                end

                local NewFunc = WrapHook(CacheTbl.ReplacementFunc)
                CacheTbl.Original, CacheTbl.ReplacementFunc = NewFunc, NewFunc
                CacheTbl.Wrapped = WrapHook(WrapHook(CacheTbl.Wrapped))

                return NewFunc
            else
                local arg = WrapHook(...)
                InsertInCache(Target, arg)

                return arg
            end
        end

        return WrapHook(...)
    end)
end

-- https://github.com/FaithfulAC/universal-stuff/blob/main/debug-traceback-bypass.lua
do
    local exploitsrc = debug.info(1, "s") -- if your exploit src changes every execution you're fucked
    local split, match, gsub, remove, concat = string.split, string.match, string.gsub, table.remove, table.concat
    
    local h; h = hookfunction(getrenv().debug.traceback, function(...)
        local res = h(...)
    
        if not checkcaller() and typeof(res) == "string" and match(res, exploitsrc) then
            res = split(res, "\n")
            remove(res, 1) -- remove this hookfunction func trace
            res = concat(res, "\n")
            if exploitsrc ~= "" then
                res = gsub(res, exploitsrc .. ":%d+\n", "")
                res = gsub(res, exploitsrc .. ":%d+", "")
            else
                res = gsub(res, exploitsrc .. "\n:%d+\n", "\n")
                res = gsub(res, exploitsrc .. "\n:%d+", "\n")
            end
        end
    
        return res
    end)
end

-- https://github.com/FaithfulAC/universal-stuff/blob/main/true-secure-dex-bypasses.lua#L183
do
    -- inspiration from universal bypasses by babyhamsta and obviously originally inspired by secure dex by babyhamsta
    -- if you find any errors or detections in the logic of any of these hooks please submit an issue (or pull request if you're that dedicated)

    --[[
        made by @__europa
        big thanks to kaxr and babyhamsta
    ]]

    local clonefunction = clonefunc or clonefunction or function(...) return ... end
    local cloneref = cloneref or function(...) return ... end
    local hookmetamethod, hookfunction = hookmetamethod, hookfunction
    local getrenv = getrenv or getfenv
    local getgenv = getgenv or getfenv
    local getnamecallmethod = getnamecallmethod
    local getconnections = getconnections
    local getgc = getgc
    local getreg = getreg
    local checkcaller = checkcaller or function() return false end
    local iscclosure = iscclosure or function(func) return debug.info(func, "s") == "[C]" end
    local isourclosure = isourclosure or isexecutorclosure or function(func) return rawequal(getfenv(func), getfenv()) end

    local GetDebugId = clonefunction(game.GetDebugId)
    local IsDescendantOf = clonefunction(game.IsDescendantOf)

    local options = (...) or getgenv().DexOptions or getgenv().options or {
        gcinfo = true,
        GetTotalMemoryUsageMb = true,
        GetMemoryUsageMbForTag = true,
        PreloadAsync = true,
        InstanceCount = true,
        UI2DDrawcallCount = true,
        UI2DTriangleCount = true,
        GetFocusedTextBox = true,
        GuiObjects = true,
        Weaktable = true
    }

    local compareinstances = compareinstances or function(ins1, ins2)
        local identity;
        if getthreadidentity then identity = getthreadidentity() else identity = 2 end
        if setthreadidentity then setthreadidentity(8) end
        
        local bool = typeof(ins1) == typeof(ins2) and typeof(ins1) == "Instance" and GetDebugId(ins1) == GetDebugId(ins2)
        
        if setthreadidentity then setthreadidentity(identity) end
        return bool;
    end

    local Player = cloneref(game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Wait())
    local RunService = cloneref(game:GetService("RunService"))
    local Stats = cloneref(game:GetService("Stats"))
    local CoreGui = cloneref(game:GetService("CoreGui"))
    local UserInputService = cloneref(game:GetService("UserInputService"))
    local GuiService = cloneref(game:GetService("GuiService"))
    local ContentProvider = cloneref(game:GetService("ContentProvider"))
    local StarterGui = cloneref(game:GetService("StarterGui"))
    local PlayerGui = cloneref(game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui"))
    local DexGui = Dex or Bypassed_Dex or select(2, ...) or CoreGui:FindFirstChild("RobloxGui") -- for textbox and mem/inscount increase
    repeat task.wait() until game:IsLoaded()

    -- make DexGui be set to the folder parent so any more guis added under the folder will also have certain protections
    if DexGui.Parent.Name == "DexHost" then
        DexGui = DexGui.Parent
    end

    if select(3, ...) == true and cloneref(game) ~= game then -- means script is under an actor and cloneref works as intended
        options.Weaktable = false -- it is under an actor, therefore it is under a different lua state; no weaktable spoofs are necessary
    end

    -- for realism of gcinfo, inscount, and memory spoofs
    local gcinfo_ret, inscount_ret, memtag_ret, totalmem_ret, drawcall_ret, triangle_ret
        = gcinfo(), Stats.InstanceCount, Stats:GetMemoryUsageMbForTag("Gui"), Stats:GetTotalMemoryUsageMb(), Stats.UI2DDrawcallCount, Stats.UI2DTriangleCount;

    local GetRandomMemoryIncrease = function()
        return ((math.random(1e7, 1e9)*1005)+.5)/1e14
    end

    local GuiClasses = { -- instances that can increase memory for gui
        TextLabel = GetRandomMemoryIncrease(),
        TextButton = GetRandomMemoryIncrease(),
        Frame = GetRandomMemoryIncrease(),
        VideoFrame = GetRandomMemoryIncrease(),
        ViewportFrame = GetRandomMemoryIncrease(),
        ScrollingFrame = GetRandomMemoryIncrease(),
        ImageLabel = GetRandomMemoryIncrease(),
        ImageButton = GetRandomMemoryIncrease()
    }

    if options.GetMemoryUsageMbForTag or options.InstanceCount then
        local GetDescendants = clonefunction(game.GetDescendants)
        
        game.DescendantAdded:Connect(function(ins) -- mark those under datamodel
            if not IsDescendantOf(ins, DexGui) then
                if GuiClasses[ins.ClassName] then
                    memtag_ret += GuiClasses[ins.ClassName]
                end
                ins = nil
                inscount_ret += 1
            end
        end)

        game.DescendantRemoving:Connect(function(ins)
            if not IsDescendantOf(ins, DexGui) then
                local GuiReturn = GuiClasses[ins.ClassName]
                ins = nil
                task.wait(math.random())

                if GuiReturn then
                    memtag_ret -= GuiReturn
                end
                inscount_ret -= 1
            
                if math.random(2) == 2 then -- for fun
                    task.wait(math.random())
                    inscount_ret -= 1
                end
            end
        end)

        local OrgClone;

        local markup = newcclosure(function(...)
            local result = OrgClone(...)

            if not checkcaller() and typeof(result) == "Instance" and result.Parent == nil then
                if GuiClasses[result.ClassName] then
                    memtag_ret += GuiClasses[result.ClassName]
                end

                inscount_ret += #GetDescendants(result) + 1
            end

            return result
        end)

        OrgClone = hookfunction(game.Clone, markup)
        hookfunction(game.clone, markup)

        local CloneHook; CloneHook = hookmetamethod(game, "__namecall", function(...)
            local self = ...
            local method = getnamecallmethod()

            if not checkcaller() and typeof(self) == "Instance" and (method == "Clone" or method == "clone") then
                return markup(...)
            end

            return CloneHook(...)
        end)

        local InsCountHook, InsCountHook2;

        InsCountHook = hookfunction(getrenv().Instance.new, function(...)
            local result = InsCountHook(...)

            if not checkcaller() and typeof(result) == "Instance" then
                if GuiClasses[result.ClassName] then
                    memtag_ret += GuiClasses[result.ClassName]
                end

                inscount_ret += 1
            end

            return result
        end)

        InsCountHook2 = hookfunction(getrenv().Instance.fromExisting, function(...)
            local result = InsCountHook2(...)

            if not checkcaller() and typeof(result) == "Instance" then
                if GuiClasses[result.ClassName] then
                    memtag_ret += GuiClasses[result.ClassName]
                end

                inscount_ret += 1
            end

            return result
        end)
    end

    if options.UI2DDrawcallCount or options.UI2DTriangleCount then
        task.delay(math.random()*1.5, function() -- wait a little bit after dex loads in
            local OldDrawcall, OldTriangle = drawcall_ret, triangle_ret
            while task.wait(math.random()*1.5) do -- change it periodically
                drawcall_ret += math.random(-4, 4)
                triangle_ret += math.random(-4, 4)

                if math.random(10) == 10 then -- change it back to somewhere around the default
                    drawcall_ret = math.abs(OldDrawcall + math.random(-8, 8))
                    triangle_ret = math.abs(OldTriangle + math.random(-8, 8))
                end
            end
        end)
    end

    if options.gcinfo then
        local TableCreateHook;
        TableCreateHook = hookfunction(getrenv().table.create, function(...)
            local int, var = ...

            if not checkcaller() and typeof(int) == "number" and int > 0 and int <= 2^26 and var then
                gcinfo_ret += math.ceil(int/1000)
            end

            return TableCreateHook(...)
        end)
    end

    -- gcinfo / collectgarbage spoof
    task.spawn(function()
        if not options.gcinfo then return end
        local max, mini;

        max = gcinfo() + math.random(math.floor(gcinfo()/5), math.floor(gcinfo()/2))
        mini = gcinfo() - math.random(math.floor(gcinfo()/5), math.floor(gcinfo()/2))
        gcinfo_ret = gcinfo()

        local function decrease()
            local maxfor = math.random(15, 22)
                
            for i = 1, maxfor do
                gcinfo_ret = max - math.floor(((max - mini*1.25)*(i/maxfor))+math.random(-30,30))
                task.wait(math.random(25,45)/1000)
            end
        end

        local range1 = Stats.InstanceCount
        local range2 = range1 + math.random(1000, 5000)

        task.spawn(function()
            while true do
                local delta = task.wait()
                local prev = tick()
                if gcinfo_ret > max + math.random(-75,75) then decrease() end

                gcinfo_ret += math.floor(math.random(range1,range2)/15000)
                repeat until tick()-prev > delta/2 -- wont freeze if the delta wait time is based on ur fps

                gcinfo_ret += math.random(0, math.floor(math.random(range1,range2)/15000))
                task.wait()

                gcinfo_ret += math.floor(math.random(range1,range2)/20000)
            end
        end)

        local h1; h1 = hookfunction(getrenv().gcinfo, function(...)
            if not checkcaller() then
                return gcinfo_ret
            end

            return h1(...)
        end)

        local h2; h2 = hookfunction(getrenv().collectgarbage, function(...)
            local cnt = ...

            if not checkcaller() and typeof(cnt) == "string" and string.split(cnt, "\0")[1] == "count" then
                return gcinfo_ret
            end

            return h2(...)
        end)
    end)

    -- memory spoof
    task.spawn(function()
        if not options.GetTotalMemoryUsageMb then return end
        task.spawn(function()
            local switchoff = false

            while RunService.Heartbeat:Wait() do
                switchoff = not switchoff
                totalmem_ret += (math.random(-2,2)/(if switchoff then 32 else 64)) - (math.random(-1,1)/2)

                task.wait(math.random(1,3)/90)
            end
        end)

        local h1; h1 = hookmetamethod(game,"__namecall", function(...)
            local self = ...
            local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and method == "getTotalMemoryUsageMb" then
                return totalmem_ret
            end

            return h1(...)
        end)

        local h2; h2 = hookfunction(Stats.GetTotalMemoryUsageMb, function(...)
            local self = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) then
                return totalmem_ret
            end

            return h2(...)
        end)
    end)

    -- memorytag spoof (spoofs gui in accordance to each device)
    task.spawn(function()
        if not options.GetMemoryUsageMbForTag then return end
        local enum = Enum.DeveloperMemoryTag.Gui

        local function isGui(item)
            return
                (typeof(item) == "EnumItem" and item == enum) or
                (typeof(item) == "string" and string.split(item, "\0")[1] == "Gui")
        end

        task.spawn(function()
            local switchoff = false

            while RunService.Heartbeat:Wait() do
                if math.random(1, 10) < 3 then
                    switchoff = not switchoff
                    memtag_ret += math.random(-2,2)/(if switchoff then 64 else 128) + (math.random(-1,1)/20)

                    task.wait(math.random(1,3)/90)
                end
            end
        end)

        local h1; h1 = hookmetamethod(game,"__namecall", function(...)
            local self, newenum = ...
            local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and method == "getMemoryUsageMbForTag" and isGui(newenum) then
                return memtag_ret
            end

            return h1(...)
        end)

        local h2; h2 = hookfunction(Stats.GetMemoryUsageMbForTag, function(...)
            local self, arg = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and isGui(arg) then
                return memtag_ret
            end

            return h2(...)
        end)
    end)

    -- preloadasync spoof
    task.spawn(function()
        if not options.PreloadAsync then return end

        local gametbl = {}
        local coreguitbl = {}
        local dextbl = {}

        -- prevent GetAssetFetchStatus detection vectors on the dex model
        -- in order to have fully-undetected status you MUST do AssetList[#AssetList + 1] = ContentIdYouWantToHide
        local AssetList = AssetList or {"rbxassetid://17769765246"}
        local AssetReturns = {}

        for i, v in pairs(AssetList) do
            AssetReturns[v] = ContentProvider:GetAssetFetchStatus(v)
        end

        setmetatable(AssetList, {__newindex = function(a, b, c) rawset(AssetList, b, c) rawset(AssetReturns, c, ContentProvider:GetAssetFetchStatus(c)) end})

        ContentProvider:PreloadAsync({game}, function(a)
            table.insert(gametbl,a)
        end)
        ContentProvider:PreloadAsync({CoreGui}, function(a)
            table.insert(coreguitbl,a)
        end)
        ContentProvider:PreloadAsync({DexGui}, function(a)
            table.insert(dextbl,a)
        end)

        --[[
        -- commented out because preloadasyncing dexgui and directly comparing each assetid is probably more of a viable solution
        -- it also does not matter if every dex image id is loaded in, well, the reason why is obvious
        -- planning to make game.DescendantAdded checks soon

        for i, v in pairs(gametbl) do
            if table.find(badnews, v) and table.find(coreguitbl, v) then
                table.remove(gametbl, i)
            end
        end
        for i, v in pairs(coreguitbl) do
            if table.find(badnews, v) then
                table.remove(coreguitbl, i)
            end
        end

        --]]

        for i, v in pairs(dextbl) do
            local find1, find2 = table.find(gametbl, v), table.find(coreguitbl, v);
            if find1 then
                table.remove(gametbl, find1)
            end
            if find2 then
                table.remove(coreguitbl, find2)
            end
        end

        table.clear(dextbl);
        dextbl = nil;

        local find = function(tbl, arg)
            if type(tbl) ~= "table" then return false end

            for _, v in ipairs(tbl) do
                if rawequal(v, arg) then
                    return true
                end

                if typeof(v) == "Instance" and compareinstances(v, arg) then
                    return true
                end
            end

            return false
        end

        local randomizeTable = function(t)
            local n = #t
            while n > 0 do
                local k = math.random(n)
                t[n], t[k] = t[k], t[n]
                n -= 1
            end
            return t
        end

        local safecheck = function(tbl)
            for i, v in ipairs(tbl) do
                if type(v) ~= "string" and typeof(v) ~= "Instance" then
                    return false
                end
            end
            return true
        end

        local h1; h1 = hookmetamethod(game,"__namecall", function(...)
            local self, tbl, fnc = ...
            local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, ContentProvider) then
                if method == "preloadAsync" and type(tbl) == "table" and (find(tbl, game) or find(tbl,CoreGui)) and safecheck(tbl) then
                    local targettbl = {}

                    for _, v in ipairs(tbl) do
                        if typeof(v) == "Instance" then
                            if compareinstances(v, game) then
                                for _, v2 in pairs(randomizeTable(gametbl)) do
                                    table.insert(targettbl,v2)
                                end
                            elseif compareinstances(v, CoreGui) then
                                for _, v2 in pairs(randomizeTable(coreguitbl)) do
                                    table.insert(targettbl,v2)
                                end
                            else
                                table.insert(targettbl, v)
                            end
                        elseif typeof(v) == "string" then
                            table.insert(targettbl, v)
                        end
                    end

                    return h1(self, targettbl, fnc)
                elseif method == "getAssetFetchStatus" and type(tbl) == "string" then
                    local str = string.split(tbl, "\0")[1] -- lol
                    if tonumber(str) then
                        str = "rbxassetid://" .. str
                    end

                    if table.find(AssetList, str) then
                        return AssetReturns[str] or Enum.AssetFetchStatus.None
                    end
                end
            end

            return h1(...)
        end)

        local h2; h2 = hookfunction(ContentProvider.PreloadAsync, function(...)
            local self, tbl, fnc = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, ContentProvider) and type(tbl) == "table" and (find(tbl,game) or find(tbl,CoreGui)) and safecheck(tbl) then
                local targettbl = {}

                for _, v in ipairs(tbl) do
                    if typeof(v) == "Instance" then
                        if compareinstances(v, game) then
                            for _, v2 in pairs(randomizeTable(gametbl)) do
                                table.insert(targettbl,v2)
                            end
                        elseif compareinstances(v, CoreGui) then
                            for _, v2 in pairs(randomizeTable(coreguitbl)) do
                                table.insert(targettbl,v2)
                            end
                        else
                            table.insert(targettbl, v)
                        end
                    elseif typeof(v) == "string" then
                        table.insert(targettbl, v)
                    end
                end

                return h2(self, targettbl, fnc)
            end

            return h2(...)
        end)

        local h3; h3 = hookfunction(ContentProvider.GetAssetFetchStatus, function(...)
            local self, str = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, ContentProvider) and type(str) == "string" then
                str = string.split(str, "\0")[1]
                if tonumber(str) then
                    str = "rbxassetid://" .. str
                end

                if table.find(AssetList, str) then
                    return Enum.AssetFetchStatus.None
                end
            end

            return h3(...)
        end)

        --[[local templist = {} -- commented out cuz it SUCKS!!!

        for _, asset in pairs(AssetList) do
            for i, v in next, getconnections(ContentProvider:GetAssetFetchStatusChangedSignal(asset)) do
                v:Disable() -- if your executor is competent then a .Connected check should not detect this
                -- but we're still going to check for your executor's competency anyways :)
                            
                if select(2, pcall(function() return v.Connected end)) == false then
                    v:Enable() -- since .Connected checks do detect this we will re-enable it
                    -- now we will resort to hooking the function connected to the signal

                    -- lotta hacky checks here but we should never have to come to this if statement in the first place so whatever
                    if (not table.find(templist, v.Function)) and not (iscclosure(v.Function) or isourclosure(v.Function)) then
                        table.insert(templist, v.Function)
                        -- yeah go ahead and detect this
                        hookfunction(v.Function, function()end)
                    end
                end
            end
        end

        table.clear(templist)]]
    end)

    -- instancecount bypass
    task.spawn(function()
        if not (options.InstanceCount or options.UI2DDrawcallCount or options.UI2DTriangleCount) then return end
        local h1; h1 = hookmetamethod(game,"__index", function(...)
            local self, arg = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, Stats) and type(arg) == "string" and #arg < 256 then
                arg = --[[string.split(]]string.gsub(arg, "^%l", string.upper)--, "\0")[1]
                local res = h1(...)

                if typeof(res) == "number" then -- double check just in case
                    if options.InstanceCount and arg == "InstanceCount" then return inscount_ret end
                    if options.UI2DDrawcallCount and arg == "UI2DDrawcallCount" then return drawcall_ret end
                    if options.UI2DTriangleCount and arg == "UI2DTriangleCount" then return triangle_ret end
                end

                return res
            end

            return h1(...)
        end)
    end)

    -- forked textbox bypass
    task.spawn(function()
        if not options.GetFocusedTextBox then return end
        local h1; h1 = hookmetamethod(game, "__namecall", function(...)
            local method = string.gsub(getnamecallmethod(), "^%u", string.lower);
            local self = ...

            if not checkcaller() then
                if typeof(self) == "Instance" and compareinstances(self, UserInputService) and method == "getFocusedTextBox" then
                    local Textbox = h1(...)

                    if typeof(Textbox) == "Instance" then
                        local _,err = pcall(IsDescendantOf, Textbox, DexGui)

                        if err and (type(err) == "boolean" and err == true) or (type(err) == "string" and err:lower():match("the current")) then
                            return nil
                        end
                    end

                    return Textbox
                end
            end


            return h1(...)
        end)

        local h2; h2 = hookfunction(UserInputService.GetFocusedTextBox, function(...)
            local self = ...

            if not checkcaller() then
                if typeof(self) == "Instance" and compareinstances(self, UserInputService) then
                    local Textbox = h2(...)

                    if typeof(Textbox) == "Instance" then
                        local _,err = pcall(IsDescendantOf, Textbox, DexGui)

                        if err and (type(err) == "boolean" and err == true) or (type(err) == "string" and err:lower():match("the current")) then
                            return nil
                        end
                    end

                    return Textbox
                end
            end


            return h2(...)
        end)
    end)

    -- guiobjects circumnav. (you do a setcore to detect this and i kill you)
    task.spawn(function()
        if not options.GuiObjects then return end
        local doobityVisible = true

        task.spawn(function() -- randomly auto set doobityVisible to true
            while task.wait(math.random()*3) do
                doobityVisible = true
            end
        end)

        local h1; h1 = hookmetamethod(game, "__namecall", function(...)
            local self, arg1, arg2 = ...
            local method = string.gsub(getnamecallmethod(), "^%u", string.lower)

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, StarterGui) and rawequal(arg1, "DevConsoleVisible") then
                if method == "getCore" then
                    return doobityVisible
                elseif method == "setCore" and rawequal(arg2, false) then
                    doobityVisible = false
                end
            end

            return h1(...)
        end)

        local h2; h2 = hookfunction(StarterGui.GetCore, function(...)
            local self, arg = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, StarterGui) and rawequal(arg, "DevConsoleVisible") then
                return doobityVisible
            end

            return h2(...)
        end)

        local h3; h3 = hookfunction(StarterGui.SetCore, function(...)
            local self, arg1, arg2 = ...

            if not checkcaller() and typeof(self) == "Instance" and compareinstances(self, StarterGui) and rawequal(arg1, "DevConsoleVisible") and rawequal(arg2, false) then
                doobityVisible = false
            end

            return h3(...)
        end)
    end)

    -- weaktable bypass
    task.spawn(function()
        if not options.Weaktable then return end
        local wrap = coroutine.wrap
        local remove = table.remove
        local isreadonly = isreadonly or table.isfrozen

        -- this exists so pcalling (ouch) c functions will not actually succeed (for the most part, stuff like gcinfo will succeed but will realistically not have a datamodel effect)
        local ReassuranceFunction = function() error("", 0) end
        local ReassuranceTable = setmetatable({}, {
            __eq = ReassuranceFunction,
            __tostring = ReassuranceFunction,
            __iter = ReassuranceFunction,
            __index = ReassuranceFunction,
            __newindex = ReassuranceFunction,
            __metatable = "The metatable is locked" -- for fun
        })
                    
        --[[
        local list;
        local folder = Instance.new("Folder")
        folder.Name = tostring(math.random())

        -- this was intended to check an actual cache list but because i dont really have a proper executor at my disposal i cant properly test this smh
        for firstkey, host in pairs(getreg()) do
            if typeof(firstkey) == "userdata" and typeof(host) == "table" then
                for key, ins in pairs(host) do
                    if (typeof(key) == "userdata" and typeof(ins) == "Instance") or ins == folder then
                        list = host
                    end
                end
            end
        end

        folder:Destroy()
        ]]

        local CanBeCollected = function(obj)
            if (typeof(obj) == "function" and iscclosure(obj)) then
                local FuncName = debug.info(obj, "n")
                local HasName = (FuncName ~= "")

                -- we can deal with people ACTUALLY referencing instance function members when the commented code above works ;)
                return (HasName and select(2, pcall(wrap(obj))) == "Expected ':' not '.' calling member function " .. FuncName) or true;
            end
            return (typeof(obj) == "table" or type(obj) == "userdata")
        end

        local h; h = hookfunction(getrenv().setmetatable, function(...)
            local tbl1, tbl2 = ...

            if not checkcaller() and typeof(tbl1) == "table" and typeof(tbl2) == "table" then
                local Mode;
                if typeof(rawget(tbl2, "__mode")) == "string" then
                    local temp = string.split(rawget(tbl2, "__mode"), "\0")[1]

                    if string.find(temp, "v") and string.find(temp, "k") then
                        Mode = "kv"
                    elseif string.find(temp, "v") then
                        Mode = "v"
                    elseif string.find(temp, "k") then
                        Mode = "k"
                    end
                end

                if Mode then
                    local res = h(...)
                    local waitAmount = 30/gcinfo()

                    if gcinfo() > 30000 then -- screw it
                        waitAmount = 0
                    end

                    task.spawn(function()
                        if waitAmount ~= 0 then task.wait(waitAmount) end
                        
                        if Mode == "kv" then
                            for i, v in pairs(res) do
                                if
                                    CanBeCollected(i)
                                    or -- i previously had this as (and) which was not accurate smh
                                    CanBeCollected(v)
                                then
                                    local wasfrozen = isreadonly(res)
                                    if wasfrozen and setreadonly then
                                        setreadonly(res, false)
                                    end

                                    rawset(res, i, nil)

                                    if wasfrozen and setreadonly then
                                        setreadonly(res, true)
                                    end
                                    i, v = nil, nil
                                end
                            end
                        elseif Mode == "v" then
                            for i, v in pairs(res) do
                                if CanBeCollected(v) then
                                    local wasfrozen = isreadonly(res)
                                    if wasfrozen and setreadonly then
                                        setreadonly(res, false)
                                    end

                                    rawset(res, i, nil)

                                    if wasfrozen and setreadonly then
                                        setreadonly(res, true)
                                    end
                                    i, v = nil, nil
                                end
                            end
                        elseif Mode == "k" then
                            for i, v in pairs(res) do
                                if CanBeCollected(i) then
                                    local wasfrozen = isreadonly(res)
                                    if wasfrozen and setreadonly then
                                        setreadonly(res, false)
                                    end

                                    rawset(res, i, nil)

                                    if wasfrozen and setreadonly then
                                        setreadonly(res, true)
                                    end
                                    i, v = nil, nil
                                end
                            end
                        end
                    end)

                    return res
                end
            end

            return h(...)
        end)
    end)
end

local _dtc_ = {};
if dtc then
    setreadonly(dtc, false);
    local function copy_func(v)
        if not dtc[v] then
            _dtc_[v] = function()
            end
            return;
        end

        _dtc_[v] = clonefunction( dtc[v] );
        dtc[v] = nil;
    end
    
    copy_func("schedule");
    copy_func("pushautoexec");
            
    copy_func("readscript");
    copy_func("writescript");
    copy_func("isfilescript");
    copy_func("delfilescript");
    copy_func("listscripts");

    copy_func("readautoexe");
    copy_func("create_autoexe");
    copy_func("isfileautoexe");
    copy_func("delfileautoexe");
    copy_func("listautoexe");
    
    setreadonly(dtc, true);
end

local HWID = tostring(cloneref(game:GetService("RbxAnalyticsService")):GetClientId()):gsub("%-", "")

do
     local org;
     org = hookfunction(request, function(req)
            if type(req) ~= "table" then
                return org(req);
            end

            if type(req["Headers"]) == "table" and req["Headers"]["User-Agent"] ~= nil then
                return org(req);
            end

            local headers = req["Headers"];
            if type(req["Headers"]) ~= "table" then
                headers = {};
            end

            -- headers["Executor"] = "h202";
            -- headers["User-Agent"] = "h202";
            headers["Executor"] = "Seliware";
            headers["User-Agent"] = "Seliware/1.0";
            headers["Fingerprint"] = HWID;

            req["Headers"] = headers;

            return org(req);
     end);
end

local CoreGui = cloneref(game:GetService("CoreGui"))
local uis = cloneref(game:GetService("UserInputService"))
local plr = cloneref(game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Wait())
local mouse = plr:GetMouse()

local h202 = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Close = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Execute = Instance.new("TextButton")
local Scroll = Instance.new("ScrollingFrame")
local CodeBox = Instance.new("TextBox")
local HideBox = Instance.new("TextLabel")

h202.Name = "h202"
h202.Parent = CoreGui
h202.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
h202.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = h202
Main.AnchorPoint = Vector2.new(1, 0)
Main.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Main.BorderColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(1, -0.31, 0.7, 0)
Main.Size = UDim2.new(0.3, 0, 0.3, 0)

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(27, 42, 53)
Close.Position = UDim2.new(0.96, 0, 0, 0)
Close.Size = UDim2.new(0.04, 0, 0.08, 0)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 20.000

Clear.Name = "Clear"
Clear.Parent = Main
Clear.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Clear.BorderColor3 = Color3.fromRGB(30, 30, 30)
Clear.BorderSizePixel = 3
Clear.Position = UDim2.new(0.36, 0, 0.85, 0)
Clear.Size = UDim2.new(0.27, 0, 0.1, 0)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(0, 0, 0)
Clear.TextSize = 14.000

Execute.Name = "Execute"
Execute.Parent = Main
Execute.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Execute.BorderColor3 = Color3.fromRGB(30, 30, 30)
Execute.BorderSizePixel = 3
Execute.Position = UDim2.new(0.03, 0, 0.85, 0)
Execute.Size = UDim2.new(0.27, 0, 0.1, 0)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(0, 0, 0)
Execute.TextSize = 14.000

Scroll.Name = "Scroll"
Scroll.Parent = Main
Scroll.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Scroll.BorderColor3 = Color3.fromRGB(66, 66, 66)
Scroll.BorderSizePixel = 3
Scroll.Position = UDim2.new(0.03, 0, 0.09, 0)
Scroll.Size = UDim2.new(0.94, 0, 0.7, 0)
Scroll.ScrollBarThickness = 7

CodeBox.Name = "CodeBox"
CodeBox.Parent = Scroll
CodeBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.BackgroundTransparency = 0.999
CodeBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
CodeBox.Size = UDim2.new(1, 0, 280, 0)
CodeBox.ZIndex = 2
CodeBox.ClearTextOnFocus = false
CodeBox.Font = Enum.Font.SourceSans
CodeBox.MultiLine = true
CodeBox.PlaceholderText = "h202.me"
CodeBox.Text = "print(123)"
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.TextSize = 18.000
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top

HideBox.Name = "HideBox"
HideBox.Parent = Main
HideBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
HideBox.BackgroundTransparency = 1.000
HideBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
HideBox.BorderSizePixel = 0
HideBox.Position = UDim2.new(0, 13, 0, 19)
HideBox.Size = UDim2.new(0, 393, 0, 154)
HideBox.Font = Enum.Font.SourceSans
HideBox.Text = ""
HideBox.TextColor3 = Color3.fromRGB(0, 0, 0)
HideBox.TextSize = 14.000

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil
	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end
	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)
	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)
	uis.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

MakeDraggable(Main, Main)

Execute.MouseButton1Click:Connect(function()
    if _dtc_.schedule then
        _dtc_.schedule(CodeBox.Text)
    else
        loadstring(CodeBox.Text)()
    end
end)

Clear.MouseButton1Click:Connect(function()
	CodeBox.Text = ""
end)

if _dtc_.pushautoexec then
    _dtc_.pushautoexec();
end

warn("loaded")
