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

local HWID = gethwid()

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
		   headers["Seliware-Fingerprint"] = HWID;
		   headers["Seliware-User-Identifier"] = HWID;

		   req["Headers"] = headers;

		   return org(req);
	end);
end

repeat task.wait() until game:IsLoaded()

local CoreGui = cloneref(game:GetService("CoreGui"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local uis = cloneref(game:GetService("UserInputService"))
local plr = cloneref(game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Wait())
local mouse = plr:GetMouse()

do
	local KeyGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local UICorner = Instance.new("UICorner")
	local Frame_2 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local TextButton = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local TextBox = Instance.new("TextBox")
	local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
	local TextButton_2 = Instance.new("TextButton")
	local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
	local UICorner_4 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
	
	
	KeyGui.Name = "KeyGui"
	KeyGui.Parent = CoreGui
	KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	KeyGui.DisplayOrder = 999999999
	
	Frame.Parent = KeyGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.374193549, 0, 0.217336684, 0)
	Frame.Size = UDim2.new(0.270897835, 0, 0.565326631, 0)
	
	ImageLabel.Parent = Frame
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Size = UDim2.new(1, 0, 0.444444448, 0)
	ImageLabel.Image = "rbxassetid://9311640472"
	
	UICorner.Parent = ImageLabel
	
	Frame_2.Parent = Frame
	Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0, 0, 0.362222224, 0)
	Frame_2.Size = UDim2.new(1, 0, 0.637777805, 0)
	
	UICorner_2.CornerRadius = UDim.new(0, 16)
	UICorner_2.Parent = Frame_2
	
	TextButton.Parent = Frame_2
	TextButton.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	TextButton.BackgroundTransparency = 0.600
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.119999997, 0, 0.533101022, 0)
	TextButton.Size = UDim2.new(0.762857139, 0, 0.174216032, 0)
	TextButton.Font = Enum.Font.Roboto
	TextButton.Text = "Sumbit"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true
	
	UICorner_3.CornerRadius = UDim.new(0, 80)
	UICorner_3.Parent = TextButton
	
	UITextSizeConstraint.Parent = TextButton
	UITextSizeConstraint.MaxTextSize = 14
	
	TextBox.Parent = Frame_2
	TextBox.BackgroundColor3 = Color3.fromRGB(232, 232, 232)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.119999997, 0, 0.299651563, 0)
	TextBox.Size = UDim2.new(0.762857139, 0, 0.174216032, 0)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.PlaceholderText = "| Enter Your Key Here"
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.TextScaled = true
	TextBox.TextSize = 14.000
	TextBox.TextWrapped = true
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	
	UITextSizeConstraint_2.Parent = TextBox
	UITextSizeConstraint_2.MaxTextSize = 14
	
	TextButton_2.Parent = Frame_2
	TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	TextButton_2.BackgroundTransparency = 1.000
	TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_2.BorderSizePixel = 0
	TextButton_2.Position = UDim2.new(0.119999997, 0, 0.738675952, 0)
	TextButton_2.Size = UDim2.new(0.762857139, 0, 0.073170729, 0)
	TextButton_2.Font = Enum.Font.Unknown
	TextButton_2.Text = "Click here to get your key!"
	TextButton_2.TextColor3 = Color3.fromRGB(0, 85, 255)
	TextButton_2.TextScaled = true
	TextButton_2.TextSize = 14.000
	TextButton_2.TextWrapped = true
	TextButton_2.Font = Enum.Font.Roboto
	
	UITextSizeConstraint_3.Parent = TextButton_2
	UITextSizeConstraint_3.MaxTextSize = 14
	
	UICorner_4.Parent = Frame
	
	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.119999997, 0, 0.408888876, 0)
	TextLabel.Size = UDim2.new(0.762857139, 0, 0.111111112, 0)
	TextLabel.Font = Enum.Font.DenkOne
	TextLabel.Text = "Welcome to h202.me!"
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 30.000
	TextLabel.TextWrapped = true
	
	UITextSizeConstraint_4.Parent = TextLabel
	UITextSizeConstraint_4.MaxTextSize = 30
	
	TextButton_2.MouseButton1Click:Connect(function()
		setclipboard("https://www.h202.me/api/getkey?hwid=" .. tick())
		StarterGui:SetCore("SendNotification",{
            Title = "Key System",
            Text = "Key Link Copied!",
            Icon = "rbxassetid://16276677105"
        })
	end)

	local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
	api.script_id = "e4aedc7ccd2bacd83555baa884f3d4b1"
	
	local checking_key = false
	local whitelisted = false

	local do_check_key = function(key)
		if checking_key then return end
		checking_key = true
		key = key:gsub("[\r\n%z]", " "):gsub("[ \t]", ""):gsub("[ \n]", ""):gsub("[ \t]+%f[\r\n%z]", "")
		local status = api.check_key(key);

		StarterGui:SetCore("SendNotification",{
			Title = "Key System",
			Text = "[".. status.code .. "] " .. status.message,
			Icon = "rbxassetid://16276677105"
		})

		if (status.code == "KEY_VALID") then			
			whitelisted = true
			writefile("HohoKeyV4.txt", key)
			KeyGui:Destroy()
		end
		checking_key = false
	end
	
	TextButton.MouseButton1Click:Connect(function()
		do_check_key(TextBox.Text)
	end)

	if isfile("HohoKeyV4.txt") then
		local key = readfile("HohoKeyV4.txt")
		TextBox.Text = key
		do_check_key(key)
	end

	repeat task.wait() until whitelisted
end

if _dtc_.pushautoexec then
   task.spawn(_dtc_.pushautoexec)
end

local ui_config = {
	Logo = "rbxassetid://6534621134",
	Devs = {
		{"acsu123", "Owner", "rbxassetid://6534621134"},
		{"acsu456", "Developer", "rbxassetid://17899406673"},
		{"acsu789", "Youtuber", "rbxassetid://9184778830"},
		{"acsu321", "Tester", "rbxassetid://12801500322"},
	},
	Updates = {
		"+ 05/05/2025 Executor Beta!",
	},
	TimeKeyLeft = 9e9,
	PopularScripts = {
		{"HoHo Hub 🔥", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()]]},
		{"Mobile Keyboard", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()]]},
		{"DEX Explorer", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/RBLX_Scripts/refs/heads/main/Universal/BypassedDarkDexV3.lua"))()]]},
        {"Infinite Yield", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source"))()]]},
		{"Unnamed ESP", [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()]]},
	},
	Settings = {
		{"Test Toggle", function(boolean)
			print(boolean)
		end},
		{"Test Toggle 2", function(boolean)
			print(boolean)
		end},
	}
}

local HeHeHeHeUI = {
	HeHeHeHeUI = Instance.new("ScreenGui"),
	BackFrame = Instance.new("Frame"),
	UICorner = Instance.new("UICorner"),
	MainBar = Instance.new("Frame"),
	UICorner_2 = Instance.new("UICorner"),
	Logo = Instance.new("ImageLabel"),
	HomeButton = Instance.new("ImageButton"),
	Frame = Instance.new("Frame"),
	ScriptHubButton = Instance.new("ImageButton"),
	Frame_2 = Instance.new("Frame"),
	FileButton = Instance.new("ImageButton"),
	Frame_3 = Instance.new("Frame"),
	SettingButton = Instance.new("ImageButton"),
	Frame_4 = Instance.new("Frame"),
	HomePage = Instance.new("Frame"),
	Left = Instance.new("Frame"),
	QuickSearchFrame = Instance.new("Frame"),
	UICorner_3 = Instance.new("UICorner"),
	ImageLabel = Instance.new("ImageLabel"),
	QuickSearchBox = Instance.new("TextBox"),
	KeyStatusFrame = Instance.new("Frame"),
	UICorner_4 = Instance.new("UICorner"),
	ImageLabel_2 = Instance.new("ImageLabel"),
	UIGradient = Instance.new("UIGradient"),
	TextLabel = Instance.new("TextLabel"),
	KeyTimeLeft = Instance.new("TextLabel"),
	KeyTimeBack = Instance.new("Frame"),
	UICorner_5 = Instance.new("UICorner"),
	KeyTimeIn = Instance.new("Frame"),
	UICorner_6 = Instance.new("UICorner"),
	UIGradient_2 = Instance.new("UIGradient"),
	TextLabel_2 = Instance.new("TextLabel"),
	DevList = Instance.new("Frame"),
	UICorner_7 = Instance.new("UICorner"),
	UIListLayout = Instance.new("UIListLayout"),
	DevTemplate1 = Instance.new("Frame"),
	UICorner_8 = Instance.new("UICorner"),
	ImageLabel_3 = Instance.new("ImageLabel"),
	UICorner_9 = Instance.new("UICorner"),
	Who = Instance.new("TextLabel"),
	Role = Instance.new("TextLabel"),
	DevTemplate2 = Instance.new("Frame"),
	UICorner_10 = Instance.new("UICorner"),
	ImageLabel_4 = Instance.new("ImageLabel"),
	UICorner_11 = Instance.new("UICorner"),
	Who_2 = Instance.new("TextLabel"),
	Role_2 = Instance.new("TextLabel"),
	DevTemplate3 = Instance.new("Frame"),
	UICorner_12 = Instance.new("UICorner"),
	ImageLabel_5 = Instance.new("ImageLabel"),
	UICorner_13 = Instance.new("UICorner"),
	Who_3 = Instance.new("TextLabel"),
	Role_3 = Instance.new("TextLabel"),
	DevTemplate4 = Instance.new("Frame"),
	UICorner_14 = Instance.new("UICorner"),
	ImageLabel_6 = Instance.new("ImageLabel"),
	UICorner_15 = Instance.new("UICorner"),
	Who_4 = Instance.new("TextLabel"),
	Role_4 = Instance.new("TextLabel"),
	TextLabel_3 = Instance.new("TextLabel"),
	UpdateFrames = Instance.new("Frame"),
	UICorner_16 = Instance.new("UICorner"),
	UpdateLogLabel = Instance.new("TextLabel"),
	UIListLayout_2 = Instance.new("UIListLayout"),
	UIPadding = Instance.new("UIPadding"),
	UICorner_17 = Instance.new("UICorner"),
	Right = Instance.new("Frame"),
	UICorner_18 = Instance.new("UICorner"),
	Right_2 = Instance.new("Frame"),
	UICorner_19 = Instance.new("UICorner"),
	Username = Instance.new("TextLabel"),
	Avatar = Instance.new("ImageLabel"),
	UICorner_20 = Instance.new("UICorner"),
	Close2 = Instance.new("ImageButton"),
	Close1 = Instance.new("ImageButton"),
	CodeHolder = Instance.new("Frame"),
	HightLight = Instance.new("ScrollingFrame"),
	Source = Instance.new("TextBox"),
	Comments_ = Instance.new("TextLabel"),
	Globals_ = Instance.new("TextLabel"),
	Keywords_ = Instance.new("TextLabel"),
	RemoteHighlight_ = Instance.new("TextLabel"),
	Strings_ = Instance.new("TextLabel"),
	Tokens_ = Instance.new("TextLabel"),
	Numbers_ = Instance.new("TextLabel"),
	Lines = Instance.new("TextLabel"),
	UICorner_21 = Instance.new("UICorner"),
	TextLabel_4 = Instance.new("TextLabel"),
	ScriptTabsPage = Instance.new("ScrollingFrame"),
	UIListLayout_3 = Instance.new("UIListLayout"),
	AddScripts = Instance.new("TextButton"),
	UICorner_22 = Instance.new("UICorner"),
	ExScript1 = Instance.new("TextButton"),
	UICorner_23 = Instance.new("UICorner"),
	DeleteScript = Instance.new("TextButton"),
	UICorner_24 = Instance.new("UICorner"),
	ExScript2 = Instance.new("TextButton"),
	UICorner_25 = Instance.new("UICorner"),
	DeleteScript_2 = Instance.new("TextButton"),
	UICorner_26 = Instance.new("UICorner"),
	ExecuteScript = Instance.new("TextButton"),
	UICorner_27 = Instance.new("UICorner"),
	UIGradient_3 = Instance.new("UIGradient"),
	ImageLabel_7 = Instance.new("ImageLabel"),
	TextLabel_5 = Instance.new("TextLabel"),
	ClearScript = Instance.new("TextButton"),
	UICorner_28 = Instance.new("UICorner"),
	UIGradient_4 = Instance.new("UIGradient"),
	ImageLabel_8 = Instance.new("ImageLabel"),
	TextLabel_6 = Instance.new("TextLabel"),
	CopyScript = Instance.new("TextButton"),
	UICorner_29 = Instance.new("UICorner"),
	UIGradient_5 = Instance.new("UIGradient"),
	ImageLabel_9 = Instance.new("ImageLabel"),
	TextLabel_7 = Instance.new("TextLabel"),
	PasteScript = Instance.new("TextButton"),
	UICorner_30 = Instance.new("UICorner"),
	UIGradient_6 = Instance.new("UIGradient"),
	ImageLabel_10 = Instance.new("ImageLabel"),
	TextLabel_8 = Instance.new("TextLabel"),
	ScriptPage = Instance.new("Frame"),
	Left_2 = Instance.new("Frame"),
	TextLabel_9 = Instance.new("TextLabel"),
	PopularScriptTabs = Instance.new("Frame"),
	UICorner_31 = Instance.new("UICorner"),
	UIListLayout_4 = Instance.new("UIListLayout"),
	ExPopularScript = Instance.new("TextButton"),
	UICorner_32 = Instance.new("UICorner"),
	UIGradient_7 = Instance.new("UIGradient"),
	ExPopularLabel = Instance.new("TextLabel"),
	ImageLabel_11 = Instance.new("ImageLabel"),
	TextLabel_10 = Instance.new("TextLabel"),
	UICorner_33 = Instance.new("UICorner"),
	LocalPlayerTabs = Instance.new("Frame"),
	UICorner_34 = Instance.new("UICorner"),
	UIListLayout_5 = Instance.new("UIListLayout"),
	SpeedChange = Instance.new("Frame"),
	Back = Instance.new("TextButton"),
	UICorner_35 = Instance.new("UICorner"),
	In = Instance.new("Frame"),
	UICorner_36 = Instance.new("UICorner"),
	UIGradient_8 = Instance.new("UIGradient"),
	TextLabel_11 = Instance.new("TextLabel"),
	Active = Instance.new("ImageButton"),
	UICorner_37 = Instance.new("UICorner"),
	UIGradient_9 = Instance.new("UIGradient"),
	JumpChange = Instance.new("Frame"),
	Back_2 = Instance.new("TextButton"),
	UICorner_38 = Instance.new("UICorner"),
	In_2 = Instance.new("Frame"),
	UICorner_39 = Instance.new("UICorner"),
	UIGradient_10 = Instance.new("UIGradient"),
	TextLabel_12 = Instance.new("TextLabel"),
	Active_2 = Instance.new("ImageButton"),
	UICorner_40 = Instance.new("UICorner"),
	UIGradient_11 = Instance.new("UIGradient"),
	GravityChange = Instance.new("Frame"),
	Back_3 = Instance.new("TextButton"),
	UICorner_41 = Instance.new("UICorner"),
	In_3 = Instance.new("Frame"),
	UICorner_42 = Instance.new("UICorner"),
	UIGradient_12 = Instance.new("UIGradient"),
	TextLabel_13 = Instance.new("TextLabel"),
	Active_3 = Instance.new("ImageButton"),
	UICorner_43 = Instance.new("UICorner"),
	UIGradient_13 = Instance.new("UIGradient"),
	Right_3 = Instance.new("Frame"),
	UICorner_44 = Instance.new("UICorner"),
	Right_4 = Instance.new("Frame"),
	UICorner_45 = Instance.new("UICorner"),
	Username_2 = Instance.new("TextLabel"),
	Avatar_2 = Instance.new("ImageLabel"),
	UICorner_46 = Instance.new("UICorner"),
	Close2_2 = Instance.new("ImageButton"),
	Close1_2 = Instance.new("ImageButton"),
	DeepSearchFrame = Instance.new("Frame"),
	UICorner_47 = Instance.new("UICorner"),
	ImageLabel_12 = Instance.new("ImageLabel"),
	DeepSearchBox = Instance.new("TextBox"),
	SearchedPage = Instance.new("ScrollingFrame"),
	UIGridLayout = Instance.new("UIGridLayout"),
	ExampleScriptHub = Instance.new("Frame"),
	UICorner_48 = Instance.new("UICorner"),
	ImageLabel_13 = Instance.new("ImageLabel"),
	UICorner_49 = Instance.new("UICorner"),
	TextLabel_14 = Instance.new("TextLabel"),
	Run = Instance.new("ImageButton"),
	UICorner_50 = Instance.new("UICorner"),
	FilePage = Instance.new("Frame"),
	Left_3 = Instance.new("Frame"),
	TextLabel_15 = Instance.new("TextLabel"),
	UICorner_51 = Instance.new("UICorner"),
	SavedScriptPage = Instance.new("ScrollingFrame"),
	UIListLayout_6 = Instance.new("UIListLayout"),
	ExampleScriptFile = Instance.new("TextButton"),
	UICorner_52 = Instance.new("UICorner"),
	ScriptName = Instance.new("TextLabel"),
	ImageLabel_14 = Instance.new("ImageLabel"),
	DeleteScript_3 = Instance.new("ImageButton"),
	TextLabel_16 = Instance.new("TextLabel"),
	AutoExecPage = Instance.new("ScrollingFrame"),
	UIListLayout_7 = Instance.new("UIListLayout"),
	Right_5 = Instance.new("Frame"),
	UICorner_53 = Instance.new("UICorner"),
	Right_6 = Instance.new("Frame"),
	UICorner_54 = Instance.new("UICorner"),
	Username_3 = Instance.new("TextLabel"),
	Avatar_3 = Instance.new("ImageLabel"),
	UICorner_55 = Instance.new("UICorner"),
	Close2_3 = Instance.new("ImageButton"),
	Close1_3 = Instance.new("ImageButton"),
	CodeHolder_2 = Instance.new("Frame"),
	HightLight_2 = Instance.new("ScrollingFrame"),
	Source_2 = Instance.new("TextBox"),
	Comments__2 = Instance.new("TextLabel"),
	Globals__2 = Instance.new("TextLabel"),
	Keywords__2 = Instance.new("TextLabel"),
	RemoteHighlight__2 = Instance.new("TextLabel"),
	Strings__2 = Instance.new("TextLabel"),
	Tokens__2 = Instance.new("TextLabel"),
	Numbers__2 = Instance.new("TextLabel"),
	Lines_2 = Instance.new("TextLabel"),
	UICorner_56 = Instance.new("UICorner"),
	ExecuteScriptFile = Instance.new("TextButton"),
	UICorner_57 = Instance.new("UICorner"),
	UIGradient_14 = Instance.new("UIGradient"),
	ImageLabel_15 = Instance.new("ImageLabel"),
	TextLabel_17 = Instance.new("TextLabel"),
	ClearScriptFile = Instance.new("TextButton"),
	UICorner_58 = Instance.new("UICorner"),
	UIGradient_15 = Instance.new("UIGradient"),
	ImageLabel_16 = Instance.new("ImageLabel"),
	TextLabel_18 = Instance.new("TextLabel"),
	CopyScriptFile = Instance.new("TextButton"),
	UICorner_59 = Instance.new("UICorner"),
	UIGradient_16 = Instance.new("UIGradient"),
	ImageLabel_17 = Instance.new("ImageLabel"),
	TextLabel_19 = Instance.new("TextLabel"),
	PasteScriptFile = Instance.new("TextButton"),
	UICorner_60 = Instance.new("UICorner"),
	UIGradient_17 = Instance.new("UIGradient"),
	ImageLabel_18 = Instance.new("ImageLabel"),
	TextLabel_20 = Instance.new("TextLabel"),
	SaveScriptFile = Instance.new("TextButton"),
	UICorner_61 = Instance.new("UICorner"),
	UIGradient_18 = Instance.new("UIGradient"),
	ImageLabel_19 = Instance.new("ImageLabel"),
	TextLabel_21 = Instance.new("TextLabel"),
	DeleteScriptFile = Instance.new("TextButton"),
	UICorner_62 = Instance.new("UICorner"),
	UIGradient_19 = Instance.new("UIGradient"),
	ImageLabel_20 = Instance.new("ImageLabel"),
	TextLabel_22 = Instance.new("TextLabel"),
	NewScriptFile = Instance.new("TextButton"),
	UICorner_63 = Instance.new("UICorner"),
	UIGradient_20 = Instance.new("UIGradient"),
	ImageLabel_21 = Instance.new("ImageLabel"),
	TextLabel_23 = Instance.new("TextLabel"),
	SettingPage = Instance.new("Frame"),
	Left_4 = Instance.new("Frame"),
	TextLabel_24 = Instance.new("TextLabel"),
	UICorner_64 = Instance.new("UICorner"),
	Frame_5 = Instance.new("Frame"),
	UIListLayout_8 = Instance.new("UIListLayout"),
	ExampleSettingToggle = Instance.new("Frame"),
	TextLabel_25 = Instance.new("TextLabel"),
	TextButton = Instance.new("TextButton"),
	UICorner_65 = Instance.new("UICorner"),
	In_4 = Instance.new("TextButton"),
	UICorner_66 = Instance.new("UICorner"),
	MiniLogo = Instance.new("ImageButton"),
	MiniLogoUICorner = Instance.new("UICorner"),
}

HeHeHeHeUI.HeHeHeHeUI.Name = "HeHeHeHeUI"
HeHeHeHeUI.HeHeHeHeUI.Parent = CoreGui
HeHeHeHeUI.HeHeHeHeUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HeHeHeHeUI.HeHeHeHeUI.DisplayOrder = 9e9

HeHeHeHeUI.BackFrame.Name = "BackFrame"
HeHeHeHeUI.BackFrame.Parent = HeHeHeHeUI.HeHeHeHeUI
HeHeHeHeUI.BackFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.BackFrame.BackgroundTransparency = 1.000
HeHeHeHeUI.BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.BackFrame.BorderSizePixel = 0
HeHeHeHeUI.BackFrame.Position = UDim2.new(0.234970734, 0, 0.221641168, 0)
HeHeHeHeUI.BackFrame.Size = UDim2.new(0.541271985, 0, 0.645994842, 0)

HeHeHeHeUI.UICorner.Parent = HeHeHeHeUI.BackFrame

HeHeHeHeUI.MainBar.Name = "MainBar"
HeHeHeHeUI.MainBar.Parent = HeHeHeHeUI.BackFrame
HeHeHeHeUI.MainBar.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.MainBar.BackgroundTransparency = 0.300
HeHeHeHeUI.MainBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.MainBar.BorderSizePixel = 0
HeHeHeHeUI.MainBar.Size = UDim2.new(0.0874999985, 0, 1, 0)

HeHeHeHeUI.UICorner_2.Parent = HeHeHeHeUI.MainBar

HeHeHeHeUI.Logo.Name = "Logo"
HeHeHeHeUI.Logo.Parent = HeHeHeHeUI.MainBar
HeHeHeHeUI.Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Logo.BackgroundTransparency = 1.000
HeHeHeHeUI.Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Logo.BorderSizePixel = 0
HeHeHeHeUI.Logo.Position = UDim2.new(0.214285716, 0, 0.0379999988, 0)
HeHeHeHeUI.Logo.Size = UDim2.new(0.571428597, 0, 0.0799999982, 0)
HeHeHeHeUI.Logo.Image = "rbxassetid://17899406673"

HeHeHeHeUI.HomeButton.Name = "HomeButton"
HeHeHeHeUI.HomeButton.Parent = HeHeHeHeUI.MainBar
HeHeHeHeUI.HomeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.HomeButton.BackgroundTransparency = 1.000
HeHeHeHeUI.HomeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.HomeButton.BorderSizePixel = 0
HeHeHeHeUI.HomeButton.Position = UDim2.new(0.242857143, 0, 0.200000003, 0)
HeHeHeHeUI.HomeButton.Size = UDim2.new(0.5, 0, 0.0700000003, 0)
HeHeHeHeUI.HomeButton.Image = "http://www.roblox.com/asset/?id=6026568198"

HeHeHeHeUI.Frame.Parent = HeHeHeHeUI.HomeButton
HeHeHeHeUI.Frame.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
HeHeHeHeUI.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Frame.BorderSizePixel = 0
HeHeHeHeUI.Frame.Position = UDim2.new(-0.514285743, 0, 0, 0)
HeHeHeHeUI.Frame.Size = UDim2.new(0.114285715, 0, 1, 0)

HeHeHeHeUI.ScriptHubButton.Name = "ScriptHubButton"
HeHeHeHeUI.ScriptHubButton.Parent = HeHeHeHeUI.MainBar
HeHeHeHeUI.ScriptHubButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ScriptHubButton.BackgroundTransparency = 1.000
HeHeHeHeUI.ScriptHubButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ScriptHubButton.BorderSizePixel = 0
HeHeHeHeUI.ScriptHubButton.Position = UDim2.new(0.243000001, 0, 0.319999993, 0)
HeHeHeHeUI.ScriptHubButton.Size = UDim2.new(0.5, 0, 0.0700000003, 0)
HeHeHeHeUI.ScriptHubButton.Image = "http://www.roblox.com/asset/?id=6022668955"

HeHeHeHeUI.Frame_2.Parent = HeHeHeHeUI.ScriptHubButton
HeHeHeHeUI.Frame_2.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
HeHeHeHeUI.Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Frame_2.BorderSizePixel = 0
HeHeHeHeUI.Frame_2.Position = UDim2.new(-0.514285743, 0, 0, 0)
HeHeHeHeUI.Frame_2.Size = UDim2.new(0.114285715, 0, 1, 0)
HeHeHeHeUI.Frame_2.Visible = false

HeHeHeHeUI.FileButton.Name = "FileButton"
HeHeHeHeUI.FileButton.Parent = HeHeHeHeUI.MainBar
HeHeHeHeUI.FileButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.FileButton.BackgroundTransparency = 1.000
HeHeHeHeUI.FileButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.FileButton.BorderSizePixel = 0
HeHeHeHeUI.FileButton.Position = UDim2.new(0.243000001, 0, 0.430000007, 0)
HeHeHeHeUI.FileButton.Size = UDim2.new(0.5, 0, 0.0700000003, 0)
HeHeHeHeUI.FileButton.Image = "http://www.roblox.com/asset/?id=6031302934"

HeHeHeHeUI.Frame_3.Parent = HeHeHeHeUI.FileButton
HeHeHeHeUI.Frame_3.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
HeHeHeHeUI.Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Frame_3.BorderSizePixel = 0
HeHeHeHeUI.Frame_3.Position = UDim2.new(-0.514285743, 0, 0, 0)
HeHeHeHeUI.Frame_3.Size = UDim2.new(0.114285715, 0, 1, 0)
HeHeHeHeUI.Frame_3.Visible = false

HeHeHeHeUI.SettingButton.Name = "SettingButton"
HeHeHeHeUI.SettingButton.Parent = HeHeHeHeUI.MainBar
HeHeHeHeUI.SettingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.SettingButton.BackgroundTransparency = 1.000
HeHeHeHeUI.SettingButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.SettingButton.BorderSizePixel = 0
HeHeHeHeUI.SettingButton.Position = UDim2.new(0.243000001, 0, 0.899999976, 0)
HeHeHeHeUI.SettingButton.Size = UDim2.new(0.5, 0, 0.0700000003, 0)
HeHeHeHeUI.SettingButton.Image = "http://www.roblox.com/asset/?id=6031280882"

HeHeHeHeUI.Frame_4.Parent = HeHeHeHeUI.SettingButton
HeHeHeHeUI.Frame_4.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
HeHeHeHeUI.Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Frame_4.BorderSizePixel = 0
HeHeHeHeUI.Frame_4.Position = UDim2.new(-0.514285743, 0, 0, 0)
HeHeHeHeUI.Frame_4.Size = UDim2.new(0.114285715, 0, 1, 0)
HeHeHeHeUI.Frame_4.Visible = false

HeHeHeHeUI.HomePage.Name = "HomePage"
HeHeHeHeUI.HomePage.Parent = HeHeHeHeUI.BackFrame
HeHeHeHeUI.HomePage.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.HomePage.BackgroundTransparency = 1.000
HeHeHeHeUI.HomePage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.HomePage.BorderSizePixel = 0
HeHeHeHeUI.HomePage.Position = UDim2.new(0.0874999985, 0, 0, 0)
HeHeHeHeUI.HomePage.Size = UDim2.new(0.912500024, 0, 1, 0)
HeHeHeHeUI.HomePage.Visible = false

HeHeHeHeUI.Left.Name = "Left"
HeHeHeHeUI.Left.Parent = HeHeHeHeUI.HomePage
HeHeHeHeUI.Left.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Left.BackgroundTransparency = 0.300
HeHeHeHeUI.Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Left.BorderSizePixel = 0
HeHeHeHeUI.Left.Size = UDim2.new(0.410958916, 0, 1, 0)

HeHeHeHeUI.QuickSearchFrame.Name = "QuickSearchFrame"
HeHeHeHeUI.QuickSearchFrame.Parent = HeHeHeHeUI.Left
HeHeHeHeUI.QuickSearchFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
HeHeHeHeUI.QuickSearchFrame.BackgroundTransparency = 0.700
HeHeHeHeUI.QuickSearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.QuickSearchFrame.BorderSizePixel = 0
HeHeHeHeUI.QuickSearchFrame.Position = UDim2.new(0.100000001, 0, 0.0480000004, 0)
HeHeHeHeUI.QuickSearchFrame.Size = UDim2.new(0.800000012, 0, 0.0599999987, 0)

HeHeHeHeUI.UICorner_3.CornerRadius = UDim.new(0, 12)
HeHeHeHeUI.UICorner_3.Parent = HeHeHeHeUI.QuickSearchFrame

HeHeHeHeUI.ImageLabel.Parent = HeHeHeHeUI.QuickSearchFrame
HeHeHeHeUI.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel.Position = UDim2.new(0.0430000015, 0, 0.0900000036, 0)
HeHeHeHeUI.ImageLabel.Size = UDim2.new(0.104166664, 0, 0.833333313, 0)
HeHeHeHeUI.ImageLabel.Image = "http://www.roblox.com/asset/?id=6031154871"
HeHeHeHeUI.ImageLabel.ImageColor3 = Color3.fromRGB(172, 172, 172)

HeHeHeHeUI.QuickSearchBox.Name = "QuickSearchBox"
HeHeHeHeUI.QuickSearchBox.Parent = HeHeHeHeUI.QuickSearchFrame
HeHeHeHeUI.QuickSearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.QuickSearchBox.BackgroundTransparency = 1.000
HeHeHeHeUI.QuickSearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.QuickSearchBox.BorderSizePixel = 0
HeHeHeHeUI.QuickSearchBox.Position = UDim2.new(0.176333621, 0, 0.0900004059, 0)
HeHeHeHeUI.QuickSearchBox.Size = UDim2.new(0.791666687, 0, 0.800000012, 0)
HeHeHeHeUI.QuickSearchBox.ClearTextOnFocus = false
HeHeHeHeUI.QuickSearchBox.Font = Enum.Font.SourceSans
HeHeHeHeUI.QuickSearchBox.PlaceholderText = "Scripts Search"
HeHeHeHeUI.QuickSearchBox.Text = ""
HeHeHeHeUI.QuickSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.QuickSearchBox.TextSize = 14.000
HeHeHeHeUI.QuickSearchBox.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.KeyStatusFrame.Name = "KeyStatusFrame"
HeHeHeHeUI.KeyStatusFrame.Parent = HeHeHeHeUI.Left
HeHeHeHeUI.KeyStatusFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeHeHeHeUI.KeyStatusFrame.BackgroundTransparency = 0.700
HeHeHeHeUI.KeyStatusFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.KeyStatusFrame.BorderSizePixel = 0
HeHeHeHeUI.KeyStatusFrame.Position = UDim2.new(0.100000001, 0, 0.156000003, 0)
HeHeHeHeUI.KeyStatusFrame.Size = UDim2.new(0.800000012, 0, 0.164000005, 0)

HeHeHeHeUI.UICorner_4.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_4.Parent = HeHeHeHeUI.KeyStatusFrame

HeHeHeHeUI.ImageLabel_2.Parent = HeHeHeHeUI.KeyStatusFrame
HeHeHeHeUI.ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_2.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_2.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_2.Position = UDim2.new(0.0392857864, 0, 0.123365819, 0)
HeHeHeHeUI.ImageLabel_2.Size = UDim2.new(0.25, 0, 0.731707335, 0)
HeHeHeHeUI.ImageLabel_2.Image = "http://www.roblox.com/asset/?id=6031079158"

HeHeHeHeUI.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient.Rotation = 31
HeHeHeHeUI.UIGradient.Parent = HeHeHeHeUI.ImageLabel_2

HeHeHeHeUI.TextLabel.Parent = HeHeHeHeUI.KeyStatusFrame
HeHeHeHeUI.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel.BorderSizePixel = 0
HeHeHeHeUI.TextLabel.Position = UDim2.new(0.316666663, 0, 0.123365447, 0)
HeHeHeHeUI.TextLabel.Size = UDim2.new(0.645833313, 0, 0.243902445, 0)
HeHeHeHeUI.TextLabel.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel.Text = "Key System Status"
HeHeHeHeUI.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel.TextSize = 16.000
HeHeHeHeUI.TextLabel.TextWrapped = true
HeHeHeHeUI.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.KeyTimeLeft.Name = "KeyTimeLeft"
HeHeHeHeUI.KeyTimeLeft.Parent = HeHeHeHeUI.KeyStatusFrame
HeHeHeHeUI.KeyTimeLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.KeyTimeLeft.BackgroundTransparency = 1.000
HeHeHeHeUI.KeyTimeLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.KeyTimeLeft.BorderSizePixel = 0
HeHeHeHeUI.KeyTimeLeft.Position = UDim2.new(0.316666663, 0, 0.355072767, 0)
HeHeHeHeUI.KeyTimeLeft.Size = UDim2.new(0.645833313, 0, 0.121951222, 0)
HeHeHeHeUI.KeyTimeLeft.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.KeyTimeLeft.Text = "24:00:00"
HeHeHeHeUI.KeyTimeLeft.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.KeyTimeLeft.TextSize = 14.000
HeHeHeHeUI.KeyTimeLeft.TextTransparency = 0.500
HeHeHeHeUI.KeyTimeLeft.TextWrapped = true
HeHeHeHeUI.KeyTimeLeft.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.KeyTimeBack.Name = "KeyTimeBack"
HeHeHeHeUI.KeyTimeBack.Parent = HeHeHeHeUI.KeyStatusFrame
HeHeHeHeUI.KeyTimeBack.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
HeHeHeHeUI.KeyTimeBack.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.KeyTimeBack.BorderSizePixel = 0
HeHeHeHeUI.KeyTimeBack.Position = UDim2.new(0.316666663, 0, 0.597561002, 0)
HeHeHeHeUI.KeyTimeBack.Size = UDim2.new(0.625, 0, 0.170731708, 0)

HeHeHeHeUI.UICorner_5.CornerRadius = UDim.new(0, 15)
HeHeHeHeUI.UICorner_5.Parent = HeHeHeHeUI.KeyTimeBack

HeHeHeHeUI.KeyTimeIn.Name = "KeyTimeIn"
HeHeHeHeUI.KeyTimeIn.Parent = HeHeHeHeUI.KeyTimeBack
HeHeHeHeUI.KeyTimeIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.KeyTimeIn.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.KeyTimeIn.BorderSizePixel = 0
HeHeHeHeUI.KeyTimeIn.Size = UDim2.new(0.793333352, 0, 1, 0)

HeHeHeHeUI.UICorner_6.CornerRadius = UDim.new(0, 15)
HeHeHeHeUI.UICorner_6.Parent = HeHeHeHeUI.KeyTimeIn

HeHeHeHeUI.UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 141)), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_2.Parent = HeHeHeHeUI.KeyTimeIn

HeHeHeHeUI.TextLabel_2.Parent = HeHeHeHeUI.Left
HeHeHeHeUI.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_2.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_2.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_2.Position = UDim2.new(0.100000001, 0, 0.349365473, 0)
HeHeHeHeUI.TextLabel_2.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_2.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_2.Text = " DEVELOPERS"
HeHeHeHeUI.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_2.TextSize = 15.000
HeHeHeHeUI.TextLabel_2.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_2.TextWrapped = true
HeHeHeHeUI.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.DevList.Name = "DevList"
HeHeHeHeUI.DevList.Parent = HeHeHeHeUI.Left
HeHeHeHeUI.DevList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeHeHeHeUI.DevList.BackgroundTransparency = 1.000
HeHeHeHeUI.DevList.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DevList.BorderSizePixel = 0
HeHeHeHeUI.DevList.Position = UDim2.new(0.100000001, 0, 0.389999986, 0)
HeHeHeHeUI.DevList.Size = UDim2.new(0.800000012, 0, 0.312000006, 0)

HeHeHeHeUI.UICorner_7.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_7.Parent = HeHeHeHeUI.DevList

HeHeHeHeUI.UIListLayout.Parent = HeHeHeHeUI.DevList
HeHeHeHeUI.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

HeHeHeHeUI.DevTemplate1.Name = "DevTemplate1"
HeHeHeHeUI.DevTemplate1.Parent = HeHeHeHeUI.DevList
HeHeHeHeUI.DevTemplate1.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
HeHeHeHeUI.DevTemplate1.BackgroundTransparency = 0.900
HeHeHeHeUI.DevTemplate1.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DevTemplate1.BorderSizePixel = 0
HeHeHeHeUI.DevTemplate1.Size = UDim2.new(1, 0, 0.256410271, 0)

HeHeHeHeUI.UICorner_8.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_8.Parent = HeHeHeHeUI.DevTemplate1

HeHeHeHeUI.ImageLabel_3.Parent = HeHeHeHeUI.DevTemplate1
HeHeHeHeUI.ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_3.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_3.Position = UDim2.new(0.0392857864, 0, 0.112999722, 0)
HeHeHeHeUI.ImageLabel_3.Size = UDim2.new(0.125, 0, 0.74999994, 0)
HeHeHeHeUI.ImageLabel_3.Image = "rbxassetid://17899406673"

HeHeHeHeUI.UICorner_9.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_9.Parent = HeHeHeHeUI.ImageLabel_3

HeHeHeHeUI.Who.Name = "Who"
HeHeHeHeUI.Who.Parent = HeHeHeHeUI.DevTemplate1
HeHeHeHeUI.Who.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who.BackgroundTransparency = 1.000
HeHeHeHeUI.Who.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Who.BorderSizePixel = 0
HeHeHeHeUI.Who.Position = UDim2.new(0.212500006, 0, 0.0983657837, 0)
HeHeHeHeUI.Who.Size = UDim2.new(0.645833313, 0, 0.49999994, 0)
HeHeHeHeUI.Who.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Who.Text = "acsu123"
HeHeHeHeUI.Who.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who.TextSize = 16.000
HeHeHeHeUI.Who.TextWrapped = true
HeHeHeHeUI.Who.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Role.Name = "Role"
HeHeHeHeUI.Role.Parent = HeHeHeHeUI.DevTemplate1
HeHeHeHeUI.Role.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role.BackgroundTransparency = 1.000
HeHeHeHeUI.Role.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Role.BorderSizePixel = 0
HeHeHeHeUI.Role.Position = UDim2.new(0.212500006, 0, 0.580072761, 0)
HeHeHeHeUI.Role.Size = UDim2.new(0.645833313, 0, 0.24999997, 0)
HeHeHeHeUI.Role.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Role.Text = "Owner"
HeHeHeHeUI.Role.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role.TextSize = 14.000
HeHeHeHeUI.Role.TextTransparency = 0.500
HeHeHeHeUI.Role.TextWrapped = true
HeHeHeHeUI.Role.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.DevTemplate2.Name = "DevTemplate2"
HeHeHeHeUI.DevTemplate2.Parent = HeHeHeHeUI.DevList
HeHeHeHeUI.DevTemplate2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
HeHeHeHeUI.DevTemplate2.BackgroundTransparency = 0.900
HeHeHeHeUI.DevTemplate2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DevTemplate2.BorderSizePixel = 0
HeHeHeHeUI.DevTemplate2.Size = UDim2.new(1, 0, 0.256410271, 0)

HeHeHeHeUI.UICorner_10.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_10.Parent = HeHeHeHeUI.DevTemplate2

HeHeHeHeUI.ImageLabel_4.Parent = HeHeHeHeUI.DevTemplate2
HeHeHeHeUI.ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_4.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_4.Position = UDim2.new(0.0392857864, 0, 0.112999722, 0)
HeHeHeHeUI.ImageLabel_4.Size = UDim2.new(0.125, 0, 0.74999994, 0)
HeHeHeHeUI.ImageLabel_4.Image = "rbxassetid://17899406673"

HeHeHeHeUI.UICorner_11.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_11.Parent = HeHeHeHeUI.ImageLabel_4

HeHeHeHeUI.Who_2.Name = "Who"
HeHeHeHeUI.Who_2.Parent = HeHeHeHeUI.DevTemplate2
HeHeHeHeUI.Who_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Who_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Who_2.BorderSizePixel = 0
HeHeHeHeUI.Who_2.Position = UDim2.new(0.212500006, 0, 0.0983657837, 0)
HeHeHeHeUI.Who_2.Size = UDim2.new(0.645833313, 0, 0.49999994, 0)
HeHeHeHeUI.Who_2.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Who_2.Text = "acsu123"
HeHeHeHeUI.Who_2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who_2.TextSize = 16.000
HeHeHeHeUI.Who_2.TextWrapped = true
HeHeHeHeUI.Who_2.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Role_2.Name = "Role"
HeHeHeHeUI.Role_2.Parent = HeHeHeHeUI.DevTemplate2
HeHeHeHeUI.Role_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Role_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Role_2.BorderSizePixel = 0
HeHeHeHeUI.Role_2.Position = UDim2.new(0.212500006, 0, 0.580072761, 0)
HeHeHeHeUI.Role_2.Size = UDim2.new(0.645833313, 0, 0.24999997, 0)
HeHeHeHeUI.Role_2.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Role_2.Text = "Owner"
HeHeHeHeUI.Role_2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role_2.TextSize = 14.000
HeHeHeHeUI.Role_2.TextTransparency = 0.500
HeHeHeHeUI.Role_2.TextWrapped = true
HeHeHeHeUI.Role_2.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.DevTemplate3.Name = "DevTemplate3"
HeHeHeHeUI.DevTemplate3.Parent = HeHeHeHeUI.DevList
HeHeHeHeUI.DevTemplate3.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
HeHeHeHeUI.DevTemplate3.BackgroundTransparency = 0.900
HeHeHeHeUI.DevTemplate3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DevTemplate3.BorderSizePixel = 0
HeHeHeHeUI.DevTemplate3.Size = UDim2.new(1, 0, 0.256410271, 0)

HeHeHeHeUI.UICorner_12.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_12.Parent = HeHeHeHeUI.DevTemplate3

HeHeHeHeUI.ImageLabel_5.Parent = HeHeHeHeUI.DevTemplate3
HeHeHeHeUI.ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_5.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_5.Position = UDim2.new(0.0392857864, 0, 0.112999722, 0)
HeHeHeHeUI.ImageLabel_5.Size = UDim2.new(0.125, 0, 0.74999994, 0)
HeHeHeHeUI.ImageLabel_5.Image = "rbxassetid://17899406673"

HeHeHeHeUI.UICorner_13.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_13.Parent = HeHeHeHeUI.ImageLabel_5

HeHeHeHeUI.Who_3.Name = "Who"
HeHeHeHeUI.Who_3.Parent = HeHeHeHeUI.DevTemplate3
HeHeHeHeUI.Who_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who_3.BackgroundTransparency = 1.000
HeHeHeHeUI.Who_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Who_3.BorderSizePixel = 0
HeHeHeHeUI.Who_3.Position = UDim2.new(0.212500006, 0, 0.0983657837, 0)
HeHeHeHeUI.Who_3.Size = UDim2.new(0.645833313, 0, 0.49999994, 0)
HeHeHeHeUI.Who_3.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Who_3.Text = "acsu123"
HeHeHeHeUI.Who_3.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who_3.TextSize = 16.000
HeHeHeHeUI.Who_3.TextWrapped = true
HeHeHeHeUI.Who_3.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Role_3.Name = "Role"
HeHeHeHeUI.Role_3.Parent = HeHeHeHeUI.DevTemplate3
HeHeHeHeUI.Role_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role_3.BackgroundTransparency = 1.000
HeHeHeHeUI.Role_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Role_3.BorderSizePixel = 0
HeHeHeHeUI.Role_3.Position = UDim2.new(0.212500006, 0, 0.580072761, 0)
HeHeHeHeUI.Role_3.Size = UDim2.new(0.645833313, 0, 0.24999997, 0)
HeHeHeHeUI.Role_3.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Role_3.Text = "Owner"
HeHeHeHeUI.Role_3.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role_3.TextSize = 14.000
HeHeHeHeUI.Role_3.TextTransparency = 0.500
HeHeHeHeUI.Role_3.TextWrapped = true
HeHeHeHeUI.Role_3.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.DevTemplate4.Name = "DevTemplate4"
HeHeHeHeUI.DevTemplate4.Parent = HeHeHeHeUI.DevList
HeHeHeHeUI.DevTemplate4.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
HeHeHeHeUI.DevTemplate4.BackgroundTransparency = 0.900
HeHeHeHeUI.DevTemplate4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DevTemplate4.BorderSizePixel = 0
HeHeHeHeUI.DevTemplate4.Size = UDim2.new(1, 0, 0.256410271, 0)

HeHeHeHeUI.UICorner_14.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_14.Parent = HeHeHeHeUI.DevTemplate4

HeHeHeHeUI.ImageLabel_6.Parent = HeHeHeHeUI.DevTemplate4
HeHeHeHeUI.ImageLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_6.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_6.Position = UDim2.new(0.0392857864, 0, 0.112999722, 0)
HeHeHeHeUI.ImageLabel_6.Size = UDim2.new(0.125, 0, 0.74999994, 0)
HeHeHeHeUI.ImageLabel_6.Image = "rbxassetid://17899406673"

HeHeHeHeUI.UICorner_15.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_15.Parent = HeHeHeHeUI.ImageLabel_6

HeHeHeHeUI.Who_4.Name = "Who"
HeHeHeHeUI.Who_4.Parent = HeHeHeHeUI.DevTemplate4
HeHeHeHeUI.Who_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who_4.BackgroundTransparency = 1.000
HeHeHeHeUI.Who_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Who_4.BorderSizePixel = 0
HeHeHeHeUI.Who_4.Position = UDim2.new(0.212500006, 0, 0.0983657837, 0)
HeHeHeHeUI.Who_4.Size = UDim2.new(0.645833313, 0, 0.49999994, 0)
HeHeHeHeUI.Who_4.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Who_4.Text = "acsu123"
HeHeHeHeUI.Who_4.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Who_4.TextSize = 16.000
HeHeHeHeUI.Who_4.TextWrapped = true
HeHeHeHeUI.Who_4.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Role_4.Name = "Role"
HeHeHeHeUI.Role_4.Parent = HeHeHeHeUI.DevTemplate4
HeHeHeHeUI.Role_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role_4.BackgroundTransparency = 1.000
HeHeHeHeUI.Role_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Role_4.BorderSizePixel = 0
HeHeHeHeUI.Role_4.Position = UDim2.new(0.212500006, 0, 0.580072761, 0)
HeHeHeHeUI.Role_4.Size = UDim2.new(0.645833313, 0, 0.24999997, 0)
HeHeHeHeUI.Role_4.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Role_4.Text = "Owner"
HeHeHeHeUI.Role_4.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Role_4.TextSize = 14.000
HeHeHeHeUI.Role_4.TextTransparency = 0.500
HeHeHeHeUI.Role_4.TextWrapped = true
HeHeHeHeUI.Role_4.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.TextLabel_3.Parent = HeHeHeHeUI.Left
HeHeHeHeUI.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_3.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_3.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_3.Position = UDim2.new(0.100000001, 0, 0.727365494, 0)
HeHeHeHeUI.TextLabel_3.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_3.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_3.Text = " UPDATES"
HeHeHeHeUI.TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_3.TextSize = 15.000
HeHeHeHeUI.TextLabel_3.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_3.TextWrapped = true
HeHeHeHeUI.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UpdateFrames.Name = "UpdateFrames"
HeHeHeHeUI.UpdateFrames.Parent = HeHeHeHeUI.Left
HeHeHeHeUI.UpdateFrames.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeHeHeHeUI.UpdateFrames.BackgroundTransparency = 0.900
HeHeHeHeUI.UpdateFrames.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.UpdateFrames.BorderSizePixel = 0
HeHeHeHeUI.UpdateFrames.Position = UDim2.new(0.100000001, 0, 0.767365456, 0)
HeHeHeHeUI.UpdateFrames.Size = UDim2.new(0.800000012, 0, 0.202000007, 0)

HeHeHeHeUI.UICorner_16.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_16.Parent = HeHeHeHeUI.UpdateFrames

HeHeHeHeUI.UpdateLogLabel.Name = "UpdateLogLabel"
HeHeHeHeUI.UpdateLogLabel.Parent = HeHeHeHeUI.UpdateFrames
HeHeHeHeUI.UpdateLogLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.UpdateLogLabel.BackgroundTransparency = 1.000
HeHeHeHeUI.UpdateLogLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.UpdateLogLabel.BorderSizePixel = 0
HeHeHeHeUI.UpdateLogLabel.Position = UDim2.new(0.0416666679, 0, 0.0877461955, 0)
HeHeHeHeUI.UpdateLogLabel.Size = UDim2.new(0.920833349, 0, 0.148514852, 0)
HeHeHeHeUI.UpdateLogLabel.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.UpdateLogLabel.Text = "+ 04/10/2025 Executor Released!"
HeHeHeHeUI.UpdateLogLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.UpdateLogLabel.TextSize = 14.000
HeHeHeHeUI.UpdateLogLabel.TextTransparency = 0.500
HeHeHeHeUI.UpdateLogLabel.TextWrapped = true
HeHeHeHeUI.UpdateLogLabel.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UIListLayout_2.Parent = HeHeHeHeUI.UpdateFrames
HeHeHeHeUI.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIListLayout_2.Padding = UDim.new(0, 3)

HeHeHeHeUI.UIPadding.Parent = HeHeHeHeUI.UpdateFrames
HeHeHeHeUI.UIPadding.PaddingLeft = UDim.new(0, 10)
HeHeHeHeUI.UIPadding.PaddingTop = UDim.new(0, 5)

HeHeHeHeUI.UICorner_17.Parent = HeHeHeHeUI.Left

HeHeHeHeUI.Right.Name = "Right"
HeHeHeHeUI.Right.Parent = HeHeHeHeUI.HomePage
HeHeHeHeUI.Right.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Right.BackgroundTransparency = 0.300
HeHeHeHeUI.Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Right.BorderSizePixel = 0
HeHeHeHeUI.Right.Position = UDim2.new(0.410958916, 0, 0, 0)
HeHeHeHeUI.Right.Size = UDim2.new(0.589041114, 0, 1, 0)

HeHeHeHeUI.UICorner_18.Parent = HeHeHeHeUI.Right

HeHeHeHeUI.Right_2.Name = "Right"
HeHeHeHeUI.Right_2.Parent = HeHeHeHeUI.Right
HeHeHeHeUI.Right_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Right_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Right_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Right_2.BorderSizePixel = 0
HeHeHeHeUI.Right_2.Size = UDim2.new(1, 0, 0.108000003, 0)

HeHeHeHeUI.UICorner_19.Parent = HeHeHeHeUI.Right_2

HeHeHeHeUI.Username.Name = "Username"
HeHeHeHeUI.Username.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Username.BackgroundTransparency = 1.000
HeHeHeHeUI.Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Username.BorderSizePixel = 0
HeHeHeHeUI.Username.Position = UDim2.new(0.11899215, 0, 0, 0)
HeHeHeHeUI.Username.Size = UDim2.new(0.593023241, 0, 0.981481493, 0)
HeHeHeHeUI.Username.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Username.Text = "Welcome back, abc!"
HeHeHeHeUI.Username.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Username.TextSize = 20.000
HeHeHeHeUI.Username.TextWrapped = true
HeHeHeHeUI.Username.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Avatar.Name = "Avatar"
HeHeHeHeUI.Avatar.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.Avatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Avatar.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Avatar.BorderSizePixel = 0
HeHeHeHeUI.Avatar.Position = UDim2.new(0.0346346125, 0, 0.205592409, 0)
HeHeHeHeUI.Avatar.Size = UDim2.new(0.0697674453, 0, 0.555555582, 0)
HeHeHeHeUI.Avatar.Image = "rbxassetid://9456359598"

HeHeHeHeUI.UICorner_20.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_20.Parent = HeHeHeHeUI.Avatar

HeHeHeHeUI.Close2.Name = "Close2"
HeHeHeHeUI.Close2.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.Close2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Close2.BackgroundTransparency = 1.000
HeHeHeHeUI.Close2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Close2.BorderSizePixel = 0
HeHeHeHeUI.Close2.Position = UDim2.new(0.896345556, 0, 0.107407466, 0)
HeHeHeHeUI.Close2.Size = UDim2.new(0.0813953504, 0, 0.648148119, 0)
HeHeHeHeUI.Close2.Image = "http://www.roblox.com/asset/?id=6031094678"

HeHeHeHeUI.Close1.Name = "Close1"
HeHeHeHeUI.Close1.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.Close1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Close1.BackgroundTransparency = 1.000
HeHeHeHeUI.Close1.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Close1.BorderSizePixel = 0
HeHeHeHeUI.Close1.Position = UDim2.new(0.814950228, 0, 0.107407466, 0)
HeHeHeHeUI.Close1.Size = UDim2.new(0.0813953504, 0, 0.648148119, 0)
HeHeHeHeUI.Close1.Image = "http://www.roblox.com/asset/?id=6031094681"

HeHeHeHeUI.CodeHolder.Name = "CodeHolder"
HeHeHeHeUI.CodeHolder.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.CodeHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.CodeHolder.BackgroundTransparency = 1.000
HeHeHeHeUI.CodeHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.CodeHolder.BorderSizePixel = 0
HeHeHeHeUI.CodeHolder.Position = UDim2.new(0.0346344709, 0, 1.44444442, 0)
HeHeHeHeUI.CodeHolder.Size = UDim2.new(0.941860437, 0, 5.64814806, 0)

HeHeHeHeUI.HightLight.Name = "HightLight"
HeHeHeHeUI.HightLight.Parent = HeHeHeHeUI.CodeHolder
HeHeHeHeUI.HightLight.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
HeHeHeHeUI.HightLight.BackgroundTransparency = 1.000
HeHeHeHeUI.HightLight.BorderColor3 = Color3.fromRGB(61, 61, 61)
HeHeHeHeUI.HightLight.Position = UDim2.new(0, 0, 0.109034404, 0)
HeHeHeHeUI.HightLight.Size = UDim2.new(1, 0, 0.888524592, 0)
HeHeHeHeUI.HightLight.ZIndex = 3
HeHeHeHeUI.HightLight.BottomImage = "rbxassetid://148970562"
HeHeHeHeUI.HightLight.CanvasSize = UDim2.new(30, 0, 30, 0)
HeHeHeHeUI.HightLight.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
HeHeHeHeUI.HightLight.MidImage = "rbxassetid://148970562"
HeHeHeHeUI.HightLight.ScrollBarThickness = 5
HeHeHeHeUI.HightLight.TopImage = "rbxassetid://148970562"

HeHeHeHeUI.Source.Name = "Source"
HeHeHeHeUI.Source.Parent = HeHeHeHeUI.HightLight
HeHeHeHeUI.Source.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Source.BackgroundTransparency = 1.000
HeHeHeHeUI.Source.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Source.Position = UDim2.new(0.002, 0, 0, 0)
HeHeHeHeUI.Source.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Source.ZIndex = 3
HeHeHeHeUI.Source.ClearTextOnFocus = false
HeHeHeHeUI.Source.Font = Enum.Font.Code
HeHeHeHeUI.Source.MultiLine = true
HeHeHeHeUI.Source.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
HeHeHeHeUI.Source.Text = "print(\"acsu was here!\")"
HeHeHeHeUI.Source.TextColor3 = Color3.fromRGB(204, 204, 204)
HeHeHeHeUI.Source.TextSize = 15.000
HeHeHeHeUI.Source.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Source.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Comments_.Name = "Comments_"
HeHeHeHeUI.Comments_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.Comments_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Comments_.BackgroundTransparency = 1.000
HeHeHeHeUI.Comments_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Comments_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Comments_.ZIndex = 5
HeHeHeHeUI.Comments_.Font = Enum.Font.Code
HeHeHeHeUI.Comments_.Text = ""
HeHeHeHeUI.Comments_.TextColor3 = Color3.fromRGB(59, 200, 59)
HeHeHeHeUI.Comments_.TextSize = 15.000
HeHeHeHeUI.Comments_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Comments_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Globals_.Name = "Globals_"
HeHeHeHeUI.Globals_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.Globals_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Globals_.BackgroundTransparency = 1.000
HeHeHeHeUI.Globals_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Globals_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Globals_.ZIndex = 5
HeHeHeHeUI.Globals_.Font = Enum.Font.Code
HeHeHeHeUI.Globals_.Text = ""
HeHeHeHeUI.Globals_.TextColor3 = Color3.fromRGB(132, 214, 247)
HeHeHeHeUI.Globals_.TextSize = 15.000
HeHeHeHeUI.Globals_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Globals_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Keywords_.Name = "Keywords_"
HeHeHeHeUI.Keywords_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.Keywords_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Keywords_.BackgroundTransparency = 1.000
HeHeHeHeUI.Keywords_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Keywords_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Keywords_.ZIndex = 5
HeHeHeHeUI.Keywords_.Font = Enum.Font.Code
HeHeHeHeUI.Keywords_.Text = ""
HeHeHeHeUI.Keywords_.TextColor3 = Color3.fromRGB(248, 109, 124)
HeHeHeHeUI.Keywords_.TextSize = 15.000
HeHeHeHeUI.Keywords_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Keywords_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.RemoteHighlight_.Name = "RemoteHighlight_"
HeHeHeHeUI.RemoteHighlight_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.RemoteHighlight_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.RemoteHighlight_.BackgroundTransparency = 1.000
HeHeHeHeUI.RemoteHighlight_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.RemoteHighlight_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.RemoteHighlight_.ZIndex = 5
HeHeHeHeUI.RemoteHighlight_.Font = Enum.Font.Code
HeHeHeHeUI.RemoteHighlight_.Text = ""
HeHeHeHeUI.RemoteHighlight_.TextColor3 = Color3.fromRGB(0, 144, 255)
HeHeHeHeUI.RemoteHighlight_.TextSize = 15.000
HeHeHeHeUI.RemoteHighlight_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.RemoteHighlight_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Strings_.Name = "Strings_"
HeHeHeHeUI.Strings_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.Strings_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Strings_.BackgroundTransparency = 1.000
HeHeHeHeUI.Strings_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Strings_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Strings_.ZIndex = 5
HeHeHeHeUI.Strings_.Font = Enum.Font.Code
HeHeHeHeUI.Strings_.Text = ""
HeHeHeHeUI.Strings_.TextColor3 = Color3.fromRGB(173, 241, 149)
HeHeHeHeUI.Strings_.TextSize = 15.000
HeHeHeHeUI.Strings_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Strings_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Tokens_.Name = "Tokens_"
HeHeHeHeUI.Tokens_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.Tokens_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Tokens_.BackgroundTransparency = 1.000
HeHeHeHeUI.Tokens_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Tokens_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Tokens_.ZIndex = 5
HeHeHeHeUI.Tokens_.Font = Enum.Font.Code
HeHeHeHeUI.Tokens_.Text = ""
HeHeHeHeUI.Tokens_.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Tokens_.TextSize = 15.000
HeHeHeHeUI.Tokens_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Tokens_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Numbers_.Name = "Numbers_"
HeHeHeHeUI.Numbers_.Parent = HeHeHeHeUI.Source
HeHeHeHeUI.Numbers_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Numbers_.BackgroundTransparency = 1.000
HeHeHeHeUI.Numbers_.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Numbers_.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Numbers_.ZIndex = 4
HeHeHeHeUI.Numbers_.Font = Enum.Font.Code
HeHeHeHeUI.Numbers_.Text = ""
HeHeHeHeUI.Numbers_.TextColor3 = Color3.fromRGB(255, 198, 0)
HeHeHeHeUI.Numbers_.TextSize = 15.000
HeHeHeHeUI.Numbers_.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Numbers_.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Lines.Name = "Lines"
HeHeHeHeUI.Lines.Parent = HeHeHeHeUI.HightLight
HeHeHeHeUI.Lines.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Lines.BackgroundTransparency = 1.000
HeHeHeHeUI.Lines.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Lines.Size = UDim2.new(0, 30, 1, 0)
HeHeHeHeUI.Lines.ZIndex = 4
HeHeHeHeUI.Lines.Font = Enum.Font.Code
HeHeHeHeUI.Lines.Text = "1"
HeHeHeHeUI.Lines.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Lines.TextSize = 15.000
HeHeHeHeUI.Lines.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.UICorner_21.Parent = HeHeHeHeUI.CodeHolder

HeHeHeHeUI.TextLabel_4.Parent = HeHeHeHeUI.CodeHolder
HeHeHeHeUI.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_4.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_4.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_4.Position = UDim2.new(0.0177576132, 0, 0.0229508188, 0)
HeHeHeHeUI.TextLabel_4.Size = UDim2.new(0.683950603, 0, 0.0491803288, 0)
HeHeHeHeUI.TextLabel_4.Font = Enum.Font.Code
HeHeHeHeUI.TextLabel_4.Text = "🔴 🟡 🟢 "
HeHeHeHeUI.TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_4.TextSize = 15.000
HeHeHeHeUI.TextLabel_4.TextWrapped = true
HeHeHeHeUI.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.ScriptTabsPage.Name = "ScriptTabsPage"
HeHeHeHeUI.ScriptTabsPage.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.ScriptTabsPage.Active = true
HeHeHeHeUI.ScriptTabsPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ScriptTabsPage.BackgroundTransparency = 1.000
HeHeHeHeUI.ScriptTabsPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ScriptTabsPage.BorderSizePixel = 0
HeHeHeHeUI.ScriptTabsPage.Position = UDim2.new(0.0348837227, 0, 7.12962961, 0)
HeHeHeHeUI.ScriptTabsPage.Size = UDim2.new(0.939534903, 0, 0.462962955, 0)
HeHeHeHeUI.ScriptTabsPage.CanvasSize = UDim2.new(2, 0, 0, 0)
HeHeHeHeUI.ScriptTabsPage.ScrollBarThickness = 2

HeHeHeHeUI.UIListLayout_3.Parent = HeHeHeHeUI.ScriptTabsPage
HeHeHeHeUI.UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
HeHeHeHeUI.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

HeHeHeHeUI.AddScripts.Name = "AddScripts"
HeHeHeHeUI.AddScripts.Parent = HeHeHeHeUI.ScriptTabsPage
HeHeHeHeUI.AddScripts.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.AddScripts.BackgroundTransparency = 1.000
HeHeHeHeUI.AddScripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.AddScripts.BorderSizePixel = 0
HeHeHeHeUI.AddScripts.Position = UDim2.new(0.728395045, 0, 0, 0)
HeHeHeHeUI.AddScripts.Size = UDim2.new(0, 25, 0, 25)
HeHeHeHeUI.AddScripts.Font = Enum.Font.Unknown
HeHeHeHeUI.AddScripts.Text = "+"
HeHeHeHeUI.AddScripts.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.AddScripts.TextScaled = true
HeHeHeHeUI.AddScripts.TextSize = 14.000
HeHeHeHeUI.AddScripts.TextWrapped = true

HeHeHeHeUI.UICorner_22.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_22.Parent = HeHeHeHeUI.AddScripts

HeHeHeHeUI.ExScript1.Name = "ExScript1"
HeHeHeHeUI.ExScript1.Parent = HeHeHeHeUI.ScriptTabsPage
HeHeHeHeUI.ExScript1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExScript1.BackgroundTransparency = 0.700
HeHeHeHeUI.ExScript1.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExScript1.BorderSizePixel = 0
HeHeHeHeUI.ExScript1.Position = UDim2.new(0, 0, 10.1481485, 0)
HeHeHeHeUI.ExScript1.Size = UDim2.new(0, 81, 0, 25)
HeHeHeHeUI.ExScript1.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ExScript1.Text = "     Script 1"
HeHeHeHeUI.ExScript1.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExScript1.TextSize = 14.000
HeHeHeHeUI.ExScript1.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UICorner_23.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_23.Parent = HeHeHeHeUI.ExScript1

HeHeHeHeUI.DeleteScript.Name = "DeleteScript"
HeHeHeHeUI.DeleteScript.Parent = HeHeHeHeUI.ExScript1
HeHeHeHeUI.DeleteScript.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeleteScript.BackgroundTransparency = 1.000
HeHeHeHeUI.DeleteScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeleteScript.BorderSizePixel = 0
HeHeHeHeUI.DeleteScript.Position = UDim2.new(0.728395045, 0, 0, 0)
HeHeHeHeUI.DeleteScript.Size = UDim2.new(0.30864197, 0, 1, 0)
HeHeHeHeUI.DeleteScript.Font = Enum.Font.Nunito
HeHeHeHeUI.DeleteScript.Text = "X"
HeHeHeHeUI.DeleteScript.TextColor3 = Color3.fromRGB(255, 0, 0)
HeHeHeHeUI.DeleteScript.TextScaled = true
HeHeHeHeUI.DeleteScript.TextSize = 14.000
HeHeHeHeUI.DeleteScript.TextWrapped = true

HeHeHeHeUI.UICorner_24.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_24.Parent = HeHeHeHeUI.DeleteScript

HeHeHeHeUI.ExScript2.Name = "ExScript2"
HeHeHeHeUI.ExScript2.Parent = HeHeHeHeUI.ScriptTabsPage
HeHeHeHeUI.ExScript2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExScript2.BackgroundTransparency = 1.000
HeHeHeHeUI.ExScript2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExScript2.BorderSizePixel = 0
HeHeHeHeUI.ExScript2.Position = UDim2.new(0, 0, 10.1481485, 0)
HeHeHeHeUI.ExScript2.Size = UDim2.new(0, 81, 0, 25)
HeHeHeHeUI.ExScript2.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ExScript2.Text = "     Script 2"
HeHeHeHeUI.ExScript2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExScript2.TextSize = 14.000
HeHeHeHeUI.ExScript2.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UICorner_25.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_25.Parent = HeHeHeHeUI.ExScript2

HeHeHeHeUI.DeleteScript_2.Name = "DeleteScript"
HeHeHeHeUI.DeleteScript_2.Parent = HeHeHeHeUI.ExScript2
HeHeHeHeUI.DeleteScript_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeleteScript_2.BackgroundTransparency = 1.000
HeHeHeHeUI.DeleteScript_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeleteScript_2.BorderSizePixel = 0
HeHeHeHeUI.DeleteScript_2.Position = UDim2.new(0.728395045, 0, 0, 0)
HeHeHeHeUI.DeleteScript_2.Size = UDim2.new(0.30864197, 0, 1, 0)
HeHeHeHeUI.DeleteScript_2.Font = Enum.Font.Nunito
HeHeHeHeUI.DeleteScript_2.Text = "X"
HeHeHeHeUI.DeleteScript_2.TextColor3 = Color3.fromRGB(255, 0, 0)
HeHeHeHeUI.DeleteScript_2.TextScaled = true
HeHeHeHeUI.DeleteScript_2.TextSize = 14.000
HeHeHeHeUI.DeleteScript_2.TextWrapped = true

HeHeHeHeUI.UICorner_26.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_26.Parent = HeHeHeHeUI.DeleteScript_2

HeHeHeHeUI.ExecuteScript.Name = "ExecuteScript"
HeHeHeHeUI.ExecuteScript.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.ExecuteScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExecuteScript.BackgroundTransparency = 0.500
HeHeHeHeUI.ExecuteScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExecuteScript.BorderSizePixel = 0
HeHeHeHeUI.ExecuteScript.ClipsDescendants = true
HeHeHeHeUI.ExecuteScript.Position = UDim2.new(0.0325581394, 0, 7.85185194, 0)
HeHeHeHeUI.ExecuteScript.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.ExecuteScript.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ExecuteScript.Text = "Execute"
HeHeHeHeUI.ExecuteScript.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExecuteScript.TextSize = 16.000
HeHeHeHeUI.ExecuteScript.TextTransparency = 1.000

HeHeHeHeUI.UICorner_27.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_27.Parent = HeHeHeHeUI.ExecuteScript

HeHeHeHeUI.UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_3.Rotation = 31
HeHeHeHeUI.UIGradient_3.Parent = HeHeHeHeUI.ExecuteScript

HeHeHeHeUI.ImageLabel_7.Parent = HeHeHeHeUI.ExecuteScript
HeHeHeHeUI.ImageLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_7.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_7.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_7.Position = UDim2.new(-0.33432129, 0, -0.653061211, 0)
HeHeHeHeUI.ImageLabel_7.Size = UDim2.new(1.33333337, 0, 2.04081631, 0)
HeHeHeHeUI.ImageLabel_7.ZIndex = 0
HeHeHeHeUI.ImageLabel_7.Image = "http://www.roblox.com/asset/?id=6026663699"
HeHeHeHeUI.ImageLabel_7.ImageColor3 = Color3.fromRGB(85, 255, 0)
HeHeHeHeUI.ImageLabel_7.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_5.Parent = HeHeHeHeUI.ExecuteScript
HeHeHeHeUI.TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_5.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_5.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_5.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_5.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_5.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_5.Text = "Execute"
HeHeHeHeUI.TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_5.TextSize = 16.000
HeHeHeHeUI.TextLabel_5.TextWrapped = true

HeHeHeHeUI.ClearScript.Name = "ClearScript"
HeHeHeHeUI.ClearScript.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.ClearScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ClearScript.BackgroundTransparency = 0.500
HeHeHeHeUI.ClearScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ClearScript.BorderSizePixel = 0
HeHeHeHeUI.ClearScript.ClipsDescendants = true
HeHeHeHeUI.ClearScript.Position = UDim2.new(0.25, 0, 7.85185194, 0)
HeHeHeHeUI.ClearScript.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.ClearScript.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ClearScript.Text = "Clear"
HeHeHeHeUI.ClearScript.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ClearScript.TextSize = 16.000
HeHeHeHeUI.ClearScript.TextTransparency = 1.000

HeHeHeHeUI.UICorner_28.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_28.Parent = HeHeHeHeUI.ClearScript

HeHeHeHeUI.UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_4.Rotation = 31
HeHeHeHeUI.UIGradient_4.Parent = HeHeHeHeUI.ClearScript

HeHeHeHeUI.ImageLabel_8.Parent = HeHeHeHeUI.ClearScript
HeHeHeHeUI.ImageLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_8.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_8.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_8.Position = UDim2.new(-0.280987948, 0, -0.653061211, 0)
HeHeHeHeUI.ImageLabel_8.Size = UDim2.new(1.33333337, 0, 2.04081631, 0)
HeHeHeHeUI.ImageLabel_8.ZIndex = 0
HeHeHeHeUI.ImageLabel_8.Image = "http://www.roblox.com/asset/?id=6034767619"
HeHeHeHeUI.ImageLabel_8.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_6.Parent = HeHeHeHeUI.ClearScript
HeHeHeHeUI.TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_6.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_6.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_6.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_6.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_6.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_6.Text = "Clear"
HeHeHeHeUI.TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_6.TextSize = 16.000
HeHeHeHeUI.TextLabel_6.TextWrapped = true

HeHeHeHeUI.CopyScript.Name = "CopyScript"
HeHeHeHeUI.CopyScript.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.CopyScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.CopyScript.BackgroundTransparency = 0.500
HeHeHeHeUI.CopyScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.CopyScript.BorderSizePixel = 0
HeHeHeHeUI.CopyScript.ClipsDescendants = true
HeHeHeHeUI.CopyScript.Position = UDim2.new(0.467000008, 0, 7.85185194, 0)
HeHeHeHeUI.CopyScript.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.CopyScript.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.CopyScript.Text = "Copy"
HeHeHeHeUI.CopyScript.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.CopyScript.TextSize = 16.000
HeHeHeHeUI.CopyScript.TextTransparency = 1.000

HeHeHeHeUI.UICorner_29.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_29.Parent = HeHeHeHeUI.CopyScript

HeHeHeHeUI.UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_5.Rotation = 31
HeHeHeHeUI.UIGradient_5.Parent = HeHeHeHeUI.CopyScript

HeHeHeHeUI.ImageLabel_9.Parent = HeHeHeHeUI.CopyScript
HeHeHeHeUI.ImageLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_9.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_9.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_9.Position = UDim2.new(0.0390120447, 0, 0, 0)
HeHeHeHeUI.ImageLabel_9.Size = UDim2.new(0.959999979, 0, 1.38775516, 0)
HeHeHeHeUI.ImageLabel_9.ZIndex = 0
HeHeHeHeUI.ImageLabel_9.Image = "http://www.roblox.com/asset/?id=6035053278"
HeHeHeHeUI.ImageLabel_9.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_7.Parent = HeHeHeHeUI.CopyScript
HeHeHeHeUI.TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_7.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_7.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_7.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_7.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_7.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_7.Text = "Copy"
HeHeHeHeUI.TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_7.TextSize = 16.000
HeHeHeHeUI.TextLabel_7.TextWrapped = true

HeHeHeHeUI.PasteScript.Name = "PasteScript"
HeHeHeHeUI.PasteScript.Parent = HeHeHeHeUI.Right_2
HeHeHeHeUI.PasteScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.PasteScript.BackgroundTransparency = 0.500
HeHeHeHeUI.PasteScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.PasteScript.BorderSizePixel = 0
HeHeHeHeUI.PasteScript.ClipsDescendants = true
HeHeHeHeUI.PasteScript.Position = UDim2.new(0.684000015, 0, 7.85185194, 0)
HeHeHeHeUI.PasteScript.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.PasteScript.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.PasteScript.Text = "Paste"
HeHeHeHeUI.PasteScript.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.PasteScript.TextSize = 16.000
HeHeHeHeUI.PasteScript.TextTransparency = 1.000

HeHeHeHeUI.UICorner_30.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_30.Parent = HeHeHeHeUI.PasteScript

HeHeHeHeUI.UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_6.Rotation = 31
HeHeHeHeUI.UIGradient_6.Parent = HeHeHeHeUI.PasteScript

HeHeHeHeUI.ImageLabel_10.Parent = HeHeHeHeUI.PasteScript
HeHeHeHeUI.ImageLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_10.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_10.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_10.Position = UDim2.new(-0.120987959, 0, 0, 0)
HeHeHeHeUI.ImageLabel_10.Size = UDim2.new(0.986666679, 0, 1.38775516, 0)
HeHeHeHeUI.ImageLabel_10.ZIndex = 0
HeHeHeHeUI.ImageLabel_10.Image = "http://www.roblox.com/asset/?id=6035053285"
HeHeHeHeUI.ImageLabel_10.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_8.Parent = HeHeHeHeUI.PasteScript
HeHeHeHeUI.TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_8.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_8.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_8.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_8.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_8.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_8.Text = "Paste"
HeHeHeHeUI.TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_8.TextSize = 16.000
HeHeHeHeUI.TextLabel_8.TextWrapped = true

HeHeHeHeUI.ScriptPage.Name = "ScriptPage"
HeHeHeHeUI.ScriptPage.Parent = HeHeHeHeUI.BackFrame
HeHeHeHeUI.ScriptPage.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.ScriptPage.BackgroundTransparency = 1.000
HeHeHeHeUI.ScriptPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ScriptPage.BorderSizePixel = 0
HeHeHeHeUI.ScriptPage.Position = UDim2.new(0.0874999985, 0, 0, 0)
HeHeHeHeUI.ScriptPage.Size = UDim2.new(0.912500024, 0, 1, 0)
HeHeHeHeUI.ScriptPage.Visible = false

HeHeHeHeUI.Left_2.Name = "Left"
HeHeHeHeUI.Left_2.Parent = HeHeHeHeUI.ScriptPage
HeHeHeHeUI.Left_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Left_2.BackgroundTransparency = 0.300
HeHeHeHeUI.Left_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Left_2.BorderSizePixel = 0
HeHeHeHeUI.Left_2.Size = UDim2.new(0.410958916, 0, 1, 0)

HeHeHeHeUI.TextLabel_9.Parent = HeHeHeHeUI.Left_2
HeHeHeHeUI.TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_9.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_9.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_9.Position = UDim2.new(0.100000001, 0, 0.349365473, 0)
HeHeHeHeUI.TextLabel_9.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_9.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_9.Text = " POPULAR SCRIPTS"
HeHeHeHeUI.TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_9.TextSize = 15.000
HeHeHeHeUI.TextLabel_9.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_9.TextWrapped = true
HeHeHeHeUI.TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.PopularScriptTabs.Name = "PopularScriptTabs"
HeHeHeHeUI.PopularScriptTabs.Parent = HeHeHeHeUI.Left_2
HeHeHeHeUI.PopularScriptTabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeHeHeHeUI.PopularScriptTabs.BackgroundTransparency = 1.000
HeHeHeHeUI.PopularScriptTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.PopularScriptTabs.BorderSizePixel = 0
HeHeHeHeUI.PopularScriptTabs.Position = UDim2.new(0.100000001, 0, 0.407999992, 0)
HeHeHeHeUI.PopularScriptTabs.Size = UDim2.new(0.800000012, 0, 0.537999988, 0)

HeHeHeHeUI.UICorner_31.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_31.Parent = HeHeHeHeUI.PopularScriptTabs

HeHeHeHeUI.UIListLayout_4.Parent = HeHeHeHeUI.PopularScriptTabs
HeHeHeHeUI.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIListLayout_4.Padding = UDim.new(0, 3)

HeHeHeHeUI.ExPopularScript.Name = "ExPopularScript"
HeHeHeHeUI.ExPopularScript.Parent = HeHeHeHeUI.PopularScriptTabs
HeHeHeHeUI.ExPopularScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExPopularScript.BackgroundTransparency = 0.500
HeHeHeHeUI.ExPopularScript.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExPopularScript.BorderSizePixel = 0
HeHeHeHeUI.ExPopularScript.ClipsDescendants = true
HeHeHeHeUI.ExPopularScript.Position = UDim2.new(0.0325581394, 0, 7.85185194, 0)
HeHeHeHeUI.ExPopularScript.Size = UDim2.new(1, 0, 0.111524165, 0)
HeHeHeHeUI.ExPopularScript.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ExPopularScript.Text = "Execute"
HeHeHeHeUI.ExPopularScript.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExPopularScript.TextSize = 16.000
HeHeHeHeUI.ExPopularScript.TextTransparency = 1.000

HeHeHeHeUI.UICorner_32.CornerRadius = UDim.new(0, 50)
HeHeHeHeUI.UICorner_32.Parent = HeHeHeHeUI.ExPopularScript

HeHeHeHeUI.UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 85, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 170, 127))}
HeHeHeHeUI.UIGradient_7.Parent = HeHeHeHeUI.ExPopularScript

HeHeHeHeUI.ExPopularLabel.Name = "ExPopularLabel"
HeHeHeHeUI.ExPopularLabel.Parent = HeHeHeHeUI.ExPopularScript
HeHeHeHeUI.ExPopularLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExPopularLabel.BackgroundTransparency = 1.000
HeHeHeHeUI.ExPopularLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExPopularLabel.BorderSizePixel = 0
HeHeHeHeUI.ExPopularLabel.Position = UDim2.new(0.0416666679, 0, 0.148706049, 0)
HeHeHeHeUI.ExPopularLabel.Size = UDim2.new(0.899999976, 0, 0.666666687, 0)
HeHeHeHeUI.ExPopularLabel.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ExPopularLabel.Text = "DEX Explorer"
HeHeHeHeUI.ExPopularLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExPopularLabel.TextSize = 16.000
HeHeHeHeUI.ExPopularLabel.TextWrapped = true
HeHeHeHeUI.ExPopularLabel.TextXAlignment = Enum.TextXAlignment.Right

HeHeHeHeUI.ImageLabel_11.Parent = HeHeHeHeUI.ExPopularScript
HeHeHeHeUI.ImageLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_11.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_11.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_11.Position = UDim2.new(0.0390000008, 0, 0.100000001, 0)
HeHeHeHeUI.ImageLabel_11.Size = UDim2.new(0.104166664, 0, 0.833333313, 0)
HeHeHeHeUI.ImageLabel_11.Image = "http://www.roblox.com/asset/?id=6026568210"

HeHeHeHeUI.TextLabel_10.Parent = HeHeHeHeUI.Left_2
HeHeHeHeUI.TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_10.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_10.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_10.Position = UDim2.new(0.100000001, 0, 0.0313654803, 0)
HeHeHeHeUI.TextLabel_10.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_10.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_10.Text = " LOCAL PLAYER"
HeHeHeHeUI.TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_10.TextSize = 15.000
HeHeHeHeUI.TextLabel_10.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_10.TextWrapped = true
HeHeHeHeUI.TextLabel_10.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UICorner_33.Parent = HeHeHeHeUI.Left_2

HeHeHeHeUI.LocalPlayerTabs.Name = "LocalPlayerTabs"
HeHeHeHeUI.LocalPlayerTabs.Parent = HeHeHeHeUI.Left_2
HeHeHeHeUI.LocalPlayerTabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeHeHeHeUI.LocalPlayerTabs.BackgroundTransparency = 1.000
HeHeHeHeUI.LocalPlayerTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.LocalPlayerTabs.BorderSizePixel = 0
HeHeHeHeUI.LocalPlayerTabs.Position = UDim2.new(0.100000001, 0, 0.0822039768, 0)
HeHeHeHeUI.LocalPlayerTabs.Size = UDim2.new(0.800000012, 0, 0.266000003, 0)

HeHeHeHeUI.UICorner_34.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_34.Parent = HeHeHeHeUI.LocalPlayerTabs

HeHeHeHeUI.UIListLayout_5.Parent = HeHeHeHeUI.LocalPlayerTabs
HeHeHeHeUI.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIListLayout_5.Padding = UDim.new(0, 3)

HeHeHeHeUI.SpeedChange.Name = "SpeedChange"
HeHeHeHeUI.SpeedChange.Parent = HeHeHeHeUI.LocalPlayerTabs
HeHeHeHeUI.SpeedChange.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.SpeedChange.BackgroundTransparency = 1.000
HeHeHeHeUI.SpeedChange.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.SpeedChange.BorderSizePixel = 0
HeHeHeHeUI.SpeedChange.Size = UDim2.new(1, 0, 0.263157904, 0)

HeHeHeHeUI.Back.Name = "Back"
HeHeHeHeUI.Back.Parent = HeHeHeHeUI.SpeedChange
HeHeHeHeUI.Back.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
HeHeHeHeUI.Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Back.BorderSizePixel = 0
HeHeHeHeUI.Back.Position = UDim2.new(0, 0, 0.060493689, 0)
HeHeHeHeUI.Back.Size = UDim2.new(0.791666687, 0, 0.828571439, 0)

HeHeHeHeUI.UICorner_35.CornerRadius = UDim.new(0, 4)
HeHeHeHeUI.UICorner_35.Parent = HeHeHeHeUI.Back

HeHeHeHeUI.In.Name = "In"
HeHeHeHeUI.In.Parent = HeHeHeHeUI.Back
HeHeHeHeUI.In.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.In.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.In.BorderSizePixel = 0
HeHeHeHeUI.In.Size = UDim2.new(0.589473665, 0, 1, 0)

HeHeHeHeUI.UICorner_36.CornerRadius = UDim.new(0, 4)
HeHeHeHeUI.UICorner_36.Parent = HeHeHeHeUI.In

HeHeHeHeUI.UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 255))}
HeHeHeHeUI.UIGradient_8.Parent = HeHeHeHeUI.In

HeHeHeHeUI.TextLabel_11.Parent = HeHeHeHeUI.Back
HeHeHeHeUI.TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_11.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_11.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_11.Position = UDim2.new(0, 0, 0.14870584, 0)
HeHeHeHeUI.TextLabel_11.Size = UDim2.new(0.99473685, 0, 0.689655185, 0)
HeHeHeHeUI.TextLabel_11.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_11.Text = "Speed (50%)"
HeHeHeHeUI.TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_11.TextSize = 16.000
HeHeHeHeUI.TextLabel_11.TextStrokeTransparency = 0.700
HeHeHeHeUI.TextLabel_11.TextWrapped = true

HeHeHeHeUI.Active.Name = "Active"
HeHeHeHeUI.Active.Parent = HeHeHeHeUI.SpeedChange
HeHeHeHeUI.Active.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Active.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Active.BorderSizePixel = 0
HeHeHeHeUI.Active.Position = UDim2.new(0.837499976, 0, 0.0571428575, 0)
HeHeHeHeUI.Active.Size = UDim2.new(0.12083333, 0, 0.828571439, 0)
HeHeHeHeUI.Active.Image = "http://www.roblox.com/asset/?id=6034754445"
HeHeHeHeUI.Active.ImageColor3 = Color3.fromRGB(140, 140, 140)

HeHeHeHeUI.UICorner_37.CornerRadius = UDim.new(0, 100)
HeHeHeHeUI.UICorner_37.Parent = HeHeHeHeUI.Active

HeHeHeHeUI.UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 255))}
HeHeHeHeUI.UIGradient_9.Parent = HeHeHeHeUI.Active

HeHeHeHeUI.JumpChange.Name = "JumpChange"
HeHeHeHeUI.JumpChange.Parent = HeHeHeHeUI.LocalPlayerTabs
HeHeHeHeUI.JumpChange.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.JumpChange.BackgroundTransparency = 1.000
HeHeHeHeUI.JumpChange.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.JumpChange.BorderSizePixel = 0
HeHeHeHeUI.JumpChange.Size = UDim2.new(1, 0, 0.263157904, 0)

HeHeHeHeUI.Back_2.Name = "Back"
HeHeHeHeUI.Back_2.Parent = HeHeHeHeUI.JumpChange
HeHeHeHeUI.Back_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
HeHeHeHeUI.Back_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Back_2.BorderSizePixel = 0
HeHeHeHeUI.Back_2.Position = UDim2.new(0, 0, 0.060493689, 0)
HeHeHeHeUI.Back_2.Size = UDim2.new(0.791666687, 0, 0.828571439, 0)

HeHeHeHeUI.UICorner_38.CornerRadius = UDim.new(0, 4)
HeHeHeHeUI.UICorner_38.Parent = HeHeHeHeUI.Back_2

HeHeHeHeUI.In_2.Name = "In"
HeHeHeHeUI.In_2.Parent = HeHeHeHeUI.Back_2
HeHeHeHeUI.In_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.In_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.In_2.BorderSizePixel = 0
HeHeHeHeUI.In_2.Size = UDim2.new(0.378947377, 0, 1, 0)

HeHeHeHeUI.UICorner_39.CornerRadius = UDim.new(0, 4)
HeHeHeHeUI.UICorner_39.Parent = HeHeHeHeUI.In_2

HeHeHeHeUI.UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 255))}
HeHeHeHeUI.UIGradient_10.Parent = HeHeHeHeUI.In_2

HeHeHeHeUI.TextLabel_12.Parent = HeHeHeHeUI.Back_2
HeHeHeHeUI.TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_12.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_12.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_12.Position = UDim2.new(0, 0, 0.14870584, 0)
HeHeHeHeUI.TextLabel_12.Size = UDim2.new(0.99473685, 0, 0.689655185, 0)
HeHeHeHeUI.TextLabel_12.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_12.Text = "Jump (50%)"
HeHeHeHeUI.TextLabel_12.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_12.TextSize = 16.000
HeHeHeHeUI.TextLabel_12.TextStrokeTransparency = 0.700
HeHeHeHeUI.TextLabel_12.TextWrapped = true

HeHeHeHeUI.Active_2.Name = "Active"
HeHeHeHeUI.Active_2.Parent = HeHeHeHeUI.JumpChange
HeHeHeHeUI.Active_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Active_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Active_2.BorderSizePixel = 0
HeHeHeHeUI.Active_2.Position = UDim2.new(0.837499976, 0, 0.0571428575, 0)
HeHeHeHeUI.Active_2.Size = UDim2.new(0.12083333, 0, 0.828571439, 0)
HeHeHeHeUI.Active_2.Image = "http://www.roblox.com/asset/?id=6022668945"
HeHeHeHeUI.Active_2.ImageColor3 = Color3.fromRGB(140, 140, 140)

HeHeHeHeUI.UICorner_40.CornerRadius = UDim.new(0, 100)
HeHeHeHeUI.UICorner_40.Parent = HeHeHeHeUI.Active_2

HeHeHeHeUI.UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 255))}
HeHeHeHeUI.UIGradient_11.Parent = HeHeHeHeUI.Active_2

HeHeHeHeUI.GravityChange.Name = "GravityChange"
HeHeHeHeUI.GravityChange.Parent = HeHeHeHeUI.LocalPlayerTabs
HeHeHeHeUI.GravityChange.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.GravityChange.BackgroundTransparency = 1.000
HeHeHeHeUI.GravityChange.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.GravityChange.BorderSizePixel = 0
HeHeHeHeUI.GravityChange.Size = UDim2.new(1, 0, 0.263157904, 0)

HeHeHeHeUI.Back_3.Name = "Back"
HeHeHeHeUI.Back_3.Parent = HeHeHeHeUI.GravityChange
HeHeHeHeUI.Back_3.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
HeHeHeHeUI.Back_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Back_3.BorderSizePixel = 0
HeHeHeHeUI.Back_3.Position = UDim2.new(0, 0, 0.060493689, 0)
HeHeHeHeUI.Back_3.Size = UDim2.new(0.791666687, 0, 0.828571439, 0)

HeHeHeHeUI.UICorner_41.CornerRadius = UDim.new(0, 4)
HeHeHeHeUI.UICorner_41.Parent = HeHeHeHeUI.Back_3

HeHeHeHeUI.In_3.Name = "In"
HeHeHeHeUI.In_3.Parent = HeHeHeHeUI.Back_3
HeHeHeHeUI.In_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.In_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.In_3.BorderSizePixel = 0
HeHeHeHeUI.In_3.Size = UDim2.new(0.847368419, 0, 1, 0)

HeHeHeHeUI.UICorner_42.CornerRadius = UDim.new(0, 4)
HeHeHeHeUI.UICorner_42.Parent = HeHeHeHeUI.In_3

HeHeHeHeUI.UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 255))}
HeHeHeHeUI.UIGradient_12.Parent = HeHeHeHeUI.In_3

HeHeHeHeUI.TextLabel_13.Parent = HeHeHeHeUI.Back_3
HeHeHeHeUI.TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_13.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_13.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_13.Position = UDim2.new(0, 0, 0.14870584, 0)
HeHeHeHeUI.TextLabel_13.Size = UDim2.new(0.99473685, 0, 0.689655185, 0)
HeHeHeHeUI.TextLabel_13.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_13.Text = "Gravity (50%)"
HeHeHeHeUI.TextLabel_13.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_13.TextSize = 16.000
HeHeHeHeUI.TextLabel_13.TextStrokeTransparency = 0.700
HeHeHeHeUI.TextLabel_13.TextWrapped = true

HeHeHeHeUI.Active_3.Name = "Active"
HeHeHeHeUI.Active_3.Parent = HeHeHeHeUI.GravityChange
HeHeHeHeUI.Active_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Active_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Active_3.BorderSizePixel = 0
HeHeHeHeUI.Active_3.Position = UDim2.new(0.837499976, 0, 0.0571428575, 0)
HeHeHeHeUI.Active_3.Size = UDim2.new(0.12083333, 0, 0.828571439, 0)
HeHeHeHeUI.Active_3.Image = "http://www.roblox.com/asset/?id=6034684930"
HeHeHeHeUI.Active_3.ImageColor3 = Color3.fromRGB(140, 140, 140)

HeHeHeHeUI.UICorner_43.CornerRadius = UDim.new(0, 100)
HeHeHeHeUI.UICorner_43.Parent = HeHeHeHeUI.Active_3

HeHeHeHeUI.UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 255))}
HeHeHeHeUI.UIGradient_13.Parent = HeHeHeHeUI.Active_3

HeHeHeHeUI.Right_3.Name = "Right"
HeHeHeHeUI.Right_3.Parent = HeHeHeHeUI.ScriptPage
HeHeHeHeUI.Right_3.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Right_3.BackgroundTransparency = 0.300
HeHeHeHeUI.Right_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Right_3.BorderSizePixel = 0
HeHeHeHeUI.Right_3.Position = UDim2.new(0.410958916, 0, 0, 0)
HeHeHeHeUI.Right_3.Size = UDim2.new(0.589041114, 0, 1, 0)

HeHeHeHeUI.UICorner_44.Parent = HeHeHeHeUI.Right_3

HeHeHeHeUI.Right_4.Name = "Right"
HeHeHeHeUI.Right_4.Parent = HeHeHeHeUI.Right_3
HeHeHeHeUI.Right_4.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Right_4.BackgroundTransparency = 1.000
HeHeHeHeUI.Right_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Right_4.BorderSizePixel = 0
HeHeHeHeUI.Right_4.Size = UDim2.new(1, 0, 0.108000003, 0)

HeHeHeHeUI.UICorner_45.Parent = HeHeHeHeUI.Right_4

HeHeHeHeUI.Username_2.Name = "Username"
HeHeHeHeUI.Username_2.Parent = HeHeHeHeUI.Right_4
HeHeHeHeUI.Username_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Username_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Username_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Username_2.BorderSizePixel = 0
HeHeHeHeUI.Username_2.Position = UDim2.new(0.11899215, 0, 0, 0)
HeHeHeHeUI.Username_2.Size = UDim2.new(0.593023241, 0, 0.981481493, 0)
HeHeHeHeUI.Username_2.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Username_2.Text = "Welcome back, abc!"
HeHeHeHeUI.Username_2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Username_2.TextSize = 20.000
HeHeHeHeUI.Username_2.TextWrapped = true
HeHeHeHeUI.Username_2.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Avatar_2.Name = "Avatar"
HeHeHeHeUI.Avatar_2.Parent = HeHeHeHeUI.Right_4
HeHeHeHeUI.Avatar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Avatar_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Avatar_2.BorderSizePixel = 0
HeHeHeHeUI.Avatar_2.Position = UDim2.new(0.0346346125, 0, 0.205592409, 0)
HeHeHeHeUI.Avatar_2.Size = UDim2.new(0.0697674453, 0, 0.555555582, 0)
HeHeHeHeUI.Avatar_2.Image = "rbxassetid://9456359598"

HeHeHeHeUI.UICorner_46.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_46.Parent = HeHeHeHeUI.Avatar_2

HeHeHeHeUI.Close2_2.Name = "Close2"
HeHeHeHeUI.Close2_2.Parent = HeHeHeHeUI.Right_4
HeHeHeHeUI.Close2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Close2_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Close2_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Close2_2.BorderSizePixel = 0
HeHeHeHeUI.Close2_2.Position = UDim2.new(0.896345556, 0, 0.107407466, 0)
HeHeHeHeUI.Close2_2.Size = UDim2.new(0.0813953504, 0, 0.648148119, 0)
HeHeHeHeUI.Close2_2.Image = "http://www.roblox.com/asset/?id=6031094678"

HeHeHeHeUI.Close1_2.Name = "Close1"
HeHeHeHeUI.Close1_2.Parent = HeHeHeHeUI.Right_4
HeHeHeHeUI.Close1_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Close1_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Close1_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Close1_2.BorderSizePixel = 0
HeHeHeHeUI.Close1_2.Position = UDim2.new(0.814950228, 0, 0.107407466, 0)
HeHeHeHeUI.Close1_2.Size = UDim2.new(0.0813953504, 0, 0.648148119, 0)
HeHeHeHeUI.Close1_2.Image = "http://www.roblox.com/asset/?id=6031094681"

HeHeHeHeUI.DeepSearchFrame.Name = "DeepSearchFrame"
HeHeHeHeUI.DeepSearchFrame.Parent = HeHeHeHeUI.Right_3
HeHeHeHeUI.DeepSearchFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
HeHeHeHeUI.DeepSearchFrame.BackgroundTransparency = 0.700
HeHeHeHeUI.DeepSearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeepSearchFrame.BorderSizePixel = 0
HeHeHeHeUI.DeepSearchFrame.Position = UDim2.new(0.041860465, 0, 0.134000003, 0)
HeHeHeHeUI.DeepSearchFrame.Size = UDim2.new(0.913953483, 0, 0.0599999987, 0)

HeHeHeHeUI.UICorner_47.CornerRadius = UDim.new(0, 12)
HeHeHeHeUI.UICorner_47.Parent = HeHeHeHeUI.DeepSearchFrame

HeHeHeHeUI.ImageLabel_12.Parent = HeHeHeHeUI.DeepSearchFrame
HeHeHeHeUI.ImageLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_12.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_12.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_12.Position = UDim2.new(0.0430000015, 0, 0.0900000036, 0)
HeHeHeHeUI.ImageLabel_12.Size = UDim2.new(0.0636132285, 0, 0.833333313, 0)
HeHeHeHeUI.ImageLabel_12.Image = "http://www.roblox.com/asset/?id=6031154871"
HeHeHeHeUI.ImageLabel_12.ImageColor3 = Color3.fromRGB(172, 172, 172)

HeHeHeHeUI.DeepSearchBox.Name = "DeepSearchBox"
HeHeHeHeUI.DeepSearchBox.Parent = HeHeHeHeUI.DeepSearchFrame
HeHeHeHeUI.DeepSearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.DeepSearchBox.BackgroundTransparency = 1.000
HeHeHeHeUI.DeepSearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeepSearchBox.BorderSizePixel = 0
HeHeHeHeUI.DeepSearchBox.Position = UDim2.new(0.129514113, 0, 0.0900004059, 0)
HeHeHeHeUI.DeepSearchBox.Size = UDim2.new(0.870229006, 0, 0.800000012, 0)
HeHeHeHeUI.DeepSearchBox.ClearTextOnFocus = false
HeHeHeHeUI.DeepSearchBox.Font = Enum.Font.SourceSans
HeHeHeHeUI.DeepSearchBox.PlaceholderText = "Scripts Search"
HeHeHeHeUI.DeepSearchBox.Text = ""
HeHeHeHeUI.DeepSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.DeepSearchBox.TextSize = 14.000
HeHeHeHeUI.DeepSearchBox.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.SearchedPage.Name = "SearchedPage"
HeHeHeHeUI.SearchedPage.Parent = HeHeHeHeUI.Right_3
HeHeHeHeUI.SearchedPage.Active = true
HeHeHeHeUI.SearchedPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.SearchedPage.BackgroundTransparency = 1.000
HeHeHeHeUI.SearchedPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.SearchedPage.BorderSizePixel = 0
HeHeHeHeUI.SearchedPage.Position = UDim2.new(0.041860465, 0, 0.211063474, 0)
HeHeHeHeUI.SearchedPage.Size = UDim2.new(0.913953483, 0, 0.758000016, 0)
HeHeHeHeUI.SearchedPage.CanvasSize = UDim2.new(0, 0, 20, 0)
HeHeHeHeUI.SearchedPage.ScrollBarThickness = 2

HeHeHeHeUI.UIGridLayout.Parent = HeHeHeHeUI.SearchedPage
HeHeHeHeUI.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIGridLayout.CellSize = UDim2.new(0, 190, 0, 130)

HeHeHeHeUI.ExampleScriptHub.Name = "ExampleScriptHub"
HeHeHeHeUI.ExampleScriptHub.Parent = HeHeHeHeUI.SearchedPage
HeHeHeHeUI.ExampleScriptHub.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeHeHeHeUI.ExampleScriptHub.BackgroundTransparency = 0.700
HeHeHeHeUI.ExampleScriptHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExampleScriptHub.BorderSizePixel = 0
HeHeHeHeUI.ExampleScriptHub.Position = UDim2.new(0.100000001, 0, 0.156000003, 0)
HeHeHeHeUI.ExampleScriptHub.Size = UDim2.new(0, 240, 0, 82)

HeHeHeHeUI.UICorner_48.CornerRadius = UDim.new(0, 6)
HeHeHeHeUI.UICorner_48.Parent = HeHeHeHeUI.ExampleScriptHub

HeHeHeHeUI.ImageLabel_13.Parent = HeHeHeHeUI.ExampleScriptHub
HeHeHeHeUI.ImageLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_13.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_13.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_13.Position = UDim2.new(0, 0, 0.0170715339, 0)
HeHeHeHeUI.ImageLabel_13.Size = UDim2.new(1, 0, 0.676923096, 0)
HeHeHeHeUI.ImageLabel_13.Image = "rbxassetid://6673967738"

HeHeHeHeUI.UICorner_49.Parent = HeHeHeHeUI.ImageLabel_13

HeHeHeHeUI.TextLabel_14.Parent = HeHeHeHeUI.ExampleScriptHub
HeHeHeHeUI.TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_14.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_14.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_14.Position = UDim2.new(0.0315789469, 0, 0.738461554, 0)
HeHeHeHeUI.TextLabel_14.Size = UDim2.new(0.742105246, 0, 0.230769232, 0)
HeHeHeHeUI.TextLabel_14.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_14.Text = "Auto Farm Level  ABC ABA ABAC"
HeHeHeHeUI.TextLabel_14.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_14.TextScaled = true
HeHeHeHeUI.TextLabel_14.TextSize = 16.000
HeHeHeHeUI.TextLabel_14.TextWrapped = true
HeHeHeHeUI.TextLabel_14.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.TextLabel_14.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Run.Name = "Run"
HeHeHeHeUI.Run.Parent = HeHeHeHeUI.ExampleScriptHub
HeHeHeHeUI.Run.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
HeHeHeHeUI.Run.BackgroundTransparency = 0.500
HeHeHeHeUI.Run.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Run.BorderSizePixel = 0
HeHeHeHeUI.Run.Position = UDim2.new(0.773684204, 0, 0.615384638, 0)
HeHeHeHeUI.Run.Size = UDim2.new(0.210526317, 0, 0.307692319, 0)
HeHeHeHeUI.Run.Image = "http://www.roblox.com/asset/?id=6026663699"

HeHeHeHeUI.UICorner_50.Parent = HeHeHeHeUI.Run

HeHeHeHeUI.FilePage.Name = "FilePage"
HeHeHeHeUI.FilePage.Parent = HeHeHeHeUI.BackFrame
HeHeHeHeUI.FilePage.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.FilePage.BackgroundTransparency = 1.000
HeHeHeHeUI.FilePage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.FilePage.BorderSizePixel = 0
HeHeHeHeUI.FilePage.Position = UDim2.new(0.0874999985, 0, 0, 0)
HeHeHeHeUI.FilePage.Size = UDim2.new(0.912500024, 0, 1, 0)

HeHeHeHeUI.Left_3.Name = "Left"
HeHeHeHeUI.Left_3.Parent = HeHeHeHeUI.FilePage
HeHeHeHeUI.Left_3.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Left_3.BackgroundTransparency = 0.300
HeHeHeHeUI.Left_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Left_3.BorderSizePixel = 0
HeHeHeHeUI.Left_3.Size = UDim2.new(0.410958916, 0, 1, 0)

HeHeHeHeUI.TextLabel_15.Parent = HeHeHeHeUI.Left_3
HeHeHeHeUI.TextLabel_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_15.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_15.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_15.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_15.Position = UDim2.new(0.100000001, 0, 0.0313654803, 0)
HeHeHeHeUI.TextLabel_15.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_15.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_15.Text = " SAVED SCRIPTS"
HeHeHeHeUI.TextLabel_15.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_15.TextSize = 15.000
HeHeHeHeUI.TextLabel_15.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_15.TextWrapped = true
HeHeHeHeUI.TextLabel_15.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UICorner_51.Parent = HeHeHeHeUI.Left_3

HeHeHeHeUI.SavedScriptPage.Name = "SavedScriptPage"
HeHeHeHeUI.SavedScriptPage.Parent = HeHeHeHeUI.Left_3
HeHeHeHeUI.SavedScriptPage.Active = true
HeHeHeHeUI.SavedScriptPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.SavedScriptPage.BackgroundTransparency = 1.000
HeHeHeHeUI.SavedScriptPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.SavedScriptPage.BorderSizePixel = 0
HeHeHeHeUI.SavedScriptPage.Position = UDim2.new(0.100000001, 0, 0.0815999731, 0)
HeHeHeHeUI.SavedScriptPage.Size = UDim2.new(0.800000012, 0, 0.550000012, 0)
HeHeHeHeUI.SavedScriptPage.CanvasSize = UDim2.new(0, 0, 1, 0)
HeHeHeHeUI.SavedScriptPage.ScrollBarThickness = 2

HeHeHeHeUI.UIListLayout_6.Parent = HeHeHeHeUI.SavedScriptPage
HeHeHeHeUI.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIListLayout_6.Padding = UDim.new(0, 3)

HeHeHeHeUI.ExampleScriptFile.Name = "ExampleScriptFile"
HeHeHeHeUI.ExampleScriptFile.Parent = HeHeHeHeUI.SavedScriptPage
HeHeHeHeUI.ExampleScriptFile.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
HeHeHeHeUI.ExampleScriptFile.BackgroundTransparency = 0.900
HeHeHeHeUI.ExampleScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExampleScriptFile.BorderSizePixel = 0
HeHeHeHeUI.ExampleScriptFile.Position = UDim2.new(0.020833334, 0, 0, 0)
HeHeHeHeUI.ExampleScriptFile.Size = UDim2.new(0, 230, 0, 40)
HeHeHeHeUI.ExampleScriptFile.Font = Enum.Font.SourceSans
HeHeHeHeUI.ExampleScriptFile.Text = ""
HeHeHeHeUI.ExampleScriptFile.TextColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExampleScriptFile.TextSize = 14.000

HeHeHeHeUI.UICorner_52.Parent = HeHeHeHeUI.ExampleScriptFile

HeHeHeHeUI.ScriptName.Name = "ScriptName"
HeHeHeHeUI.ScriptName.Parent = HeHeHeHeUI.ExampleScriptFile
HeHeHeHeUI.ScriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ScriptName.BackgroundTransparency = 1.000
HeHeHeHeUI.ScriptName.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ScriptName.BorderSizePixel = 0
HeHeHeHeUI.ScriptName.Position = UDim2.new(0.168731958, 0, 0, 0)
HeHeHeHeUI.ScriptName.Size = UDim2.new(0.647826076, 0, 1, 0)
HeHeHeHeUI.ScriptName.Font = Enum.Font.Unknown
HeHeHeHeUI.ScriptName.Text = "Script1.lua"
HeHeHeHeUI.ScriptName.TextColor3 = Color3.fromRGB(170, 85, 255)
HeHeHeHeUI.ScriptName.TextSize = 16.000
HeHeHeHeUI.ScriptName.TextWrapped = true
HeHeHeHeUI.ScriptName.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.ImageLabel_14.Parent = HeHeHeHeUI.ExampleScriptFile
HeHeHeHeUI.ImageLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_14.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_14.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_14.Position = UDim2.new(0.0534161106, 0, 0.23800011, 0)
HeHeHeHeUI.ImageLabel_14.Size = UDim2.new(0.0869565234, 0, 0.5, 0)
HeHeHeHeUI.ImageLabel_14.Image = "http://www.roblox.com/asset/?id=6022668888"
HeHeHeHeUI.ImageLabel_14.ImageColor3 = Color3.fromRGB(170, 85, 255)

HeHeHeHeUI.DeleteScript_3.Name = "DeleteScript"
HeHeHeHeUI.DeleteScript_3.Parent = HeHeHeHeUI.ExampleScriptFile
HeHeHeHeUI.DeleteScript_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.DeleteScript_3.BackgroundTransparency = 1.000
HeHeHeHeUI.DeleteScript_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeleteScript_3.BorderSizePixel = 0
HeHeHeHeUI.DeleteScript_3.Position = UDim2.new(0.874606431, 0, 0.232407376, 0)
HeHeHeHeUI.DeleteScript_3.Size = UDim2.new(0.0869565234, 0, 0.5, 0)
HeHeHeHeUI.DeleteScript_3.Image = "http://www.roblox.com/asset/?id=6022668962"
HeHeHeHeUI.DeleteScript_3.ImageColor3 = Color3.fromRGB(170, 85, 255)

HeHeHeHeUI.TextLabel_16.Parent = HeHeHeHeUI.Left_3
HeHeHeHeUI.TextLabel_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_16.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_16.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_16.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_16.Position = UDim2.new(0.100000001, 0, 0.645365477, 0)
HeHeHeHeUI.TextLabel_16.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_16.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_16.Text = "AUTOEXEC"
HeHeHeHeUI.TextLabel_16.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_16.TextSize = 15.000
HeHeHeHeUI.TextLabel_16.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_16.TextWrapped = true
HeHeHeHeUI.TextLabel_16.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.AutoExecPage.Name = "AutoExecPage"
HeHeHeHeUI.AutoExecPage.Parent = HeHeHeHeUI.Left_3
HeHeHeHeUI.AutoExecPage.Active = true
HeHeHeHeUI.AutoExecPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.AutoExecPage.BackgroundTransparency = 1.000
HeHeHeHeUI.AutoExecPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.AutoExecPage.BorderSizePixel = 0
HeHeHeHeUI.AutoExecPage.Position = UDim2.new(0.100000001, 0, 0.686000168, 0)
HeHeHeHeUI.AutoExecPage.Size = UDim2.new(0.800000012, 0, 0.282000005, 0)
HeHeHeHeUI.AutoExecPage.CanvasSize = UDim2.new(0, 0, 1, 0)
HeHeHeHeUI.AutoExecPage.ScrollBarThickness = 2

HeHeHeHeUI.UIListLayout_7.Parent = HeHeHeHeUI.AutoExecPage
HeHeHeHeUI.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIListLayout_7.Padding = UDim.new(0, 3)

HeHeHeHeUI.Right_5.Name = "Right"
HeHeHeHeUI.Right_5.Parent = HeHeHeHeUI.FilePage
HeHeHeHeUI.Right_5.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Right_5.BackgroundTransparency = 0.300
HeHeHeHeUI.Right_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Right_5.BorderSizePixel = 0
HeHeHeHeUI.Right_5.Position = UDim2.new(0.410958916, 0, 0, 0)
HeHeHeHeUI.Right_5.Size = UDim2.new(0.589041114, 0, 1, 0)

HeHeHeHeUI.UICorner_53.Parent = HeHeHeHeUI.Right_5

HeHeHeHeUI.Right_6.Name = "Right"
HeHeHeHeUI.Right_6.Parent = HeHeHeHeUI.Right_5
HeHeHeHeUI.Right_6.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Right_6.BackgroundTransparency = 1.000
HeHeHeHeUI.Right_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Right_6.BorderSizePixel = 0
HeHeHeHeUI.Right_6.Size = UDim2.new(1, 0, 0.108000003, 0)

HeHeHeHeUI.UICorner_54.Parent = HeHeHeHeUI.Right_6

HeHeHeHeUI.Username_3.Name = "Username"
HeHeHeHeUI.Username_3.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.Username_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Username_3.BackgroundTransparency = 1.000
HeHeHeHeUI.Username_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Username_3.BorderSizePixel = 0
HeHeHeHeUI.Username_3.Position = UDim2.new(0.11899215, 0, 0, 0)
HeHeHeHeUI.Username_3.Size = UDim2.new(0.593023241, 0, 0.981481493, 0)
HeHeHeHeUI.Username_3.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.Username_3.Text = "Welcome back, abc!"
HeHeHeHeUI.Username_3.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Username_3.TextSize = 20.000
HeHeHeHeUI.Username_3.TextWrapped = true
HeHeHeHeUI.Username_3.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.Avatar_3.Name = "Avatar"
HeHeHeHeUI.Avatar_3.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.Avatar_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Avatar_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Avatar_3.BorderSizePixel = 0
HeHeHeHeUI.Avatar_3.Position = UDim2.new(0.0346346125, 0, 0.205592409, 0)
HeHeHeHeUI.Avatar_3.Size = UDim2.new(0.0697674453, 0, 0.555555582, 0)
HeHeHeHeUI.Avatar_3.Image = "rbxassetid://9456359598"

HeHeHeHeUI.UICorner_55.CornerRadius = UDim.new(0, 60)
HeHeHeHeUI.UICorner_55.Parent = HeHeHeHeUI.Avatar_3

HeHeHeHeUI.Close2_3.Name = "Close2"
HeHeHeHeUI.Close2_3.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.Close2_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Close2_3.BackgroundTransparency = 1.000
HeHeHeHeUI.Close2_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Close2_3.BorderSizePixel = 0
HeHeHeHeUI.Close2_3.Position = UDim2.new(0.896345556, 0, 0.107407466, 0)
HeHeHeHeUI.Close2_3.Size = UDim2.new(0.0813953504, 0, 0.648148119, 0)
HeHeHeHeUI.Close2_3.Image = "http://www.roblox.com/asset/?id=6031094678"

HeHeHeHeUI.Close1_3.Name = "Close1"
HeHeHeHeUI.Close1_3.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.Close1_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Close1_3.BackgroundTransparency = 1.000
HeHeHeHeUI.Close1_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Close1_3.BorderSizePixel = 0
HeHeHeHeUI.Close1_3.Position = UDim2.new(0.814950228, 0, 0.107407466, 0)
HeHeHeHeUI.Close1_3.Size = UDim2.new(0.0813953504, 0, 0.648148119, 0)
HeHeHeHeUI.Close1_3.Image = "http://www.roblox.com/asset/?id=6031094681"

HeHeHeHeUI.CodeHolder_2.Name = "CodeHolder"
HeHeHeHeUI.CodeHolder_2.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.CodeHolder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.CodeHolder_2.BackgroundTransparency = 1.000
HeHeHeHeUI.CodeHolder_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.CodeHolder_2.BorderSizePixel = 0
HeHeHeHeUI.CodeHolder_2.Position = UDim2.new(0.0346344709, 0, 1.0925926, 0)
HeHeHeHeUI.CodeHolder_2.Size = UDim2.new(0.941860437, 0, 5.79629612, 0)

HeHeHeHeUI.HightLight_2.Name = "HightLight"
HeHeHeHeUI.HightLight_2.Parent = HeHeHeHeUI.CodeHolder_2
HeHeHeHeUI.HightLight_2.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
HeHeHeHeUI.HightLight_2.BackgroundTransparency = 1.000
HeHeHeHeUI.HightLight_2.BorderColor3 = Color3.fromRGB(61, 61, 61)
HeHeHeHeUI.HightLight_2.Position = UDim2.new(0, 0, 0.109034404, 0)
HeHeHeHeUI.HightLight_2.Size = UDim2.new(1, 0, 0.865814686, 0)
HeHeHeHeUI.HightLight_2.ZIndex = 3
HeHeHeHeUI.HightLight_2.BottomImage = "rbxassetid://148970562"
HeHeHeHeUI.HightLight_2.CanvasSize = UDim2.new(30, 0, 30, 0)
HeHeHeHeUI.HightLight_2.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
HeHeHeHeUI.HightLight_2.MidImage = "rbxassetid://148970562"
HeHeHeHeUI.HightLight_2.ScrollBarThickness = 5
HeHeHeHeUI.HightLight_2.TopImage = "rbxassetid://148970562"

HeHeHeHeUI.Source_2.Name = "Source"
HeHeHeHeUI.Source_2.Parent = HeHeHeHeUI.HightLight_2
HeHeHeHeUI.Source_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Source_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Source_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Source_2.Position = UDim2.new(0.002, 0, 0, 0)
HeHeHeHeUI.Source_2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Source_2.ZIndex = 3
HeHeHeHeUI.Source_2.ClearTextOnFocus = false
HeHeHeHeUI.Source_2.Font = Enum.Font.Code
HeHeHeHeUI.Source_2.MultiLine = true
HeHeHeHeUI.Source_2.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
HeHeHeHeUI.Source_2.Text = "print(\"acsu was here!\")"
HeHeHeHeUI.Source_2.TextColor3 = Color3.fromRGB(204, 204, 204)
HeHeHeHeUI.Source_2.TextSize = 15.000
HeHeHeHeUI.Source_2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Source_2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Comments__2.Name = "Comments_"
HeHeHeHeUI.Comments__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.Comments__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Comments__2.BackgroundTransparency = 1.000
HeHeHeHeUI.Comments__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Comments__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Comments__2.ZIndex = 5
HeHeHeHeUI.Comments__2.Font = Enum.Font.Code
HeHeHeHeUI.Comments__2.Text = ""
HeHeHeHeUI.Comments__2.TextColor3 = Color3.fromRGB(59, 200, 59)
HeHeHeHeUI.Comments__2.TextSize = 15.000
HeHeHeHeUI.Comments__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Comments__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Globals__2.Name = "Globals_"
HeHeHeHeUI.Globals__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.Globals__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Globals__2.BackgroundTransparency = 1.000
HeHeHeHeUI.Globals__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Globals__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Globals__2.ZIndex = 5
HeHeHeHeUI.Globals__2.Font = Enum.Font.Code
HeHeHeHeUI.Globals__2.Text = ""
HeHeHeHeUI.Globals__2.TextColor3 = Color3.fromRGB(132, 214, 247)
HeHeHeHeUI.Globals__2.TextSize = 15.000
HeHeHeHeUI.Globals__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Globals__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Keywords__2.Name = "Keywords_"
HeHeHeHeUI.Keywords__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.Keywords__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Keywords__2.BackgroundTransparency = 1.000
HeHeHeHeUI.Keywords__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Keywords__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Keywords__2.ZIndex = 5
HeHeHeHeUI.Keywords__2.Font = Enum.Font.Code
HeHeHeHeUI.Keywords__2.Text = ""
HeHeHeHeUI.Keywords__2.TextColor3 = Color3.fromRGB(248, 109, 124)
HeHeHeHeUI.Keywords__2.TextSize = 15.000
HeHeHeHeUI.Keywords__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Keywords__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.RemoteHighlight__2.Name = "RemoteHighlight_"
HeHeHeHeUI.RemoteHighlight__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.RemoteHighlight__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.RemoteHighlight__2.BackgroundTransparency = 1.000
HeHeHeHeUI.RemoteHighlight__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.RemoteHighlight__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.RemoteHighlight__2.ZIndex = 5
HeHeHeHeUI.RemoteHighlight__2.Font = Enum.Font.Code
HeHeHeHeUI.RemoteHighlight__2.Text = ""
HeHeHeHeUI.RemoteHighlight__2.TextColor3 = Color3.fromRGB(0, 144, 255)
HeHeHeHeUI.RemoteHighlight__2.TextSize = 15.000
HeHeHeHeUI.RemoteHighlight__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.RemoteHighlight__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Strings__2.Name = "Strings_"
HeHeHeHeUI.Strings__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.Strings__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Strings__2.BackgroundTransparency = 1.000
HeHeHeHeUI.Strings__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Strings__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Strings__2.ZIndex = 5
HeHeHeHeUI.Strings__2.Font = Enum.Font.Code
HeHeHeHeUI.Strings__2.Text = ""
HeHeHeHeUI.Strings__2.TextColor3 = Color3.fromRGB(173, 241, 149)
HeHeHeHeUI.Strings__2.TextSize = 15.000
HeHeHeHeUI.Strings__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Strings__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Tokens__2.Name = "Tokens_"
HeHeHeHeUI.Tokens__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.Tokens__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Tokens__2.BackgroundTransparency = 1.000
HeHeHeHeUI.Tokens__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Tokens__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Tokens__2.ZIndex = 5
HeHeHeHeUI.Tokens__2.Font = Enum.Font.Code
HeHeHeHeUI.Tokens__2.Text = ""
HeHeHeHeUI.Tokens__2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Tokens__2.TextSize = 15.000
HeHeHeHeUI.Tokens__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Tokens__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Numbers__2.Name = "Numbers_"
HeHeHeHeUI.Numbers__2.Parent = HeHeHeHeUI.Source_2
HeHeHeHeUI.Numbers__2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Numbers__2.BackgroundTransparency = 1.000
HeHeHeHeUI.Numbers__2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Numbers__2.Size = UDim2.new(1, 0, 1, 0)
HeHeHeHeUI.Numbers__2.ZIndex = 4
HeHeHeHeUI.Numbers__2.Font = Enum.Font.Code
HeHeHeHeUI.Numbers__2.Text = ""
HeHeHeHeUI.Numbers__2.TextColor3 = Color3.fromRGB(255, 198, 0)
HeHeHeHeUI.Numbers__2.TextSize = 15.000
HeHeHeHeUI.Numbers__2.TextXAlignment = Enum.TextXAlignment.Left
HeHeHeHeUI.Numbers__2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.Lines_2.Name = "Lines"
HeHeHeHeUI.Lines_2.Parent = HeHeHeHeUI.HightLight_2
HeHeHeHeUI.Lines_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Lines_2.BackgroundTransparency = 1.000
HeHeHeHeUI.Lines_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
HeHeHeHeUI.Lines_2.Size = UDim2.new(0, 30, 1, 0)
HeHeHeHeUI.Lines_2.ZIndex = 4
HeHeHeHeUI.Lines_2.Font = Enum.Font.Code
HeHeHeHeUI.Lines_2.Text = "1"
HeHeHeHeUI.Lines_2.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Lines_2.TextSize = 15.000
HeHeHeHeUI.Lines_2.TextYAlignment = Enum.TextYAlignment.Top

HeHeHeHeUI.UICorner_56.Parent = HeHeHeHeUI.CodeHolder_2

HeHeHeHeUI.ExecuteScriptFile.Name = "ExecuteScriptFile"
HeHeHeHeUI.ExecuteScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.ExecuteScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExecuteScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.ExecuteScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExecuteScriptFile.BorderSizePixel = 0
HeHeHeHeUI.ExecuteScriptFile.ClipsDescendants = true
HeHeHeHeUI.ExecuteScriptFile.Position = UDim2.new(0.0325581394, 0, 6.94444466, 0)
HeHeHeHeUI.ExecuteScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.ExecuteScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ExecuteScriptFile.Text = "Execute"
HeHeHeHeUI.ExecuteScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExecuteScriptFile.TextSize = 16.000
HeHeHeHeUI.ExecuteScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_57.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_57.Parent = HeHeHeHeUI.ExecuteScriptFile

HeHeHeHeUI.UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_14.Rotation = 31
HeHeHeHeUI.UIGradient_14.Parent = HeHeHeHeUI.ExecuteScriptFile

HeHeHeHeUI.ImageLabel_15.Parent = HeHeHeHeUI.ExecuteScriptFile
HeHeHeHeUI.ImageLabel_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_15.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_15.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_15.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_15.Position = UDim2.new(-0.33432129, 0, -0.653061211, 0)
HeHeHeHeUI.ImageLabel_15.Size = UDim2.new(1.33333337, 0, 2.04081631, 0)
HeHeHeHeUI.ImageLabel_15.ZIndex = 0
HeHeHeHeUI.ImageLabel_15.Image = "http://www.roblox.com/asset/?id=6026663699"
HeHeHeHeUI.ImageLabel_15.ImageColor3 = Color3.fromRGB(85, 255, 0)
HeHeHeHeUI.ImageLabel_15.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_17.Parent = HeHeHeHeUI.ExecuteScriptFile
HeHeHeHeUI.TextLabel_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_17.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_17.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_17.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_17.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_17.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_17.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_17.Text = "Execute"
HeHeHeHeUI.TextLabel_17.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_17.TextSize = 16.000
HeHeHeHeUI.TextLabel_17.TextWrapped = true

HeHeHeHeUI.ClearScriptFile.Name = "ClearScriptFile"
HeHeHeHeUI.ClearScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.ClearScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ClearScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.ClearScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ClearScriptFile.BorderSizePixel = 0
HeHeHeHeUI.ClearScriptFile.ClipsDescendants = true
HeHeHeHeUI.ClearScriptFile.Position = UDim2.new(0.25, 0, 6.94444466, 0)
HeHeHeHeUI.ClearScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.ClearScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.ClearScriptFile.Text = "Clear"
HeHeHeHeUI.ClearScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ClearScriptFile.TextSize = 16.000
HeHeHeHeUI.ClearScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_58.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_58.Parent = HeHeHeHeUI.ClearScriptFile

HeHeHeHeUI.UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_15.Rotation = 31
HeHeHeHeUI.UIGradient_15.Parent = HeHeHeHeUI.ClearScriptFile

HeHeHeHeUI.ImageLabel_16.Parent = HeHeHeHeUI.ClearScriptFile
HeHeHeHeUI.ImageLabel_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_16.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_16.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_16.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_16.Position = UDim2.new(-0.280987948, 0, -0.653061211, 0)
HeHeHeHeUI.ImageLabel_16.Size = UDim2.new(1.33333337, 0, 2.04081631, 0)
HeHeHeHeUI.ImageLabel_16.ZIndex = 0
HeHeHeHeUI.ImageLabel_16.Image = "http://www.roblox.com/asset/?id=6034767619"
HeHeHeHeUI.ImageLabel_16.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_18.Parent = HeHeHeHeUI.ClearScriptFile
HeHeHeHeUI.TextLabel_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_18.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_18.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_18.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_18.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_18.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_18.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_18.Text = "Clear"
HeHeHeHeUI.TextLabel_18.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_18.TextSize = 16.000
HeHeHeHeUI.TextLabel_18.TextWrapped = true

HeHeHeHeUI.CopyScriptFile.Name = "CopyScriptFile"
HeHeHeHeUI.CopyScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.CopyScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.CopyScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.CopyScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.CopyScriptFile.BorderSizePixel = 0
HeHeHeHeUI.CopyScriptFile.ClipsDescendants = true
HeHeHeHeUI.CopyScriptFile.Position = UDim2.new(0.467000127, 0, 6.94444466, 0)
HeHeHeHeUI.CopyScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.CopyScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.CopyScriptFile.Text = "Copy"
HeHeHeHeUI.CopyScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.CopyScriptFile.TextSize = 16.000
HeHeHeHeUI.CopyScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_59.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_59.Parent = HeHeHeHeUI.CopyScriptFile

HeHeHeHeUI.UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_16.Rotation = 31
HeHeHeHeUI.UIGradient_16.Parent = HeHeHeHeUI.CopyScriptFile

HeHeHeHeUI.ImageLabel_17.Parent = HeHeHeHeUI.CopyScriptFile
HeHeHeHeUI.ImageLabel_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_17.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_17.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_17.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_17.Position = UDim2.new(0.0390120447, 0, 0, 0)
HeHeHeHeUI.ImageLabel_17.Size = UDim2.new(0.959999979, 0, 1.38775516, 0)
HeHeHeHeUI.ImageLabel_17.ZIndex = 0
HeHeHeHeUI.ImageLabel_17.Image = "http://www.roblox.com/asset/?id=6035053278"
HeHeHeHeUI.ImageLabel_17.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_19.Parent = HeHeHeHeUI.CopyScriptFile
HeHeHeHeUI.TextLabel_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_19.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_19.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_19.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_19.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_19.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_19.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_19.Text = "Copy"
HeHeHeHeUI.TextLabel_19.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_19.TextSize = 16.000
HeHeHeHeUI.TextLabel_19.TextWrapped = true

HeHeHeHeUI.PasteScriptFile.Name = "PasteScriptFile"
HeHeHeHeUI.PasteScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.PasteScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.PasteScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.PasteScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.PasteScriptFile.BorderSizePixel = 0
HeHeHeHeUI.PasteScriptFile.ClipsDescendants = true
HeHeHeHeUI.PasteScriptFile.Position = UDim2.new(0.684000015, 0, 6.94444466, 0)
HeHeHeHeUI.PasteScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.PasteScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.PasteScriptFile.Text = "Paste"
HeHeHeHeUI.PasteScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.PasteScriptFile.TextSize = 16.000
HeHeHeHeUI.PasteScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_60.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_60.Parent = HeHeHeHeUI.PasteScriptFile

HeHeHeHeUI.UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_17.Rotation = 31
HeHeHeHeUI.UIGradient_17.Parent = HeHeHeHeUI.PasteScriptFile

HeHeHeHeUI.ImageLabel_18.Parent = HeHeHeHeUI.PasteScriptFile
HeHeHeHeUI.ImageLabel_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_18.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_18.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_18.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_18.Position = UDim2.new(-0.120987959, 0, 0, 0)
HeHeHeHeUI.ImageLabel_18.Size = UDim2.new(0.986666679, 0, 1.38775516, 0)
HeHeHeHeUI.ImageLabel_18.ZIndex = 0
HeHeHeHeUI.ImageLabel_18.Image = "http://www.roblox.com/asset/?id=6035053285"
HeHeHeHeUI.ImageLabel_18.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_20.Parent = HeHeHeHeUI.PasteScriptFile
HeHeHeHeUI.TextLabel_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_20.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_20.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_20.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_20.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_20.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_20.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_20.Text = "Paste"
HeHeHeHeUI.TextLabel_20.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_20.TextSize = 16.000
HeHeHeHeUI.TextLabel_20.TextWrapped = true

HeHeHeHeUI.SaveScriptFile.Name = "SaveScriptFile"
HeHeHeHeUI.SaveScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.SaveScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.SaveScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.SaveScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.SaveScriptFile.BorderSizePixel = 0
HeHeHeHeUI.SaveScriptFile.ClipsDescendants = true
HeHeHeHeUI.SaveScriptFile.Position = UDim2.new(0.0337209292, 0, 8.05555534, 0)
HeHeHeHeUI.SaveScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.SaveScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.SaveScriptFile.Text = "Clear"
HeHeHeHeUI.SaveScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.SaveScriptFile.TextSize = 16.000
HeHeHeHeUI.SaveScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_61.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_61.Parent = HeHeHeHeUI.SaveScriptFile

HeHeHeHeUI.UIGradient_18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_18.Rotation = 31
HeHeHeHeUI.UIGradient_18.Parent = HeHeHeHeUI.SaveScriptFile

HeHeHeHeUI.ImageLabel_19.Parent = HeHeHeHeUI.SaveScriptFile
HeHeHeHeUI.ImageLabel_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_19.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_19.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_19.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_19.Position = UDim2.new(-0.014321289, 0, 0.0204081628, 0)
HeHeHeHeUI.ImageLabel_19.Size = UDim2.new(0.920000017, 0, 1.38775516, 0)
HeHeHeHeUI.ImageLabel_19.ZIndex = 0
HeHeHeHeUI.ImageLabel_19.Image = "http://www.roblox.com/asset/?id=6035067857"
HeHeHeHeUI.ImageLabel_19.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_21.Parent = HeHeHeHeUI.SaveScriptFile
HeHeHeHeUI.TextLabel_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_21.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_21.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_21.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_21.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_21.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_21.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_21.Text = "Save"
HeHeHeHeUI.TextLabel_21.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_21.TextSize = 16.000
HeHeHeHeUI.TextLabel_21.TextWrapped = true

HeHeHeHeUI.DeleteScriptFile.Name = "DeleteScriptFile"
HeHeHeHeUI.DeleteScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.DeleteScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.DeleteScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.DeleteScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.DeleteScriptFile.BorderSizePixel = 0
HeHeHeHeUI.DeleteScriptFile.ClipsDescendants = true
HeHeHeHeUI.DeleteScriptFile.Position = UDim2.new(0.25, 0, 8.07407379, 0)
HeHeHeHeUI.DeleteScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.DeleteScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.DeleteScriptFile.Text = "Clear"
HeHeHeHeUI.DeleteScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.DeleteScriptFile.TextSize = 16.000
HeHeHeHeUI.DeleteScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_62.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_62.Parent = HeHeHeHeUI.DeleteScriptFile

HeHeHeHeUI.UIGradient_19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_19.Rotation = 31
HeHeHeHeUI.UIGradient_19.Parent = HeHeHeHeUI.DeleteScriptFile

HeHeHeHeUI.ImageLabel_20.Parent = HeHeHeHeUI.DeleteScriptFile
HeHeHeHeUI.ImageLabel_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_20.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_20.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_20.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_20.Position = UDim2.new(-0.160987958, 0, 0, 0)
HeHeHeHeUI.ImageLabel_20.Size = UDim2.new(1.08000004, 0, 1.40816331, 0)
HeHeHeHeUI.ImageLabel_20.ZIndex = 0
HeHeHeHeUI.ImageLabel_20.Image = "http://www.roblox.com/asset/?id=6022668962"
HeHeHeHeUI.ImageLabel_20.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_22.Parent = HeHeHeHeUI.DeleteScriptFile
HeHeHeHeUI.TextLabel_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_22.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_22.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_22.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_22.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_22.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_22.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_22.Text = "Delete"
HeHeHeHeUI.TextLabel_22.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_22.TextSize = 16.000
HeHeHeHeUI.TextLabel_22.TextWrapped = true

HeHeHeHeUI.NewScriptFile.Name = "NewScriptFile"
HeHeHeHeUI.NewScriptFile.Parent = HeHeHeHeUI.Right_6
HeHeHeHeUI.NewScriptFile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.NewScriptFile.BackgroundTransparency = 0.500
HeHeHeHeUI.NewScriptFile.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.NewScriptFile.BorderSizePixel = 0
HeHeHeHeUI.NewScriptFile.ClipsDescendants = true
HeHeHeHeUI.NewScriptFile.Position = UDim2.new(0.473255813, 0, 8.07407379, 0)
HeHeHeHeUI.NewScriptFile.Size = UDim2.new(0.174418598, 0, 0.907407403, 0)
HeHeHeHeUI.NewScriptFile.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.NewScriptFile.Text = "Clear"
HeHeHeHeUI.NewScriptFile.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.NewScriptFile.TextSize = 16.000
HeHeHeHeUI.NewScriptFile.TextTransparency = 1.000

HeHeHeHeUI.UICorner_63.CornerRadius = UDim.new(0, 3)
HeHeHeHeUI.UICorner_63.Parent = HeHeHeHeUI.NewScriptFile

HeHeHeHeUI.UIGradient_20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 85, 255))}
HeHeHeHeUI.UIGradient_20.Rotation = 31
HeHeHeHeUI.UIGradient_20.Parent = HeHeHeHeUI.NewScriptFile

HeHeHeHeUI.ImageLabel_21.Parent = HeHeHeHeUI.NewScriptFile
HeHeHeHeUI.ImageLabel_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ImageLabel_21.BackgroundTransparency = 1.000
HeHeHeHeUI.ImageLabel_21.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ImageLabel_21.BorderSizePixel = 0
HeHeHeHeUI.ImageLabel_21.Position = UDim2.new(-0.107654624, 0, -0.10204082, 0)
HeHeHeHeUI.ImageLabel_21.Size = UDim2.new(1.08000004, 0, 1.40816331, 0)
HeHeHeHeUI.ImageLabel_21.ZIndex = 0
HeHeHeHeUI.ImageLabel_21.Image = "http://www.roblox.com/asset/?id=6035047374"
HeHeHeHeUI.ImageLabel_21.ImageTransparency = 0.800

HeHeHeHeUI.TextLabel_23.Parent = HeHeHeHeUI.NewScriptFile
HeHeHeHeUI.TextLabel_23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_23.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_23.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_23.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_23.Position = UDim2.new(-0.000833333354, 0, 0.282039732, 0)
HeHeHeHeUI.TextLabel_23.Size = UDim2.new(0.959999979, 0, 0.408163279, 0)
HeHeHeHeUI.TextLabel_23.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_23.Text = "New"
HeHeHeHeUI.TextLabel_23.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_23.TextSize = 16.000
HeHeHeHeUI.TextLabel_23.TextWrapped = true

HeHeHeHeUI.SettingPage.Name = "SettingPage"
HeHeHeHeUI.SettingPage.Parent = HeHeHeHeUI.BackFrame
HeHeHeHeUI.SettingPage.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.SettingPage.BackgroundTransparency = 1.000
HeHeHeHeUI.SettingPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.SettingPage.BorderSizePixel = 0
HeHeHeHeUI.SettingPage.Position = UDim2.new(0.0874999985, 0, 0, 0)
HeHeHeHeUI.SettingPage.Size = UDim2.new(0.912500024, 0, 1, 0)
HeHeHeHeUI.SettingPage.Visible = false

HeHeHeHeUI.Left_4.Name = "Left"
HeHeHeHeUI.Left_4.Parent = HeHeHeHeUI.SettingPage
HeHeHeHeUI.Left_4.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
HeHeHeHeUI.Left_4.BackgroundTransparency = 0.300
HeHeHeHeUI.Left_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Left_4.BorderSizePixel = 0
HeHeHeHeUI.Left_4.Size = UDim2.new(0.410958916, 0, 1, 0)

HeHeHeHeUI.TextLabel_24.Parent = HeHeHeHeUI.Left_4
HeHeHeHeUI.TextLabel_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_24.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_24.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_24.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_24.Position = UDim2.new(0.100000001, 0, 0.0313654803, 0)
HeHeHeHeUI.TextLabel_24.Size = UDim2.new(0.800000012, 0, 0.0399999991, 0)
HeHeHeHeUI.TextLabel_24.Font = Enum.Font.Arial
HeHeHeHeUI.TextLabel_24.Text = "Settings"
HeHeHeHeUI.TextLabel_24.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_24.TextSize = 15.000
HeHeHeHeUI.TextLabel_24.TextTransparency = 0.500
HeHeHeHeUI.TextLabel_24.TextWrapped = true
HeHeHeHeUI.TextLabel_24.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.UICorner_64.Parent = HeHeHeHeUI.Left_4

HeHeHeHeUI.Frame_5.Parent = HeHeHeHeUI.Left_4
HeHeHeHeUI.Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.Frame_5.BackgroundTransparency = 1.000
HeHeHeHeUI.Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.Frame_5.BorderSizePixel = 0
HeHeHeHeUI.Frame_5.Position = UDim2.new(0.100000001, 0, 0.0879999995, 0)
HeHeHeHeUI.Frame_5.Size = UDim2.new(0.800000012, 0, 0.882000029, 0)

HeHeHeHeUI.UIListLayout_8.Parent = HeHeHeHeUI.Frame_5
HeHeHeHeUI.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
HeHeHeHeUI.UIListLayout_8.Padding = UDim.new(0, 3)

HeHeHeHeUI.ExampleSettingToggle.Name = "ExampleSettingToggle"
HeHeHeHeUI.ExampleSettingToggle.Parent = HeHeHeHeUI.Frame_5
HeHeHeHeUI.ExampleSettingToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.ExampleSettingToggle.BackgroundTransparency = 1.000
HeHeHeHeUI.ExampleSettingToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.ExampleSettingToggle.BorderSizePixel = 0
HeHeHeHeUI.ExampleSettingToggle.Size = UDim2.new(1, 0, 0.0680272132, 0)

HeHeHeHeUI.TextLabel_25.Parent = HeHeHeHeUI.ExampleSettingToggle
HeHeHeHeUI.TextLabel_25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_25.BackgroundTransparency = 1.000
HeHeHeHeUI.TextLabel_25.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextLabel_25.BorderSizePixel = 0
HeHeHeHeUI.TextLabel_25.Position = UDim2.new(0, 0, 0.156698614, 0)
HeHeHeHeUI.TextLabel_25.Size = UDim2.new(0.645833313, 0, 0.666666627, 0)
HeHeHeHeUI.TextLabel_25.Font = Enum.Font.SourceSansBold
HeHeHeHeUI.TextLabel_25.Text = "Anti Cheat Bypass"
HeHeHeHeUI.TextLabel_25.TextColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.TextLabel_25.TextSize = 16.000
HeHeHeHeUI.TextLabel_25.TextWrapped = true
HeHeHeHeUI.TextLabel_25.TextXAlignment = Enum.TextXAlignment.Left

HeHeHeHeUI.TextButton.Parent = HeHeHeHeUI.ExampleSettingToggle
HeHeHeHeUI.TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
HeHeHeHeUI.TextButton.BackgroundTransparency = 0.700
HeHeHeHeUI.TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextButton.BorderSizePixel = 0
HeHeHeHeUI.TextButton.Position = UDim2.new(0.791666687, 0, 0.0666666701, 0)
HeHeHeHeUI.TextButton.Size = UDim2.new(0.208333328, 0, 0.833333254, 0)
HeHeHeHeUI.TextButton.Font = Enum.Font.SourceSans
HeHeHeHeUI.TextButton.Text = ""
HeHeHeHeUI.TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.TextButton.TextSize = 14.000

HeHeHeHeUI.UICorner_65.CornerRadius = UDim.new(0, 100)
HeHeHeHeUI.UICorner_65.Parent = HeHeHeHeUI.TextButton

HeHeHeHeUI.In_4.Name = "In"
HeHeHeHeUI.In_4.Parent = HeHeHeHeUI.TextButton
HeHeHeHeUI.In_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeHeHeHeUI.In_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.In_4.BorderSizePixel = 0
HeHeHeHeUI.In_4.Position = UDim2.new(0.5, 0, 0, 0)
HeHeHeHeUI.In_4.Size = UDim2.new(0.5, 0, 1, 0)
HeHeHeHeUI.In_4.Font = Enum.Font.SourceSans
HeHeHeHeUI.In_4.Text = ""
HeHeHeHeUI.In_4.TextColor3 = Color3.fromRGB(0, 0, 0)
HeHeHeHeUI.In_4.TextSize = 14.000

HeHeHeHeUI.UICorner_66.CornerRadius = UDim.new(0, 100)
HeHeHeHeUI.UICorner_66.Parent = HeHeHeHeUI.In_4

--HeHeHeHeUI.MiniLogo.Name = "MiniLogo"
--HeHeHeHeUI.MiniLogo.Parent = HeHeHeHeUI.HeHeHeHeUI
--HeHeHeHeUI.MiniLogo.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
--HeHeHeHeUI.MiniLogo.BackgroundTransparency = 0.900
--HeHeHeHeUI.MiniLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
--HeHeHeHeUI.MiniLogo.BorderSizePixel = 0
--HeHeHeHeUI.MiniLogo.Position = UDim2.new(0.519738972, 0, 0.0772856474, 0)
--HeHeHeHeUI.MiniLogo.Size = UDim2.new(0.0473612994, 0, 0.0904392749, 0)
--HeHeHeHeUI.MiniLogo.Image = "rbxassetid://17899406673"

--HeHeHeHeUI.MiniLogoUICorner.Name = "MiniLogoUICorner"
--HeHeHeHeUI.MiniLogoUICorner.Parent = HeHeHeHeUI.MiniLogo

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

local function do_highlight(Source, Lines)
	local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
	local global_env = {"getrawmetatable", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16"}

	local Highlight = function(string, keywords)
		local K = {}
		local S = string
		local Token =
			{
				["="] = true,
				["."] = true,
				[","] = true,
				["("] = true,
				[")"] = true,
				["["] = true,
				["]"] = true,
				["{"] = true,
				["}"] = true,
				[":"] = true,
				["*"] = true,
				["/"] = true,
				["+"] = true,
				["-"] = true,
				["%"] = true,
				[";"] = true,
				["~"] = true
			}
		for i, v in pairs(keywords) do
			K[v] = true
		end
		S = S:gsub(".", function(c)
			if Token[c] ~= nil then
				return "\32"
			else
				return c
			end
		end)
		S = S:gsub("%S+", function(c)
			if K[c] ~= nil then
				return c
			else
				return (" "):rep(#c)
			end
		end)

		return S
	end

	local hTokens = function(string)
		local Token =
			{
				["="] = true,
				["."] = true,
				[","] = true,
				["("] = true,
				[")"] = true,
				["["] = true,
				["]"] = true,
				["{"] = true,
				["}"] = true,
				[":"] = true,
				["*"] = true,
				["/"] = true,
				["+"] = true,
				["-"] = true,
				["%"] = true,
				[";"] = true,
				["~"] = true
			}
		local A = ""
		string:gsub(".", function(c)
			if Token[c] ~= nil then
				A = A .. c
			elseif c == "\n" then
				A = A .. "\n"
			elseif c == "\t" then
				A = A .. "\t"
			else
				A = A .. "\32"
			end
		end)

		return A
	end


	local strings = function(string)
		local highlight = ""
		local quote = false
		string:gsub(".", function(c)
			if quote == false and c == "\"" then
				quote = true
			elseif quote == true and c == "\"" then
				quote = false
			end
			if quote == false and c == "\"" then
				highlight = highlight .. "\""
			elseif c == "\n" then
				highlight = highlight .. "\n"
			elseif c == "\t" then
				highlight = highlight .. "\t"
			elseif quote == true then
				highlight = highlight .. c
			elseif quote == false then
				highlight = highlight .. "\32"
			end
		end)

		return highlight
	end

	local comments = function(string)
		local ret = ""
		string:gsub("[^\r\n]+", function(c)
			local comm = false
			local i = 0
			c:gsub(".", function(n)
				i = i + 1
				if c:sub(i, i + 1) == "--" then
					comm = true
				end
				if comm == true then
					ret = ret .. n
				else
					ret = ret .. "\32"
				end
			end)
			ret = ret
		end)

		return ret
	end

	local numbers = function(string)
		local A = ""
		string:gsub(".", function(c)
			if tonumber(c) ~= nil then
				A = A .. c
			elseif c == "\n" then
				A = A .. "\n"
			elseif c == "\t" then
				A = A .. "\t"
			else
				A = A .. "\32"
			end
		end)

		return A
	end

	local highlight_source = function(type)
		if type == "Text" then
			Source.Text = Source.Text:gsub("\13", "")
			Source.Text = Source.Text:gsub("\t", "      ")
			local s = Source.Text
			Source.Keywords_.Text = Highlight(s, lua_keywords)
			Source.Globals_.Text = Highlight(s, global_env)
			Source.RemoteHighlight_.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
			Source.Tokens_.Text = hTokens(s)
			Source.Numbers_.Text = numbers(s)
			Source.Strings_.Text = strings(s)
			local lin = 1
			s:gsub("\n", function()
				lin = lin + 1
			end)
			Lines.Text = ""
			for i = 1, lin do
				Lines.Text = Lines.Text .. i .. "\n"
			end
		end
	end

	highlight_source("Text")

	Source.Changed:Connect(highlight_source)
end

-- Main Bar
do
	HeHeHeHeUI.Logo.Image = ui_config.Logo

	local function makeInvisAll()
		for i, v in pairs(HeHeHeHeUI.BackFrame:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "MainBar" then
				v.Visible = false
			end
		end
		HeHeHeHeUI.HomeButton.Frame.Visible = false
		HeHeHeHeUI.ScriptHubButton.Frame.Visible = false
		HeHeHeHeUI.FileButton.Frame.Visible = false
		HeHeHeHeUI.SettingButton.Frame.Visible = false
	end
	
	makeInvisAll()
	HeHeHeHeUI.HomeButton.Frame.Visible = true
	HeHeHeHeUI.HomePage.Visible = true

	HeHeHeHeUI.HomeButton.MouseButton1Click:Connect(function()
		makeInvisAll()
		HeHeHeHeUI.HomeButton.Frame.Visible = true
		HeHeHeHeUI.HomePage.Visible = true
	end)

	function openScriptHubF()
		makeInvisAll()
		HeHeHeHeUI.ScriptHubButton.Frame.Visible = true
		HeHeHeHeUI.ScriptPage.Visible = true
	end

	HeHeHeHeUI.ScriptHubButton.MouseButton1Click:Connect(openScriptHubF)

	HeHeHeHeUI.FileButton.MouseButton1Click:Connect(function()
		makeInvisAll()
		HeHeHeHeUI.FileButton.Frame.Visible = true
		HeHeHeHeUI.FilePage.Visible = true
	end)

	HeHeHeHeUI.SettingButton.MouseButton1Click:Connect(function()
		makeInvisAll()
		HeHeHeHeUI.SettingButton.Frame.Visible = true
		HeHeHeHeUI.SettingPage.Visible = true
	end)
	
	HeHeHeHeUI.FileButton.Visible = false
	HeHeHeHeUI.SettingButton.Visible = false
end

-- Home Page

do
	for i, v in pairs(ui_config.Devs) do
		local path = HeHeHeHeUI.DevList["DevTemplate" .. i]
		path.Who.Text = v[1]
		path.Role.Text = v[2]
		path.ImageLabel.Image = v[3]
	end

	local devLog = HeHeHeHeUI.UpdateLogLabel
	devLog.Parent = nil

	for i, v in pairs(ui_config.Updates) do
		local e = devLog:Clone()
		e.Text = v
		e.Parent = HeHeHeHeUI.UpdateFrames
	end

	spawn(function()
		local function secondsToHMS(seconds)
			local hours = math.floor(seconds / 3600)
			local minutes = math.floor((seconds % 3600) / 60)
			local secs = seconds % 60
			return string.format("%02d:%02d:%02d", hours, minutes, secs)
		end

		local old = ui_config.TimeKeyLeft

		while wait(1) do
			ui_config.TimeKeyLeft -= 1
			HeHeHeHeUI.KeyTimeLeft.Text = secondsToHMS(ui_config.TimeKeyLeft)			
			HeHeHeHeUI.KeyTimeIn.Size = UDim2.new((1/old*ui_config.TimeKeyLeft), 0, 1, 0)
		end
	end)

	do_highlight(HeHeHeHeUI.Source, HeHeHeHeUI.Lines)

	HeHeHeHeUI.ExScript1.Parent = nil
	HeHeHeHeUI.ExScript2.Parent = nil

	HeHeHeHeUI.ScriptTabsPage.CanvasSize = UDim2.new(0, HeHeHeHeUI.ScriptTabsPage.UIListLayout.AbsoluteContentSize.X, 0, 0)
	HeHeHeHeUI.ScriptTabsPage.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		HeHeHeHeUI.ScriptTabsPage.CanvasSize = UDim2.new(0, HeHeHeHeUI.ScriptTabsPage.UIListLayout.AbsoluteContentSize.X, 0, 0)
	end)

	local count = 0
	local currentTab = nil

	HeHeHeHeUI.Source.Changed:Connect(function()
		if currentTab then
			currentTab:SetAttribute("script", HeHeHeHeUI.Source.Text)
		end
	end)

	local function openScript(button)
		currentTab = button 
		for i, v in pairs(HeHeHeHeUI.ScriptTabsPage:GetChildren()) do
			if v.Name:find("ExScript") then
				v.BackgroundTransparency = 1
			end
		end
		currentTab.BackgroundTransparency = 0.7
		HeHeHeHeUI.Source.Text = currentTab:GetAttribute("script")
	end

	local function addScript()
		count += 1

		local button = HeHeHeHeUI.ExScript2:Clone()
		button.Text = "     Script " .. count
		button:SetAttribute("script", [[print("Hello World!")]])
		button.Parent = HeHeHeHeUI.ScriptTabsPage
		button.DeleteScript.MouseButton1Click:Connect(function()
			if #HeHeHeHeUI.ScriptTabsPage:GetChildren() > 3 then
				button:Destroy()
			end
		end)
		button.MouseButton1Click:Connect(function()
			openScript(button)
		end)

		if count == 1 then
			openScript(button)
		end
	end

	addScript()

	HeHeHeHeUI.AddScripts.MouseButton1Click:Connect(addScript)

	HeHeHeHeUI.ExecuteScript.MouseButton1Click:Connect(function()
		if _dtc_.schedule then
			_dtc_.schedule(HeHeHeHeUI.Source.Text)
		else
			loadstring(HeHeHeHeUI.Source.Text)()
		end
	end)

	HeHeHeHeUI.ClearScript.MouseButton1Click:Connect(function()
		HeHeHeHeUI.Source.Text = ""
	end)

	HeHeHeHeUI.CopyScript.MouseButton1Click:Connect(function()
		setclipboard(HeHeHeHeUI.Source.Text)
	end)

	HeHeHeHeUI.PasteScript.MouseButton1Click:Connect(function()
		HeHeHeHeUI.Source.Text = getclipboard()
	end)
end


-- Script Hub Page
do
	local percent = {
		speed = 10,
		jump = 10,
		gravity = 10,
	}

	local maxvalue, minvalue = 100, 0

	HeHeHeHeUI.Back.MouseButton1Down:Connect(function()
		percent.speed = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.SpeedChange.Back.AbsoluteSize.X) * HeHeHeHeUI.SpeedChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
		HeHeHeHeUI.SpeedChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.SpeedChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.SpeedChange.Back.AbsoluteSize.X), 1, 0)
		HeHeHeHeUI.SpeedChange.Back.TextLabel.Text = `Speed ({percent.speed}%)`
		local moveconnection, releaseconnection
		moveconnection = mouse.Move:Connect(function()
			percent.speed = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.SpeedChange.Back.AbsoluteSize.X) * HeHeHeHeUI.SpeedChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
			HeHeHeHeUI.SpeedChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.SpeedChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.SpeedChange.Back.AbsoluteSize.X), 1, 0)
			HeHeHeHeUI.SpeedChange.Back.TextLabel.Text = `Speed ({percent.speed}%)`
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			HeHeHeHeUI.SpeedChange.Back.TextLabel.Text = `Speed ({percent.speed}%)`
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
				percent.speed = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.SpeedChange.Back.AbsoluteSize.X) * HeHeHeHeUI.SpeedChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
				HeHeHeHeUI.SpeedChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.SpeedChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.SpeedChange.Back.AbsoluteSize.X), 1, 0)
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
			end
		end)
	end)

	HeHeHeHeUI.Back_2.MouseButton1Down:Connect(function()
		percent.jump = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.JumpChange.Back.AbsoluteSize.X) * HeHeHeHeUI.JumpChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
		HeHeHeHeUI.JumpChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.JumpChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.JumpChange.Back.AbsoluteSize.X), 1, 0)
		HeHeHeHeUI.JumpChange.Back.TextLabel.Text = `Jump ({percent.jump}%)`
		local moveconnection, releaseconnection
		moveconnection = mouse.Move:Connect(function()
			percent.jump = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.JumpChange.Back.AbsoluteSize.X) * HeHeHeHeUI.JumpChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
			HeHeHeHeUI.JumpChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.JumpChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.JumpChange.Back.AbsoluteSize.X), 1, 0)
			HeHeHeHeUI.JumpChange.Back.TextLabel.Text = `Jump ({percent.jump}%)`
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			HeHeHeHeUI.JumpChange.Back.TextLabel.Text = `Jump ({percent.jump}%)`
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
				percent.jump = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.JumpChange.Back.AbsoluteSize.X) * HeHeHeHeUI.JumpChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
				HeHeHeHeUI.JumpChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.JumpChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.JumpChange.Back.AbsoluteSize.X), 1, 0)
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
			end
		end)
	end)

	HeHeHeHeUI.Back_3.MouseButton1Down:Connect(function()
		percent.gravity = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.GravityChange.Back.AbsoluteSize.X) * HeHeHeHeUI.GravityChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
		HeHeHeHeUI.GravityChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.GravityChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.GravityChange.Back.AbsoluteSize.X), 1, 0)
		HeHeHeHeUI.GravityChange.Back.TextLabel.Text = `Gravity ({percent.gravity}%)`
		local moveconnection, releaseconnection
		moveconnection = mouse.Move:Connect(function()
			percent.gravity = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.GravityChange.Back.AbsoluteSize.X) * HeHeHeHeUI.GravityChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
			HeHeHeHeUI.GravityChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.GravityChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.GravityChange.Back.AbsoluteSize.X), 1, 0)
			HeHeHeHeUI.GravityChange.Back.TextLabel.Text = `Gravity ({percent.gravity}%)`
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			HeHeHeHeUI.GravityChange.Back.TextLabel.Text = `Gravity ({percent.gravity}%)`
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
				percent.gravity = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / HeHeHeHeUI.GravityChange.Back.AbsoluteSize.X) * HeHeHeHeUI.GravityChange.Back.In.AbsoluteSize.X) + tonumber(minvalue)) or 0
				HeHeHeHeUI.GravityChange.Back.In.Size = UDim2.new(0, math.clamp(mouse.X - HeHeHeHeUI.GravityChange.Back.In.AbsolutePosition.X, 0, HeHeHeHeUI.GravityChange.Back.AbsoluteSize.X), 1, 0)
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
			end
		end)
	end)

	local old_data = {
		speed = 16,
		jump = 50,
		gravity = 196,
	}

	local enable = {
		speed = false,
		jump = false,
		gravity = false,
	}

	HeHeHeHeUI.SpeedChange:FindFirstChild("Active").MouseButton1Click:Connect(function()
		enable.speed = not enable.speed
		HeHeHeHeUI.SpeedChange:FindFirstChild("Active").ImageColor3 = enable.speed and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(140, 140, 140)
	end)

	HeHeHeHeUI.JumpChange:FindFirstChild("Active").MouseButton1Click:Connect(function()
		enable.jump = not enable.jump
		HeHeHeHeUI.JumpChange:FindFirstChild("Active").ImageColor3 = enable.jump and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(140, 140, 140)
	end)

	HeHeHeHeUI.GravityChange:FindFirstChild("Active").MouseButton1Click:Connect(function()
		enable.gravity = not enable.gravity
		HeHeHeHeUI.GravityChange:FindFirstChild("Active").ImageColor3 = enable.gravity and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(140, 140, 140)
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if enable.speed then
					plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(old_data.speed*(percent.speed/10))					
				end
				if enable.jump then
					plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = tonumber(old_data.jump*(percent.jump/10))
				end
				if enable.gravity then
					workspace.Gravity = tonumber(old_data.gravity*(percent.gravity/10))
				end
			end)
		end
	end)

	HeHeHeHeUI.ExPopularScript.Parent = nil
	for i, v in pairs(ui_config.PopularScripts) do
		local e = HeHeHeHeUI.ExPopularScript:Clone()
		e.ExPopularLabel.Text = v[1]
		e.Parent = HeHeHeHeUI.PopularScriptTabs
		e.MouseButton1Click:Connect(function()
			if _dtc_.schedule then
				_dtc_.schedule(v[2])
			else
				loadstring(v[2])()
			end
		end)
	end

	HeHeHeHeUI.ExampleScriptHub.Parent = nil
	HeHeHeHeUI.SearchedPage.CanvasSize = UDim2.new(0, 0, 0, HeHeHeHeUI.SearchedPage.UIGridLayout.AbsoluteContentSize.Y)
	HeHeHeHeUI.SearchedPage.UIGridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		HeHeHeHeUI.SearchedPage.CanvasSize = UDim2.new(0, 0, 0, HeHeHeHeUI.SearchedPage.UIGridLayout.AbsoluteContentSize.Y)
	end)

	local function clearSearched()
		for i, v in pairs(HeHeHeHeUI.SearchedPage:GetChildren()) do
			if v:IsA("Frame") then
				v:Destroy()
			end
		end
	end

	local function addScriptFrame(name, img, source)
		local obj = HeHeHeHeUI.ExampleScriptHub:Clone()
		obj.TextLabel.Text = name
		obj.ImageLabel.Image = img
		obj.Run.MouseButton1Click:Connect(function()
			if _dtc_.schedule then
				_dtc_.schedule(source)
			else
				loadstring(source)()
			end
		end)
        obj.Parent = HeHeHeHeUI.SearchedPage
	end

	local function searchScript()
		clearSearched()
		local KeyWordSearch = HeHeHeHeUI.DeepSearchBox.Text
		local url = "https://scriptblox.com/api/script/search?q=" .. string.gsub(KeyWordSearch, " ", "%%20")
		local response = game:HttpGetAsync(url)
		local http = game:GetService("HttpService")
		local decoded = http:JSONDecode(response)
		for _, script in pairs(decoded.result.scripts) do
			if script.scriptType == "free" and script.isPatched == false then
				if (script.isUniversal == true) then
					addScriptFrame(
						`{script.game.name} | {script.title}`,
						"http://www.roblox.com/asset/?id=119925484",
						script.script
					)
				else
					addScriptFrame(
						`{script.game.name} | {script.title}`,
						"https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid=" .. script.game.gameId .. "&fmt=png&wd=420&ht=420",
						script.script
					)
				end
			end
		end
	end

	HeHeHeHeUI.DeepSearchBox.FocusLost:Connect(searchScript)

	HeHeHeHeUI.QuickSearchBox.FocusLost:Connect(function()
        HeHeHeHeUI.DeepSearchBox.Text = HeHeHeHeUI.QuickSearchBox.Text
		openScriptHubF()
		searchScript()
	end)
end


-- File Page
do
	HeHeHeHeUI.ExampleScriptFile.Parent = nil

	do_highlight(HeHeHeHeUI.Source_2, HeHeHeHeUI.Lines_2)

	HeHeHeHeUI.SavedScriptPage.CanvasSize = UDim2.new(0, 0, 0, HeHeHeHeUI.SavedScriptPage.UIListLayout.AbsoluteContentSize.Y)
	HeHeHeHeUI.SavedScriptPage.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		HeHeHeHeUI.SavedScriptPage.CanvasSize = UDim2.new(0, 0, 0, HeHeHeHeUI.SavedScriptPage.UIListLayout.AbsoluteContentSize.Y)
	end)

	local currentScript = nil

	--for i, v in pairs(getsavedscripts()) do
	--	local obj = HeHeHeHeUI.ExampleScriptFile:Clone()
	--	obj.ScriptName.Text = v
	--	obj.Parent = HeHeHeHeUI.SavedScriptPage
	--	obj.DeleteScript.MouseButton1Click:Connect(function()
	--		delfile(v)
	--	end)
	--	obj.MouseButton1Click:Connect(function()
	--		currentScript = obj
	--		HeHeHeHeUI.Source_2.Text = readfile(v)
	--	end)
	--end

	HeHeHeHeUI.AutoExecPage.CanvasSize = UDim2.new(0, 0, 0, HeHeHeHeUI.AutoExecPage.UIListLayout.AbsoluteContentSize.Y)
	HeHeHeHeUI.AutoExecPage.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		HeHeHeHeUI.AutoExecPage.CanvasSize = UDim2.new(0, 0, 0, HeHeHeHeUI.AutoExecPage.UIListLayout.AbsoluteContentSize.Y)
	end)

	--for i, v in pairs(getautoexecscripts()) do
	--	local obj = HeHeHeHeUI.ExampleScriptFile:Clone()
	--	obj.ScriptName.Text = v
	--	obj.Parent = HeHeHeHeUI.AutoExecPage
	--	obj.DeleteScript.MouseButton1Click:Connect(function()
	--		delfile(v)
	--	end)
	--	obj.MouseButton1Click:Connect(function()
	--		currentScript = obj
	--		HeHeHeHeUI.Source_2.Text = readfile(v)
	--	end)
	--end

	HeHeHeHeUI.ExecuteScriptFile.MouseButton1Click:Connect(function()
		loadstring(HeHeHeHeUI.Source_2.Text)()
	end)

	HeHeHeHeUI.ClearScriptFile.MouseButton1Click:Connect(function()
		HeHeHeHeUI.Source_2.Text = ""
	end)

	HeHeHeHeUI.CopyScriptFile.MouseButton1Click:Connect(function()
		setclipboard(HeHeHeHeUI.Source_2.Text)
	end)

	HeHeHeHeUI.PasteScriptFile.MouseButton1Click:Connect(function()
		HeHeHeHeUI.Source_2.Text = readclipboard()
	end)

	HeHeHeHeUI.SaveScriptFile.MouseButton1Click:Connect(function()
		if currentScript then
			writefile(currentScript.Text, HeHeHeHeUI.Source_2.Text)
		end
	end)

	HeHeHeHeUI.SaveScriptFile.MouseButton1Click:Connect(function()
		if currentScript then
			delfile(currentScript.Text)
			currentScript:Destroy()
			currentScript = nil
		end
	end)

	HeHeHeHeUI.SaveScriptFile.MouseButton1Click:Connect(function()
		local v = `newScript{os.time()}`
		writefile(v, HeHeHeHeUI.Source_2.Text)
		local obj = HeHeHeHeUI.ExampleScriptFile:Clone()
		obj.ScriptName.Text = v
		obj.Parent = HeHeHeHeUI.SavedScriptPage
		obj.DeleteScript.MouseButton1Click:Connect(function()
			delfile(v)
		end)
		obj.MouseButton1Click:Connect(function()
			currentScript = obj
			HeHeHeHeUI.Source_2.Text = readfile(v)
		end)
	end)
end

-- Settings Page
do
	local oldParent = HeHeHeHeUI.ExampleSettingToggle.Parent
	HeHeHeHeUI.ExampleSettingToggle.Parent = nil
	for i, v in pairs(ui_config.Settings) do
		local obj = HeHeHeHeUI.ExampleSettingToggle:Clone()
		obj.TextLabel.Text = v[1]
		local value = false
		obj.TextButton.MouseButton1Click:Connect(function()
			value = not value
			if value then
				obj.TextButton.In.Position = UDim2.new(0,25,0,0)
			else
				obj.TextButton.In.Position = UDim2.new()
			end
			v[2](value)
		end)
		obj.TextButton.In.MouseButton1Click:Connect(function()
			value = not value
			if value then
				obj.TextButton.In.Position = UDim2.new(0,25,0,0)
			else
				obj.TextButton.In.Position = UDim2.new()
			end
			v[2](value)
		end)
		obj.Parent = oldParent
	end
end

local CoolLabel = Instance.new("TextLabel")
CoolLabel.Name = "CoolLabel"
CoolLabel.Parent = HeHeHeHeUI.MainBar
CoolLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CoolLabel.BackgroundTransparency = 1.000
CoolLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
CoolLabel.BorderSizePixel = 0
CoolLabel.Position = UDim2.new(-1.51524031, 0, 0.5, 0)
CoolLabel.Rotation = -90.000
CoolLabel.Size = UDim2.new(3.99222708, 0, 0.0624416508, 0)
CoolLabel.Font = Enum.Font.Unknown
CoolLabel.Text = "h202.me"
CoolLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CoolLabel.TextSize = 49.000
CoolLabel.TextWrapped = true
CoolLabel.TextXAlignment = Enum.TextXAlignment.Left
CoolLabel.TextScaled = true

local MiniLogo = Instance.new("ImageButton")
local MiniLogoUICorner = Instance.new("UICorner")
local MiniLogoStroke = Instance.new("UIStroke")

MiniLogo.Name = "MiniLogo"
MiniLogo.Parent = HeHeHeHeUI.HeHeHeHeUI
MiniLogo.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MiniLogo.BackgroundTransparency = 0.900
MiniLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
MiniLogo.BorderSizePixel = 0
MiniLogo.Position = UDim2.new(0.519738972, 0, 0.0772856474, 0)
MiniLogo.Size = UDim2.new(0.0473612994, 0, 0.0904392749, 0)
MiniLogo.Image = ui_config.Logo

MiniLogoUICorner.Name = "MiniLogoUICorner"
MiniLogoUICorner.CornerRadius = UDim.new(0, 100)
MiniLogoUICorner.Parent = MiniLogo

MiniLogoStroke.Parent = MiniLogo
MiniLogoStroke.Color = Color3.fromRGB(255, 255, 255)
MiniLogoStroke.Thickness = 4

MiniLogo.Visible = false

MiniLogo.MouseButton1Click:Connect(function()
	MiniLogo.Visible = false
	HeHeHeHeUI.BackFrame.Visible = true
end)

MiniLogo.Visible = true
HeHeHeHeUI.BackFrame.Visible = false

MakeDraggable(HeHeHeHeUI.BackFrame, HeHeHeHeUI.BackFrame)
MakeDraggable(MiniLogo, MiniLogo)

local plrAvatar, isReady = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size150x150)

for i, v in pairs(HeHeHeHeUI.HeHeHeHeUI:GetDescendants()) do
	if v.Name == "Avatar" and isReady then
		v.Image = plrAvatar
	elseif v.Name == "Username" then
		local nameMasked = string.sub(plr.Name, 1, 3) .. "*****"
		v.Text = `Welcome back, {nameMasked}!`
	elseif v.Name == "Close1" or v.Name == "Close2" then
		v.MouseButton1Click:Connect(function()
			MiniLogo.Visible = true
			HeHeHeHeUI.BackFrame.Visible = false
		end)
	end
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/refs/heads/main/BloxFruit/Tracking"))()
