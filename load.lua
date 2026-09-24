--!strict

local executorEnv = getfenv() :: any

local function resolveHost(): Instance
	local getHiddenUi = executorEnv.gethui or executorEnv.get_hidden_gui

	if type(getHiddenUi) == "function" then
		local ok, hidden = pcall(getHiddenUi)

		if ok and typeof(hidden) == "Instance" then
			return hidden
		end
	end

	local ok, coreGui = pcall(function()
		return game:GetService("CoreGui")
	end)

	if ok and typeof(coreGui) == "Instance" then
		return coreGui
	end

	local players = game:GetService("Players")
	local player = players.LocalPlayer

	return player:WaitForChild("PlayerGui")
end

local host = resolveHost()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.DisplayOrder = 999
ScreenGui.Enabled = true
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = host

local CanvasGroup = Instance.new("CanvasGroup")
CanvasGroup.Name = "CanvasGroup"
CanvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
CanvasGroup.Size = UDim2.fromOffset(300, 200)
CanvasGroup.Position = UDim2.fromScale(0.5, 0.5)
CanvasGroup.Rotation = 0
CanvasGroup.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
CanvasGroup.BackgroundTransparency = 0
CanvasGroup.BorderSizePixel = 0
CanvasGroup.ClipsDescendants = true
CanvasGroup.GroupColor3 = Color3.fromRGB(255, 255, 255)
CanvasGroup.GroupTransparency = 0
CanvasGroup.Visible = true
CanvasGroup.Active = true
CanvasGroup.ZIndex = 1
CanvasGroup.LayoutOrder = 0
CanvasGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
CanvasGroup.Parent = ScreenGui

local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.AnchorPoint = Vector2.new(0.0, 0.0)
Frame.Size = UDim2.fromOffset(275, 330)
Frame.Position = UDim2.fromOffset(220, -20)
Frame.Rotation = 115
Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = false
Frame.Visible = true
Frame.Active = false
Frame.ZIndex = 1
Frame.LayoutOrder = 0
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Parent = CanvasGroup

local UIShadow = Instance.new("UIShadow")
UIShadow.Name = "UIShadow"
UIShadow.ZIndex = -1
UIShadow.BlurRadius = UDim.new(0.0, 12)
UIShadow.Color = Color3.fromRGB(0, 0, 0)
UIShadow.Enabled = true
UIShadow.Offset = UDim2.fromOffset(0, 4)
UIShadow.Spread = UDim2.fromScale(0, 0)
UIShadow.Transparency = 0.5
UIShadow.Parent = Frame

local UIShadow_1 = Instance.new("UIShadow")
UIShadow_1.Name = "UIShadow"
UIShadow_1.ZIndex = -1
UIShadow_1.BlurRadius = UDim.new(0.0, 12)
UIShadow_1.Color = Color3.fromRGB(0, 0, 0)
UIShadow_1.Enabled = true
UIShadow_1.Offset = UDim2.fromOffset(0, 4)
UIShadow_1.Spread = UDim2.fromScale(0, 0)
UIShadow_1.Transparency = 0.5
UIShadow_1.Parent = CanvasGroup

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.AnchorPoint = Vector2.new(0.0, 0.0)
Title.Size = UDim2.fromOffset(60, 20)
Title.Position = UDim2.fromOffset(70, 20)
Title.Rotation = 0
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Visible = true
Title.Active = true
Title.ZIndex = 1
Title.LayoutOrder = 0
Title.Text = "ECODE"
Title.TextColor3 = Color3.fromRGB(223, 230, 232)
Title.TextSize = 18
Title.TextScaled = false
Title.TextWrapped = true
Title.TextTransparency = 0
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.TextYAlignment = Enum.TextYAlignment.Center
Title.RichText = false
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.Parent = CanvasGroup

local SubTitle = Instance.new("TextLabel")
SubTitle.Name = "SubTitle"
SubTitle.AnchorPoint = Vector2.new(0.0, 0.0)
SubTitle.Size = UDim2.fromOffset(140, 12)
SubTitle.Position = UDim2.fromOffset(30, 37)
SubTitle.Rotation = 0
SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubTitle.BackgroundTransparency = 1
SubTitle.BorderSizePixel = 0
SubTitle.Visible = true
SubTitle.Active = true
SubTitle.ZIndex = 1
SubTitle.LayoutOrder = 0
SubTitle.Text = "Lua Scripting Environment"
SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SubTitle.TextSize = 12
SubTitle.TextScaled = false
SubTitle.TextWrapped = false
SubTitle.TextTransparency = 0
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.TextXAlignment = Enum.TextXAlignment.Center
SubTitle.TextYAlignment = Enum.TextYAlignment.Center
SubTitle.RichText = false
SubTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubTitle.Parent = CanvasGroup

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.AnchorPoint = Vector2.new(0.0, 0.0)
Status.Size = UDim2.fromOffset(100, 12)
Status.Position = UDim2.fromOffset(45, 130)
Status.Rotation = 0
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1
Status.BorderSizePixel = 0
Status.Visible = true
Status.Active = true
Status.ZIndex = 1
Status.LayoutOrder = 0
Status.Text = "Loading Ecode..."
Status.TextColor3 = Color3.fromRGB(180, 180, 180)
Status.TextSize = 11
Status.TextScaled = false
Status.TextWrapped = false
Status.TextTransparency = 0
Status.Font = Enum.Font.GothamMedium
Status.TextXAlignment = Enum.TextXAlignment.Center
Status.TextYAlignment = Enum.TextYAlignment.Center
Status.RichText = false
Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status.Parent = CanvasGroup

local Progres = Instance.new("Frame")
Progres.Name = "Progres"
Progres.AnchorPoint = Vector2.new(0.0, 0.0)
Progres.Size = UDim2.fromOffset(100, 5)
Progres.Position = UDim2.fromOffset(45, 145)
Progres.Rotation = 0
Progres.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Progres.BackgroundTransparency = 0
Progres.BorderSizePixel = 0
Progres.ClipsDescendants = false
Progres.Visible = true
Progres.Active = true
Progres.ZIndex = 1
Progres.LayoutOrder = 0
Progres.BorderColor3 = Color3.fromRGB(0, 0, 0)
Progres.Parent = CanvasGroup

local Fill = Instance.new("Frame")
Fill.Name = "Fill"
Fill.AnchorPoint = Vector2.new(0.0, 0.0)
Fill.Size = UDim2.fromOffset(10, 5)
Fill.Position = UDim2.fromScale(0, 0)
Fill.Rotation = 0
Fill.BackgroundColor3 = Color3.fromRGB(60, 117, 203)
Fill.BackgroundTransparency = 0
Fill.BorderSizePixel = 0
Fill.ClipsDescendants = false
Fill.Visible = true
Fill.Active = true
Fill.ZIndex = 1
Fill.LayoutOrder = 0
Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fill.Parent = Progres

local Creator = Instance.new("TextLabel")
Creator.Name = "Creator"
Creator.AnchorPoint = Vector2.new(0.0, 0.0)
Creator.Size = UDim2.fromOffset(120, 12)
Creator.Position = UDim2.fromOffset(170, 184)
Creator.Rotation = 0
Creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Creator.BackgroundTransparency = 1
Creator.BorderSizePixel = 0
Creator.Visible = true
Creator.Active = true
Creator.ZIndex = 1
Creator.LayoutOrder = 0
Creator.Text = "Developed by Nars'Edv"
Creator.TextColor3 = Color3.fromRGB(120, 118, 118)
Creator.TextSize = 11
Creator.TextScaled = false
Creator.TextWrapped = false
Creator.TextTransparency = 0
Creator.Font = Enum.Font.GothamMedium
Creator.TextXAlignment = Enum.TextXAlignment.Center
Creator.TextYAlignment = Enum.TextYAlignment.Center
Creator.RichText = false
Creator.BorderColor3 = Color3.fromRGB(0, 0, 0)
Creator.Parent = CanvasGroup

local Version = Instance.new("TextLabel")
Version.Name = "Version"
Version.AnchorPoint = Vector2.new(0.0, 0.0)
Version.Size = UDim2.fromOffset(60, 12)
Version.Position = UDim2.fromOffset(240, 10)
Version.Rotation = 0
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1
Version.BorderSizePixel = 0
Version.Visible = true
Version.Active = true
Version.ZIndex = 1
Version.LayoutOrder = 0
Version.Text = "V0.02"
Version.TextColor3 = Color3.fromRGB(120, 118, 118)
Version.TextSize = 10
Version.TextScaled = false
Version.TextWrapped = false
Version.TextTransparency = 0
Version.Font = Enum.Font.GothamMedium
Version.TextXAlignment = Enum.TextXAlignment.Center
Version.TextYAlignment = Enum.TextYAlignment.Center
Version.RichText = false
Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
Version.Parent = CanvasGroup

local TweenService = game:GetService("TweenService")

local Services = {
	TweenService = TweenService
}

local loadSteps = {
	"Initializing Ecode...",
	"Loading Editor Components...",
	"Preparing Lua Environment...",
	"Initializing Debugger...",
	"Ecode Ready..."
}

local totalDuration = 10
local stepDuration = totalDuration / #loadSteps
local typeDuration = 0.45

Status.TextTruncate = Enum.TextTruncate.AtEnd

CanvasGroup.Visible = true
CanvasGroup.GroupTransparency = 0
CanvasGroup.ClipsDescendants = true

Fill.Size = UDim2.fromOffset(0, 5)

local CropOverlay = Instance.new("Frame")
CropOverlay.Name = "CropOverlay"
CropOverlay.AnchorPoint = Vector2.new(0, 0)
CropOverlay.Position = UDim2.fromScale(0, 0)
CropOverlay.Size = UDim2.new(0, 0, 1, 0)
CropOverlay.BackgroundColor3 = CanvasGroup.BackgroundColor3
CropOverlay.BackgroundTransparency = 1
CropOverlay.BorderSizePixel = 0
CropOverlay.ZIndex = 999
CropOverlay.Parent = CanvasGroup

local function tween(inst, duration, props, style, dir)
	local info = TweenInfo.new(
		duration,
		style or Enum.EasingStyle.Quad,
		dir or Enum.EasingDirection.Out
	)

	local t = Services.TweenService:Create(inst, info, props)
	t:Play()

	return t
end

local function typeStatus(text)
	Status.Text = ""

	local characterCount = #text
	local delay = typeDuration / characterCount

	for i = 1, characterCount do
		Status.Text = string.sub(text, 1, i)
		task.wait(delay)
	end
end

task.spawn(function()
	tween(CanvasGroup, 0.5, {
		GroupTransparency = 0
	})

	task.wait(0.6)

	local stages = {
		{
			progress = 0.20,
			status = "Initializing Ecode..."
		},
		{
			progress = 0.40,
			status = "Loading Editor Components..."
		},
		{
			progress = 0.60,
			status = "Preparing Lua Environment..."
		},
		{
			progress = 0.80,
			status = "Initializing Debugger..."
		},
		{
			progress = 1.00,
			status = "Ecode Ready..."
		}
	}

	for _, stage in ipairs(stages) do
		task.spawn(function()
			typeStatus(stage.status)
		end)

		local progressTween = tween(
			Fill,
			stepDuration,
			{
				Size = UDim2.new(stage.progress, 0, 1, 0)
			},
			Enum.EasingStyle.Sine
		)

		progressTween.Completed:Wait()
	end

	task.wait(0.5)

	CropOverlay.BackgroundTransparency = 0

	Title.TextTransparency = 1
	SubTitle.TextTransparency = 1
	Status.TextTransparency = 1
	Creator.TextTransparency = 1
	Version.TextTransparency = 1

	Fill.BackgroundTransparency = 1
	Progres.BackgroundTransparency = 1

	local wipeTween = tween(
		CropOverlay,
		0.55,
		{
			Size = UDim2.new(1, 0, 1, 0)
		},
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut
	)

	wipeTween.Completed:Wait()

	CanvasGroup.Visible = false

	local mainUrl =
		"https://raw.githubusercontent.com/narakuhub/narsenvr-editorcode/refs/heads/main/main.lua"

	local fetchSuccess, sourceCode = pcall(function()
		return game:HttpGet(mainUrl)
	end)

	if fetchSuccess and sourceCode and sourceCode ~= "" then
		local loadSuccess, mainFunction = pcall(function()
			return loadstring(sourceCode)
		end)

		if loadSuccess and mainFunction then
			pcall(mainFunction)
		end
	end
end)
return {
	ScreenGui = ScreenGui,
	CanvasGroup = CanvasGroup,
	Frame = Frame,
	UIShadow = UIShadow,
	UIShadow_1 = UIShadow_1,
	Title = Title,
	SubTitle = SubTitle,
	Status = Status,
	Progres = Progres,
	Fill = Fill,
	Creator = Creator,
	Version = Version
}
