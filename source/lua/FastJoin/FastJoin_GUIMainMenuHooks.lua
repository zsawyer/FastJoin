FastJoin.debug("hooking into GUIMainMenu...")


local originalInitialize = GUIMainMenu.Initialize    
function GUIMainMenu:Initialize()
    local autoJoinUpdateDelay = 0.1 // NS2 default was 0.5
    FastJoin.init(autoJoinUpdateDelay)
    
	originalInitialize(self);
end


local originalUpdate = GUIMainMenu.Update
function GUIMainMenu:Update(deltaTime)
    originalUpdate(self, deltaTime)
    --FastJoin.debug("hooked in update method")
    
    
    -- ORIGINAL FROM lua/menu/GUIMainMenu.lua START
    if self.updateAutoJoin then

        if not self.timeLastAutoJoinUpdate or self.timeLastAutoJoinUpdate + FastJoin.delay < Shared.GetTime() then -- FastJoin edit
        
            FastJoin.debug("Server refreshed (" .. Shared.GetTime() .. ")") -- FastJoin edit
            FastJoin.playReloading() -- FastJoin edit
            Client.RefreshServer(MainMenu_GetSelectedServer())
            
            if MainMenu_GetSelectedIsFull() then
                self.timeLastAutoJoinUpdate = Shared.GetTime()
            else
                FastJoin.playJoining() -- FastJoin edit
                MainMenu_JoinSelected()
                self.autoJoinWindow:SetIsVisible(false)
                
            end
            
        end
        
    end
    -- ORIGINAL FROM lua/menu/GUIMainMenu.lua END
end

FastJoin.debug("done hooking into GUIMainMenu.")