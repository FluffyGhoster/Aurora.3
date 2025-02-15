
/datum/hud/proc/unplayer_hud()
	return

/mob/abstract/ghost/observer/instantiate_hud(datum/hud/HUD)
	HUD.ghost_hud()

/datum/hud/proc/ghost_hud()
	return

/mob/living/carbon/brain/instantiate_hud(datum/hud/HUD)
	return

/mob/living/silicon/ai/instantiate_hud(datum/hud/HUD)
	HUD.ai_hud()

/datum/hud/proc/blob_hud(ui_style = 'icons/mob/screen/midnight.dmi')

	blobpwrdisplay = new /atom/movable/screen()
	blobpwrdisplay.name = "blob power"
	blobpwrdisplay.icon_state = "block"
	blobpwrdisplay.screen_loc = ui_health

	blobhealthdisplay = new /atom/movable/screen()
	blobhealthdisplay.name = "blob health"
	blobhealthdisplay.icon_state = "block"
	blobhealthdisplay.screen_loc = ui_internal

	mymob.client.screen = null

	mymob.client.screen += list(blobpwrdisplay, blobhealthdisplay)

/mob/living/carbon/slime/instantiate_hud(datum/hud/HUD)
	HUD.slime_hud()

/datum/hud/proc/slime_hud(ui_style = 'icons/mob/screen/midnight.dmi')

	src.adding = list()

	var/atom/movable/screen/using

	using = new /atom/movable/screen()
	using.name = "act_intent"
	using.set_dir(SOUTHWEST)
	using.icon = ui_style
	using.icon_state = "intent_"+mymob.a_intent
	using.screen_loc = ui_zonesel
	src.adding += using
	action_intent = using

	//intent small hud objects
	var/icon/ico

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),1,ico.Height()/2,ico.Width()/2,ico.Height())
	using = new /atom/movable/screen( src )
	using.name = "help"
	using.icon = ico
	using.screen_loc = ui_zonesel
	src.adding += using
	help_intent = using

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),ico.Width()/2,ico.Height()/2,ico.Width(),ico.Height())
	using = new /atom/movable/screen( src )
	using.name = "disarm"
	using.icon = ico
	using.screen_loc = ui_zonesel
	src.adding += using
	disarm_intent = using

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),ico.Width()/2,1,ico.Width(),ico.Height()/2)
	using = new /atom/movable/screen( src )
	using.name = "grab"
	using.icon = ico
	using.screen_loc = ui_zonesel
	src.adding += using
	grab_intent = using

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),1,1,ico.Width()/2,ico.Height()/2)
	using = new /atom/movable/screen( src )
	using.name = I_HURT
	using.icon = ico
	using.screen_loc = ui_zonesel
	src.adding += using
	hurt_intent = using

	mymob.client.screen = null
	mymob.client.screen += src.adding

	return

/mob/living/simple_animal/construct/instantiate_hud(datum/hud/HUD)
	HUD.construct_hud()

/datum/hud/proc/construct_hud()
	var/constructtype

	if(istype(mymob, /mob/living/simple_animal/construct/armored))
		constructtype = "juggernaut"
	else if(istype(mymob, /mob/living/simple_animal/construct/builder))
		constructtype = "artificer"
	else if(istype(mymob, /mob/living/simple_animal/construct/wraith))
		constructtype = "wraith"
	else if(istype(mymob, /mob/living/simple_animal/construct/harvester))
		constructtype = "harvester"

	if(constructtype)
		mymob.fire = new /atom/movable/screen()
		mymob.fire.icon = 'icons/mob/screen/construct.dmi'
		mymob.fire.icon_state = "fire0"
		mymob.fire.name = "fire"
		mymob.fire.screen_loc = ui_construct_fire

		mymob.healths = new /atom/movable/screen()
		mymob.healths.icon = 'icons/mob/screen/construct.dmi'
		mymob.healths.icon_state = "[constructtype]_health0"
		mymob.healths.name = "health"
		mymob.healths.screen_loc = ui_construct_health

		mymob.pullin = new /atom/movable/screen()
		mymob.pullin.icon = 'icons/mob/screen/construct.dmi'
		mymob.pullin.icon_state = "pull0"
		mymob.pullin.name = "pull"
		mymob.pullin.screen_loc = ui_construct_pull

		mymob.zone_sel = new /atom/movable/screen/zone_sel()

		mymob.zone_sel.icon = 'icons/mob/screen/construct.dmi'
		mymob.zone_sel.ClearOverlays()
		mymob.zone_sel.AddOverlays(image('icons/mob/zone_sel.dmi', "[mymob.zone_sel.selecting]"))

		mymob.purged = new /atom/movable/screen()
		mymob.purged.icon = 'icons/mob/screen/construct.dmi'
		mymob.purged.icon_state = "purge0"
		mymob.purged.name = "purged"
		mymob.purged.screen_loc = ui_construct_purge

	mymob.client.screen = null

	mymob.client.screen += list(mymob.fire, mymob.healths, mymob.pullin, mymob.zone_sel, mymob.purged)
