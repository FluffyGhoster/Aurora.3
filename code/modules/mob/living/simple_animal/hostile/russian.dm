/mob/living/simple_animal/hostile/russian
	name = "russian"
	desc = "For the Motherland!"
	icon = 'icons/mob/npc/human.dmi'
	icon_state = "russianmelee"
	icon_living = "russianmelee"
	icon_dead = "russianmelee_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 5
	organ_names = list("chest", "lower body", "left arm", "right arm", "left leg", "right leg", "head")
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 4
	stop_automated_movement_when_pulled = 0
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "punched"
	a_intent = I_HURT
	var/corpse = /obj/effect/landmark/mobcorpse/russian
	var/weapon1 = /obj/item/material/knife
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	faction = "russian"
	status_flags = CANPUSH

	tameable = FALSE


/mob/living/simple_animal/hostile/russian/ranged
	icon_state = "russianranged"
	icon_living = "russianranged"
	corpse = /obj/effect/landmark/mobcorpse/russian/ranged
	weapon1 = /obj/item/gun/projectile/revolver/mateba
	ranged = 1
	projectiletype = /obj/projectile/bullet
	projectilesound = 'sound/weapons/gunshot/gunshot1.ogg'
	casingtype = /obj/item/ammo_casing/a357
	smart_ranged = TRUE

/mob/living/simple_animal/hostile/russian/death()
	..()
	if(corpse)
		new corpse (src.loc)
	if(weapon1)
		new weapon1 (src.loc)
	qdel(src)
	return
