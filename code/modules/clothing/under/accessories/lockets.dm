/obj/item/clothing/accessory/locket
	name = "silver locket"
	desc = "A silver locket that seems to have space for a photo within."
	icon_state = "locket"
	item_state = "locket"
	slot_flags = SLOT_MASK | SLOT_TIE
	w_class = WEIGHT_CLASS_SMALL
	var/open
	var/obj/item/held //Item inside locket.

	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'

/obj/item/clothing/accessory/locket/get_mask_examine_text(mob/user)
	return "around [user.get_pronoun("his")] neck"

/obj/item/clothing/accessory/locket/attack_self(mob/user as mob)
	if(!base_icon)
		base_icon = icon_state

	if(!("[base_icon]_open" in icon_states(icon)))
		to_chat(user, "\The [src] doesn't seem to open.")
		return

	open = !open
	to_chat(user, "You flip \the [src] [open?"open":"closed"].")
	if(open)
		icon_state = "[base_icon]_open"
		if(held)
			to_chat(user, "\The [held] falls out!")
			held.forceMove(get_turf(user))
			src.held = null
	else
		icon_state = "[base_icon]"

/obj/item/clothing/accessory/locket/attackby(obj/item/attacking_item, mob/user)
	if(!open)
		to_chat(user, "You have to open it first.")
		return

	if(istype(attacking_item,/obj/item/paper) || istype(attacking_item, /obj/item/photo))
		if(held)
			to_chat(usr, "\The [src] already has something inside it.")
		else
			to_chat(usr, "You slip [attacking_item] into [src].")
			user.drop_from_inventory(attacking_item, src)
			src.held = attacking_item
		return
	..()
