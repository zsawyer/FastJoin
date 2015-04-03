

FastJoin = { }
FastJoin.debugging = false

FastJoin.modName = "FastJoin"
FastJoin.msgPrefix = "[" .. FastJoin.modName .. "] "
FastJoin.infoText = "not initialized" 
FastJoin.joiningSound = "sound/NS2.fev/common/countdown"
FastJoin.reloadingSound = "sound/NS2.fev/common/ping"
FastJoin.delay = nil

function FastJoin.message(message)
    Shared.Message(FastJoin.msgPrefix .. message)
end

function FastJoin.debug(message)
    if FastJoin.debugging then
        FastJoin.message(message)
    end
end

function FastJoin.init(delay)
    FastJoin.delay = delay
    FastJoin.infoText = "delay set to " .. FastJoin.delay
    FastJoin.debug("debugging enabled")
    FastJoin.message(FastJoin.infoText)
    
    Client.PrecacheLocalSound(FastJoin.reloadingSound)
    Client.PrecacheLocalSound(FastJoin.joiningSound)
end

function FastJoin.playSound(sound)
    FastJoin.debug("playing sound '" .. sound .. "'")
    MenuManager.PlaySound(sound)
end

function FastJoin.playReloading()
    FastJoin.playSound(FastJoin.reloadingSound)    
end

function FastJoin.playJoining()
    FastJoin.playSound(FastJoin.joiningSound)    
end