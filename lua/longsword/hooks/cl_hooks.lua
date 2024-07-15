longsword.rt = longsword.rt or 	GetRenderTarget("ls_rendertarget", ScrW(), ScrH())
longsword.rtmat = CreateMaterial("ls_rendertargetmaterial", "UnlitGeneric", {
	["$basetexture"] = longsword.rt:GetName(),
	["$model"] = 1
})
hook.Add("PostPlayerDraw", "longsword2DrawWorldAttachment", function()
	/*
	local wep = LocalPlayer():GetActiveWeapon()

	if not IsValid(wep) then
		return
	end

	if IsValid(wep.worldAttachment) then
		wep.worldAttachment:DrawModel()
		wep.worldAttachment:SetRenderOrigin()
		wep.worldAttachment:SetRenderAngles()
	end
	*/
end)

hook.Add("ShouldDrawHUDBox", "longsword2impulseHUDStopDrawing", function()
	local v = tonumber(ls_StopHUDDraw or 1)
	ls_StopHUDDraw = false

	return tobool(v)
end)
hook.Add("RenderScreenspaceEffects", "longsword2PostFX", function()
	local wep = LocalPlayer():GetActiveWeapon()

	if not IsValid(wep) or not wep.RenderScreenspaceEffects then return end

	wep:RenderScreenspaceEffects()
end)