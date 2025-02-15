/obj/attack_hand(mob/living/user)
	. = ..()
	if(buckled)
		user_unbuckle(user)

/obj/mouse_drop_receive(atom/dropped, mob/user, params)
	. = ..()
	if(is_type_in_list(dropped, can_buckle))
		user_buckle(dropped, user)

/**
 * Buckles an `/atom/movable` to this obj, performed by a `/mob`
 *
 * Returns `TRUE` if the buckling was successful, `FALSE` otherwise
 *
 * * buckling_atom - The `/atom/movable` to buckle
 * * user - The `/mob` that performs the buclking action
 */
/obj/proc/buckle(atom/movable/buckling_atom, mob/user)

	if(!buckling_atom.can_be_buckled || buckling_atom.buckled_to)
		return FALSE

	if(!is_type_in_list(buckling_atom, can_buckle))
		return FALSE

	if(buckling_atom.loc != loc)
		step_towards(buckling_atom, src)

		if(buckling_atom.loc != loc)
			return FALSE

	if(buckling_atom != user && isliving(buckling_atom))
		var/mob/living/buckling_mob = buckling_atom

		//If the mob is not lying, check if there's an user that is performing the action, if there is add 3 seconds to perform the action,
		//otherwise just continue as do_mob requires an user and a target
		if(!buckling_mob.lying && !isnull(user) && !do_mob(user, buckling_mob, 3 SECONDS))
			return FALSE

	buckling_atom.buckled_to = src
	buckled = buckling_atom

	if(istype(buckling_atom, /mob/living))
		var/mob/living/buckling_mob = buckling_atom

		if(length(buckling_mob.pinned) || (buckle_require_restraints && !buckling_mob.restrained()))
			return FALSE

		buckling_mob.set_dir(buckle_dir ? buckle_dir : dir)
		buckling_mob.facing_dir = null
		buckling_mob.update_canmove()

	else
		buckling_atom.anchored = TRUE

	post_buckle(buckling_atom)
	buckled_original_layer = buckling_atom.layer
	buckling_atom.layer = layer + 0.1
	return TRUE

/obj/proc/unbuckle()
	var/atom/movable/MA = buckled
	if(MA && MA.buckled_to == src)
		. = MA
		MA.buckled_to = null
		if(buckled_original_layer)
			MA.layer = buckled_original_layer
			buckled_original_layer = null
		MA.anchored = initial(MA.anchored)
		buckled = null
		if(istype(MA, /mob/living))
			var/mob/living/M = MA
			M.update_canmove()
		post_buckle(.)

/obj/proc/post_buckle(atom/movable/MA)
	return

/obj/proc/user_buckle(atom/movable/MA, mob/user)
	if(!ROUND_IS_STARTED)
		to_chat(user, SPAN_WARNING("You can't buckle anything in before the game starts."))
	if(!user.Adjacent(MA) || user.restrained() || user.stat || istype(user, /mob/living/silicon/pai))
		return
	if(!MA.can_be_buckled)
		to_chat(user, SPAN_WARNING("\The [MA] can't be buckled_to!"))
		return
	if(MA == buckled)
		return
	if(istype(MA, /mob/living/carbon/slime))
		to_chat(user, SPAN_WARNING("\The [MA] is too squishy to buckle in."))
		return
	if(buckled)
		to_chat(user, SPAN_WARNING("\The [buckled.name] is already there, unbuckle [istype(buckled, /mob/living) ? "them" : "it"] first!."))
		return

	add_fingerprint(user)
	unbuckle()//this is now just for safety, buckling someone into an occupied chair will fail, instead of removing the occupant
	if(buckle_delay)
		if(MA == user)
			MA.visible_message(\
				"<b>[MA.name]</b> starts buckling themselves to [src].",\
				SPAN_NOTICE("You start buckling yourself to [src]."),\
				SPAN_NOTICE("You hear metal clanking."))
		else if(isliving(MA))
			MA.visible_message(\
				SPAN_DANGER("[MA.name] is starting to be buckled to [src] by [user.name]!"),\
				SPAN_DANGER("You are starting to be buckled to [src] by [user.name]!"),\
				SPAN_NOTICE("You hear metal clanking."))
		else
			MA.visible_message(\
				SPAN_DANGER("\The [MA] is starting to be buckled to [src] by [user.name]!"),\
				SPAN_NOTICE("You hear metal clanking."))

		if(!do_after(user, buckle_delay, src))
			return
	if(buckle(MA, user))
		if(MA == user)
			MA.visible_message(\
				"<b>[MA.name]</b> buckles themselves to [src].",\
				SPAN_NOTICE("You buckle yourself to [src]."),\
				SPAN_NOTICE("You hear metal clanking."))
		else if(isliving(MA))
			MA.visible_message(\
				SPAN_DANGER("[MA.name] is buckled to [src] by [user.name]!"),\
				SPAN_DANGER("You are buckled to [src] by [user.name]!"),\
				SPAN_NOTICE("You hear metal clanking."))
		else
			MA.visible_message(\
				SPAN_DANGER("\The [MA] is buckled to [src] by [user.name]!"),\
				SPAN_NOTICE("You hear metal clanking."))

/obj/proc/user_unbuckle(mob/user)
	var/atom/movable/MA = unbuckle()
	if(MA)
		if(MA == user)
			MA.visible_message(\
				"<b>[MA.name]</b> unbuckles themselves.",\
				SPAN_NOTICE("You unbuckle yourself from [src]."),\
				SPAN_NOTICE("You hear metal clanking."))
		else if(isliving(MA))
			MA.visible_message(\
				"<b>[user.name]</b> unbuckles [MA.name].", \
				SPAN_NOTICE("You were unbuckled from [src] by [user.name]."),\
				SPAN_NOTICE("You hear metal clanking."))
		else if(isliving(user) && isobj(MA))
			user.visible_message(\
				"<b>[user]</b> unbuckles \the [MA] from [src].",\
				SPAN_NOTICE("You unbuckle \the [MA] from [src]."),\
				SPAN_NOTICE("You hear metal clanking."))
		else
			MA.visible_message(\
				"<b>[MA.name]</b> unbuckles themselves.",\
				SPAN_NOTICE("You hear metal clanking."))
		add_fingerprint(user)
	return MA
