/datum/technomancer/spell/haste
	name = "Haste"
	desc = "Allows the target to run at speeds that should not be possible for an ordinary being.  For five seconds, the target \
	runs extremely fast, and cannot be slowed by any means."
	cost = 100
	obj_path = /obj/item/spell/modifier/haste
	ability_icon_state = "tech_haste"
	category = SUPPORT_SPELLS

/obj/item/spell/modifier/haste
	name = "haste"
	desc = "Now you can outrun a Tajara!"
	icon_state = "haste"
	cast_methods = CAST_RANGED
	aspect = ASPECT_FORCE
	light_color = "#FF5C5C"
	modifier_type = /datum/modifier/technomancer/haste
	modifier_duration = 5 SECONDS

/datum/modifier/technomancer/haste
	on_created_text = SPAN_NOTICE("You suddenly find it much easier to move.")
	on_expired_text = SPAN_WARNING("You feel slow again.")

/datum/modifier/technomancer/haste/activate()
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.add_movespeed_modifier(/datum/movespeed_modifier/spell/technomancer/haste)
		H.sprint_cost_factor += -0.2

/datum/modifier/technomancer/haste/deactivate()
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.remove_movespeed_modifier(/datum/movespeed_modifier/spell/technomancer/haste)
		H.sprint_cost_factor += 0.2
