local Services = {
	Players = game:GetService("Players"),
	TweenService = game:GetService("TweenService"),
	CoreGui = game:GetService("CoreGui")
}

local LocalPlayer = Services.Players.LocalPlayer
local TargetParent = (function()
	local success, result = pcall(function() return Services.CoreGui end)
	if success and result then return result end
	return LocalPlayer:WaitForChild("PlayerGui")
end)()

local oldLoading = TargetParent:FindFirstChild("NARS_LoadingScreen")
if oldLoading then oldLoading:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NARS_LoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

local Card = Instance.new("Frame")
Card.Name = "StartupCard"
Card.AnchorPoint = Vector2.new(0.5, 0.5)
Card.Position = UDim2.new(0.5, 0, 0.5, 0)
Card.Size = UDim2.fromScale(0.45, 0.30)
Card.BackgroundColor3 = Color3.fromRGB(24, 25, 28)
Card.BackgroundTransparency = 1
Card.BorderSizePixel = 0
Card.ClipsDescendants = true
Card.Parent = ScreenGui

local CardConstraint = Instance.new("UISizeConstraint")
CardConstraint.MinSize = Vector2.new(360, 190)
CardConstraint.MaxSize = Vector2.new(410, 215)
CardConstraint.Parent = Card

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(45, 47, 52)
CardStroke.Thickness = 1
CardStroke.Transparency = 1
CardStroke.Parent = Card

local HeaderPanel = Instance.new("Frame")
HeaderPanel.Name = "HeaderPanel"
HeaderPanel.Size = UDim2.new(1, 0, 0, 28)
HeaderPanel.BackgroundColor3 = Color3.fromRGB(18, 19, 22)
HeaderPanel.BackgroundTransparency = 1
HeaderPanel.BorderSizePixel = 0
HeaderPanel.Parent = Card

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Name = "HeaderTitle"
HeaderTitle.Size = UDim2.new(1, -24, 1, 0)
HeaderTitle.Position = UDim2.new(0, 12, 0, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = "NARSEVR CODE EDITOR"
HeaderTitle.TextColor3 = Color3.fromRGB(140, 143, 148)
HeaderTitle.TextTransparency = 1
HeaderTitle.Font = Enum.Font.Code
HeaderTitle.TextSize = 10
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Parent = HeaderPanel

local HeaderDivider = Instance.new("Frame")
HeaderDivider.Name = "HeaderDivider"
HeaderDivider.Size = UDim2.new(1, 0, 0, 1)
HeaderDivider.Position = UDim2.new(0, 0, 0, 28)
HeaderDivider.BackgroundColor3 = Color3.fromRGB(38, 40, 44)
HeaderDivider.BackgroundTransparency = 1
HeaderDivider.BorderSizePixel = 0
HeaderDivider.Parent = Card

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -29)
ContentFrame.Position = UDim2.new(0, 0, 0, 29)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = Card

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -32, 0, 26)
TitleLabel.Position = UDim2.new(0, 16, 0, 14)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "NarsEvr"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.TextTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = ContentFrame

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "Subtitle"
SubtitleLabel.Size = UDim2.new(1, -32, 0, 14)
SubtitleLabel.Position = UDim2.new(0, 16, 0, 42)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Luau Development Environment"
SubtitleLabel.TextColor3 = Color3.fromRGB(130, 133, 138)
SubtitleLabel.TextTransparency = 1
SubtitleLabel.Font = Enum.Font.GothamMedium
SubtitleLabel.TextSize = 11
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
SubtitleLabel.Parent = ContentFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "Status"
StatusLabel.Size = UDim2.new(1, -32, 0, 14)
StatusLabel.Position = UDim2.new(0, 16, 0, 78)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Initializing Editor..."
StatusLabel.TextColor3 = Color3.fromRGB(170, 173, 178)
StatusLabel.TextTransparency = 1
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = ContentFrame

local ProgressTrack = Instance.new("Frame")
ProgressTrack.Name = "ProgressTrack"
ProgressTrack.Size = UDim2.new(1, -100, 0, 3)
ProgressTrack.Position = UDim2.new(0, 50, 0, 98)
ProgressTrack.BackgroundColor3 = Color3.fromRGB(38, 40, 45)
ProgressTrack.BackgroundTransparency = 1
ProgressTrack.BorderSizePixel = 0
ProgressTrack.Parent = ContentFrame

local ProgressBar = Instance.new("Frame")
ProgressBar.Name = "ProgressBar"
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
ProgressBar.BackgroundTransparency = 1
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressTrack

local FooterDivider = Instance.new("Frame")
FooterDivider.Name = "FooterDivider"
FooterDivider.Size = UDim2.new(1, 0, 0, 1)
FooterDivider.Position = UDim2.new(0, 0, 1, -22)
FooterDivider.BackgroundColor3 = Color3.fromRGB(38, 40, 44)
FooterDivider.BackgroundTransparency = 1
FooterDivider.BorderSizePixel = 0
FooterDivider.Parent = ContentFrame

local BrandingLabel = Instance.new("TextLabel")
BrandingLabel.Name = "Branding"
BrandingLabel.Size = UDim2.new(0.5, -16, 0, 21)
BrandingLabel.Position = UDim2.new(0, 12, 1, -21)
BrandingLabel.BackgroundTransparency = 1
BrandingLabel.Text = "NARS' ENDEAVOR"
BrandingLabel.TextColor3 = Color3.fromRGB(100, 103, 108)
BrandingLabel.TextTransparency = 1
BrandingLabel.Font = Enum.Font.GothamBold
BrandingLabel.TextSize = 9
BrandingLabel.TextXAlignment = Enum.TextXAlignment.Left
BrandingLabel.Parent = ContentFrame

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "Version"
VersionLabel.Size = UDim2.new(0.5, -16, 0, 21)
VersionLabel.Position = UDim2.new(0.5, 4, 1, -21)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v2.0"
VersionLabel.TextColor3 = Color3.fromRGB(100, 103, 108)
VersionLabel.TextTransparency = 1
VersionLabel.Font = Enum.Font.Code
VersionLabel.TextSize = 9
VersionLabel.TextXAlignment = Enum.TextXAlignment.Right
VersionLabel.Parent = ContentFrame

local CropOverlay = Instance.new("Frame")
CropOverlay.Name = "CropOverlay"
CropOverlay.Size = UDim2.new(0, 0, 1, 0)
CropOverlay.Position = UDim2.new(0, 0, 0, 0)
CropOverlay.BackgroundColor3 = Color3.fromRGB(24, 25, 28)
CropOverlay.BackgroundTransparency = 1
CropOverlay.BorderSizePixel = 0
CropOverlay.ZIndex = 10
CropOverlay.Parent = Card

local function tween(inst, duration, props, style, dir)
	local info = TweenInfo.new(duration, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out)
	local t = Services.TweenService:Create(inst, info, props)
	t:Play()
	return t
end

task.spawn(function()
	tween(Card, 0.5, { BackgroundTransparency = 0 })
	tween(HeaderPanel, 0.5, { BackgroundTransparency = 0 })
	tween(CardStroke, 0.5, { Transparency = 0 })
	tween(HeaderDivider, 0.5, { BackgroundTransparency = 0 })
	tween(FooterDivider, 0.5, { BackgroundTransparency = 0 })
	
	tween(HeaderTitle, 0.45, { TextTransparency = 0 })
	tween(TitleLabel, 0.45, { TextTransparency = 0 })
	tween(SubtitleLabel, 0.45, { TextTransparency = 0 })
	tween(StatusLabel, 0.45, { TextTransparency = 0 })
	tween(ProgressTrack, 0.45, { BackgroundTransparency = 0 })
	tween(ProgressBar, 0.45, { BackgroundTransparency = 0 })
	tween(BrandingLabel, 0.45, { TextTransparency = 0 })
	tween(VersionLabel, 0.45, { TextTransparency = 0 })

	task.wait(0.6)

	local stages = {
		{ progress = 0.15, status = "Initializing Editor Environment...", delay = 0.65 },
		{ progress = 0.35, status = "Loading API Database...", delay = 0.85 },
		{ progress = 0.60, status = "Loading Core Components...", delay = 0.95 },
		{ progress = 0.82, status = "Loading Explorer & Syntax Rules...", delay = 0.80 },
		{ progress = 0.95, status = "Finalizing System...", delay = 0.60 },
		{ progress = 1.00, status = "Ready!", delay = 0.50 }
	}

	for _, stage in ipairs(stages) do
		StatusLabel.Text = stage.status
		tween(ProgressBar, stage.delay, { Size = UDim2.new(stage.progress, 0, 1, 0) }, Enum.EasingStyle.Sine)
		task.wait(stage.delay + 0.15)
	end
		
	task.wait(0.5)

	CropOverlay.BackgroundTransparency = 0
	HeaderTitle.TextTransparency = 1
	TitleLabel.TextTransparency = 1
	SubtitleLabel.TextTransparency = 1
	StatusLabel.TextTransparency = 1
	ProgressTrack.BackgroundTransparency = 1
	ProgressBar.BackgroundTransparency = 1
	BrandingLabel.TextTransparency = 1
	VersionLabel.TextTransparency = 1
	HeaderPanel.BackgroundTransparency = 1
	HeaderDivider.BackgroundTransparency = 1
	FooterDivider.BackgroundTransparency = 1
	CardStroke.Transparency = 1

	local wipeTween = tween(CropOverlay, 0.55, { 
		Size = UDim2.new(1, 0, 1, 0)
	}, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

	wipeTween.Completed:Wait()

	ScreenGui:Destroy()

	local mainUrl = "https://raw.githubusercontent.com/narakuhub/narsenvr-editorcode/refs/heads/main/main.lua"
	local fetchSuccess, sourceCode = pcall(function()
		return game:HttpGet(mainUrl)
	end)

	if fetchSuccess and sourceCode then
		local loadSuccess, mainFunction = pcall(function()
			return loadstring(sourceCode)
		end)

		if loadSuccess and mainFunction then
			pcall(mainFunction)
		end
	end
end)
