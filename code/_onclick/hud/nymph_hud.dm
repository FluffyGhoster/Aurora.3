/mob/living/carbon/alien/instantiate_hud(datum/hud/HUD)
	HUD.nymph_hud()

/datum/hud/proc/nymph_hud()

	src.adding = list()
	src.other = list()

	var/atom/movable/screen/using

	using = new /atom/movable/screen/movement_intent()
	using.set_dir(SOUTHWEST)
	using.icon = 'icons/mob/screen/diona_nymph.dmi'
	using.icon_state = (mymob.m_intent == M_RUN ? "running" : "walking")
	src.adding += using
	move_intent = using

	mymob.healths = new /atom/movable/screen()
	mymob.healths.icon = 'icons/mob/screen/diona_nymph.dmi'
	mymob.healths.icon_state = "health0"
	mymob.healths.name = "health"
	mymob.healths.screen_loc = ui_alien_health

	mymob.fire = new /atom/movable/screen()
	mymob.fire.icon = 'icons/mob/screen/diona_nymph.dmi'
	mymob.fire.icon_state = "fire0"
	mymob.fire.name = "fire"
	mymob.fire.screen_loc = ui_fire

	mymob.client.screen = null
	mymob.client.screen += list(mymob.healths, mymob.fire)
	mymob.client.screen += src.adding + src.other
