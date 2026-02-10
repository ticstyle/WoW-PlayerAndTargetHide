local function ShutdownFrame(frame)
    if not frame then return end
    
    frame:Hide()
    frame:UnregisterAllEvents()
    
    if not frame.IsHookedByDuality then
        hooksecurefunc(frame, "Show", function(f) f:Hide() end)
        frame.IsHookedByDuality = true
    end
end

local function InitialHide()
    ShutdownFrame(PlayerFrame)
    ShutdownFrame(TargetFrame)
end

InitialHide()

local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_ENTERING_WORLD")
loader:SetScript("OnEvent", function()
    InitialHide()
end)
