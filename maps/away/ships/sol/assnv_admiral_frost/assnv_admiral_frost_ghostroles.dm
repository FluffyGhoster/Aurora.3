/*#######################
	NAVY CREW SECTION
#######################*/

/*============
	CREWMAN
============*/
/datum/ghostspawner/human/assnv_admiral_frost_crewman
	short_name = "assnv_admiral_frost_crewman"
	name = "ASSNV Admiral Frost Navy Crewman"
	desc = "Crew the ASSNV Admiral Frost Heavy Battle Cruiser. Follow the orders of the Admiralty, ask how you can best serve the Alliance."
	tags = list("External")
	mob_name_prefix = "PO3. "

	spawnpoints = list("assnv_admiral_frost_crewman")
	max_count = 20

	outfit = /obj/outfit/admin/assnv_admiral_frost_crewman
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "ASSNV Admiral Frost Navy Crewman"
	special_role = "ASSNV Admiral Frost Navy Crewman"
	respawn_flag = null

	culture_restriction = list(/singleton/origin_item/culture/solarian)

/obj/outfit/admin/assnv_admiral_frost_crewman
	name = "ASSNV Admiral Frost Navy Crewman"

	uniform = /obj/item/clothing/under/rank/sol/
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/utility/full
	head = /obj/item/clothing/head/sol
	accessory = /obj/item/clothing/accessory/storage/brown_vest

	id = /obj/item/card/id/fsf_ship

	l_ear = /obj/item/device/radio/headset/ship

	backpack_contents = list(/obj/item/storage/box/survival = 1, /obj/item/melee/energy/sword/knife/sol = 1)

/obj/outfit/admin/assnv_admiral_frost_crewman/get_id_access()
	return list(ACCESS_SOL_SHIPS, ACCESS_EXTERNAL_AIRLOCKS)


/*========================
	SUBOFFICER CREWMAN
========================*/
/datum/ghostspawner/human/assnv_admiral_frost_crewman/subofficer
	short_name = "assnv_admiral_frost_crewman_subofficer"
	name = "ASSNV Admiral Frost Navy Crewman Subofficer"
	desc = "Serve Sol as one of untold billions of subofficers, order the grunts around believing you're better than them, get told what to make them do by those who actually are."
	mob_name_prefix = "PO1. "

	spawnpoints = list("assnv_admiral_frost_crewman_subofficer")
	max_count = 3

	assigned_role = "ASSNV Admiral Frost Navy Crewman Subofficer"
	special_role = "ASSNV Admiral Frost Navy Crewman Subofficer"

	culture_restriction = list(/singleton/origin_item/culture/solarian)


/*========================
	OFFICER CREWMAN
========================*/
/datum/ghostspawner/human/assnv_admiral_frost_crewman/officer
	short_name = "assnv_admiral_frost_crewman_officer"
	name = "ASSNV Admiral Frost Navy Crewman Officer"
	desc = "Serve Sol as one of untold millions of Officers. Be a glorified AI assistant for whoever gets to give orders."
	mob_name_prefix = "PO1. "

	spawnpoints = list("assnv_admiral_frost_crewman_officer")
	max_count = 3

	assigned_role = "ASSNV Admiral Frost Navy Crewman Officer"
	special_role = "ASSNV Admiral Frost Navy Crewman Officer"

	culture_restriction = list(/singleton/origin_item/culture/solarian)


/*========================
	ADMIRAL CREWMAN
========================*/
/datum/ghostspawner/human/assnv_admiral_frost_crewman/officer
	short_name = "assnv_admiral_frost_crewman_admiral"
	name = "ASSNV Admiral Frost Navy Crewman Admiral"
	desc = "Only two things are unquestionable: Cogito ergo sum, and your loyalty to Sol. Some have doubts on the former. Command the ASSNV Admiral Frost Heavy Battle Cruiser. \
			Fullfill your duties as an Admiral, serve Sol's best interests, awaiting for the next invasion order to come."
	mob_name_prefix = "PO1. "

	spawnpoints = list("assnv_admiral_frost_crewman_admiral")
	max_count = 3

	assigned_role = "ASSNV Admiral Frost Navy Crewman Officer"
	special_role = "ASSNV Admiral Frost Navy Crewman Officer"

	culture_restriction = list(/singleton/origin_item/culture/solarian)


/*#######################
	ARMY CREW SECTION
#######################*/

/datum/ghostspawner/human/assnv_admiral_frost_army_soldier
	short_name = "assnv_admiral_frost_army_soldier"
	name = "ASSNV Admiral Frost Army Soldier"
	desc = "Staff the troop quarters that station the ASSNV Admiral Frost. Wait for your orders on where to go to die, keep polishing that rifle in the meantime."
	tags = list("External")
	mob_name_prefix = "LT. "

	spawnpoints = list("assnv_admiral_frost_army_soldier")
	max_count = 8

	outfit = /obj/outfit/admin/assnv_admiral_frost_army_soldier
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "ASSNV Admiral Frost Army Soldier"
	special_role = "ASSNV Admiral Frost Army Soldier"
	respawn_flag = null

	culture_restriction = list(/singleton/origin_item/culture/solarian)

/obj/outfit/admin/assnv_admiral_frost_army_soldier
	name = "ASSNV Admiral Frost Army Soldier"

	uniform = /obj/item/clothing/under/rank/sol/dress/subofficer
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel/leather
	head = /obj/item/clothing/head/sol/dress
	accessory = /obj/item/clothing/accessory/holster/thigh

	id = /obj/item/card/id/fsf_ship

	l_ear = /obj/item/device/radio/headset/ship

	backpack_contents = list(/obj/item/storage/box/survival = 1, /obj/item/melee/energy/sword/knife/sol = 1)


//items

/obj/item/card/id/fsf_ship
	name = "fsf patrol ship id"
	access = list(ACCESS_SOL_SHIPS, ACCESS_EXTERNAL_AIRLOCKS)
