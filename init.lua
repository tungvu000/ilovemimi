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

            headers["Executor"] = "Seliware";
            headers["User-Agent"] = "Seliware/1.0";
            headers["Seliware-Fingerprint"] = getgenv();
            headers["Seliware-User-Identifier"] = getgenv();

            req["Headers"] = headers;

            return org(req);
     end);
end

if _dtc_.pushautoexec then
    task.spawn(_dtc_.pushautoexec)
end

repeat task.wait() until game:IsLoaded()

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

warn("loaded ok")
