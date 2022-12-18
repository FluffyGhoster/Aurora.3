/datum/map_template/ruin/away_site/containment_facility
	name = "Containment Facility"
	description = "A containment facility."
	suffix = "away_site/containment_facility/containment_facility.dmm"
	sectors = list(SECTOR_ROMANOVICH)
	spawn_weight = 1
	spawn_cost = 2
	id = "containment_facility"
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/area/containment_facility
	name = "Containment Facility"
	requires_power = TRUE

/area/containment_facility/arrivals
	name = "Containment Facility Arrivals"

/area/containment_facility/subjects_lab
	name = "Containment Facility Subjects Laboratories"

/area/containment_facility/subjects_lab_decontamination
	name = "Containment Facility Subjects Laboratories Decontamination"

/area/containment_facility/selfdestruct
	name = "Containment Facility Self Destruction"

/area/containment_facility/engineering
	name = "Containment Facility Engineering"
	requires_power = TRUE

/area/containment_facility/arrivals_scrub
	name = "Containment Facility Arrival Scrub"

/area/containment_facility/access_checkpoint
	name = "Containment Facility Access Checkpoint"

/area/containment_facility/common_area
	name = "Containment Facility Common Area"

/turf/simulated/wall/titanium_reinforced/containment/Initialize(mapload)
	. = ..(mapload, MATERIAL_ELEVATOR, MATERIAL_ELEVATOR)

/obj/effect/landmark/corpse/containment_facility/containment_security
	corpseuniform = /obj/item/clothing/under/rank/security
	corpsemask = /obj/item/clothing/mask/gas/tactical
	corpsegloves = /obj/item/clothing/gloves/swat/tactical
	corpsehelmet = /obj/item/clothing/head/helmet/tactical
	corpsesuit = /obj/item/clothing/suit/armor/tactical
	corpseshoes = /obj/item/clothing/shoes/swat
	corpseradio = /obj/item/device/radio/headset
	corpseidjob = "Containment Unit"
	corpseid = 1

/obj/effect/landmark/corpse/containment_facility/research_doctor
	name = "Doctor"
	corpseradio = /obj/item/device/radio/headset/headset_sci
	corpseuniform = /obj/item/clothing/under/rank/scientist
	corpsesuit = /obj/item/clothing/suit/storage/toggle/labcoat
	corpseback = /obj/item/storage/backpack/medic
	corpseshoes = /obj/item/clothing/shoes/science
	corpseid = 0
	corpseidjob = "Research Doctor"

/obj/effect/landmark/corpse/containment_facility/containment_security_commander
	corpseuniform = /obj/item/clothing/under/rank/head_of_security
	corpsemask = /obj/item/clothing/mask/gas/tactical
	corpsegloves = /obj/item/clothing/gloves/swat/tactical
	corpsehelmet = /obj/item/clothing/head/helmet/tactical
	corpsesuit = /obj/item/clothing/suit/armor/carrier/hos
	corpseshoes = /obj/item/clothing/shoes/swat
	corpseradio = /obj/item/device/radio/headset
	corpseidjob = "Containment Unit Commander"
	corpseid = 0

/var/const/access_containment_security = 301
/datum/access/access_containment_security
	id = access_containment_security
	access_type = ACCESS_TYPE_CENTCOM

/obj/machinery/button/remote/blast_door/containment_facility
	name = "Containment Facility Blast door"


/obj/machinery/button/remote/blast_door/containment_facility/attack_hand(mob/user as mob)
	playsound(src, 'sound/ambience/firealarm.ogg', 95, 0)
	src.visible_message(SPAN_DANGER(FONT_LARGE("Attention! Laboratories access cycling procedure initiated!")))
	sleep(19*10)	//Sleep while the sound plays before continuing, as I found no direct way to await the playback completion before resuming
	. = ..()