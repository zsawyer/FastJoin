

FastJoin = { }
FastJoin.debugging = false

FastJoin.modName = "FastJoin"
FastJoin.build = "b0008"
FastJoin.msgPrefix = "[" .. FastJoin.modName .. "] "
FastJoin.infoText = "not initialized" 
FastJoin.joiningSound = "sound/NS2.fev/common/countdown"
FastJoin.reloadingSound = "sound/NS2.fev/common/ping"
FastJoin.delay = nil

FastJoin.timeLastSoundPlayed = Shared.GetTime()

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
    
    FastJoin.debug("initialized (build " .. FastJoin.build .. ")")
end

function FastJoin.playSound(filename)
    FastJoin.debug("playing sound '" .. filename .. "'")
    StartSoundEffect(filename)
    FastJoin.timeLastSoundPlayed = Shared.GetTime()
end

function FastJoin.playReloading()
    if not FastJoin.isSoundPlaying() then 
        FastJoin.playSound(FastJoin.reloadingSound)    
    end
end

function FastJoin.playJoining()
    FastJoin.playSound(FastJoin.joiningSound)    
end

function FastJoin.isSoundPlaying()
    estimatedPlaytime = 1 -- we don't know the actual time it takes for the sound to play so we assume 1 second out of the blue
    playing = (FastJoin.timeLastSoundPlayed + estimatedPlaytime) > Shared.GetTime()
    FastJoin.debug("isSoundPlaying = " .. tostring(playing))
    return playing
end