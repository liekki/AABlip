local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", function(self, event)
    self:OnEvent(event, CombatLogGetCurrentEventInfo())
end)

function f:OnEvent(event, ...)
	local timestamp, eventType, something, sourceFlags, sourceName = ...
	local spellName = select(13, ...);
	local playerName = UnitName("player");

	if (sourceName == playerName) then
		if (eventType == "SWING_DAMAGE" or eventType == 'SWING_MISSED') then
			PlaySoundFile("Interface\\AddOns\\AABlip\\blip.ogg", "Master");
		end
		if (eventType == 'SPELL_CAST_SUCCESS' and spellName == 'Heroic Strike') then
			PlaySoundFile("Interface\\AddOns\\AABlip\\blip.ogg", "Master");
		end
		if (eventType == 'SPELL_CAST_SUCCESS' and spellName == 'Cleave') then
			PlaySoundFile("Interface\\AddOns\\AABlip\\blip.ogg", "Master");
		end
	else
		return;
	end
end
