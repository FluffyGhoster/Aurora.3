// PRESETS
GLOBAL_LIST_INIT(engineering_networks, list(
	NETWORK_REACTOR,
	NETWORK_ENGINEERING,
	NETWORK_ENGINEERING_OUTPOST,
	"Atmosphere Alarms",
	"Fire Alarms",
	"Power Alarms"
))

/obj/machinery/camera/network/crescent
	network = list(NETWORK_CRESCENT)

/obj/machinery/camera/network/civilian_east
	network = list(NETWORK_CIVILIAN_EAST)

/obj/machinery/camera/network/civilian_west
	network = list(NETWORK_CIVILIAN_WEST)

/obj/machinery/camera/network/civilian_main
	network = list(NETWORK_CIVILIAN_MAIN)

/obj/machinery/camera/network/civilian_surface
	network = list(NETWORK_CIVILIAN_SURFACE)

/obj/machinery/camera/network/supply
	network = list(NETWORK_SUPPLY)

/obj/machinery/camera/network/service
	network = list(NETWORK_SERVICE)

/obj/machinery/camera/network/command
	network = list(NETWORK_COMMAND)

/obj/machinery/camera/network/reactor
	network = list(NETWORK_REACTOR)

/obj/machinery/camera/network/engineering
	network = list(NETWORK_ENGINEERING)

/obj/machinery/camera/network/engineering_outpost
	network = list(NETWORK_ENGINEERING_OUTPOST)

/obj/machinery/camera/network/ert
	network = list(NETWORK_ERT)

/obj/machinery/camera/network/mercenary
	network = list(NETWORK_MERCENARY)

/obj/machinery/camera/network/tcfl
	network = list(NETWORK_TCFL)

/obj/machinery/camera/network/station
	network = list(NETWORK_STATION)

/obj/machinery/camera/network/mining
	network = list(NETWORK_MINE)

/obj/machinery/camera/network/prison
	network = list(NETWORK_PRISON)

/obj/machinery/camera/network/medbay
	network = list(NETWORK_MEDICAL)

/obj/machinery/camera/network/research
	network = list(NETWORK_RESEARCH)

/obj/machinery/camera/network/research_outpost
	network = list(NETWORK_RESEARCH_OUTPOST)

/obj/machinery/camera/network/security
	network = list(NETWORK_SECURITY)

/obj/machinery/camera/network/telecom
	network = list(NETWORK_TELECOM)

/obj/machinery/camera/network/thunder
	network = list(NETWORK_THUNDER)

/obj/machinery/camera/network/news
	network = list(NETWORK_NEWS)

// EMP

/obj/machinery/camera/emp_proof/Initialize()
	. = ..()
	upgradeEmpProof()

// X-RAY

/obj/machinery/camera/xray
	icon_state = "xraycam" // Thanks to Krutchen for the icons.

/obj/machinery/camera/xray/security
	network = list(NETWORK_SECURITY)

/obj/machinery/camera/xray/medbay
	network = list(NETWORK_MEDICAL)

/obj/machinery/camera/xray/research
	network = list(NETWORK_RESEARCH)

/obj/machinery/camera/xray/Initialize()
	. = ..()
	upgradeXRay()

// MOTION

/obj/machinery/camera/motion/Initialize()
	. = ..()
	upgradeMotion()

/obj/machinery/camera/motion/engineering_outpost
	network = list(NETWORK_ENGINEERING_OUTPOST)

/obj/machinery/camera/motion/security
	network = list(NETWORK_SECURITY)

// ALL UPGRADES


/obj/machinery/camera/all/command
	network = list(NETWORK_COMMAND)

/obj/machinery/camera/all/Initialize()
	. = ..()
	upgradeEmpProof()
	upgradeXRay()
	upgradeMotion()

//space ship cameras

/obj/machinery/camera/network/first_deck
	network = list(NETWORK_FIRST_DECK)

/obj/machinery/camera/network/second_deck
	network = list(NETWORK_SECOND_DECK)

/obj/machinery/camera/network/third_deck
	network = list(NETWORK_THIRD_DECK)

/obj/machinery/camera/network/intrepid
	network = list(NETWORK_INTREPID)

/obj/machinery/camera/network/canary
	network = list(NETWORK_CANARY)

/obj/machinery/camera/network/quark
	network = list(NETWORK_QUARK)

// AUTONAME
/obj/machinery/camera/autoname
	var/number = 0 //camera number in area

//This camera type automatically sets it's name to whatever the area that it's in is called.
/obj/machinery/camera/autoname/Initialize()
	. = ..()
	number = 1
	var/area/A = get_area(src)
	if(A)
		for(var/obj/machinery/camera/autoname/C in SSmachinery.all_cameras)
			if(C == src) continue
			var/area/CA = get_area(C)
			if(CA.type == A.type)
				if(C.number)
					number = max(number, C.number+1)
		c_tag = "[A.name] #[number]"
	invalidateCameraCache()


// CHECKS

/obj/machinery/camera/proc/isEmpProof()
	var/O = locate(/obj/item/stack/material/osmium) in assembly.upgrades
	return O

/obj/machinery/camera/proc/isXRay()
	var/obj/item/stock_parts/scanning_module/O = locate(/obj/item/stock_parts/scanning_module) in assembly.upgrades
	if (O && O.rating >= 2)
		return O
	return null

/obj/machinery/camera/proc/isMotion()
	var/O = locate(/obj/item/device/assembly/prox_sensor) in assembly.upgrades
	return O

// UPGRADE PROCS

/obj/machinery/camera/proc/upgradeEmpProof()
	assembly.upgrades.Add(new /obj/item/stack/material/osmium(assembly))
	setPowerUsage()
	update_coverage()

/obj/machinery/camera/proc/upgradeXRay()
	assembly.upgrades.Add(new /obj/item/stock_parts/scanning_module/adv(assembly))
	setPowerUsage()
	update_coverage()

/obj/machinery/camera/proc/upgradeMotion()
	assembly.upgrades.Add(new /obj/item/device/assembly/prox_sensor(assembly))
	setPowerUsage()
	if(!(SSmachinery.processing[src]))
		START_PROCESSING_MACHINE(src, MACHINERY_PROCESS_SELF)
	update_coverage()

/obj/machinery/camera/proc/setPowerUsage()
	var/mult = 1
	if (isXRay())
		mult++
	if (isMotion())
		mult++
	change_power_consumption(mult*initial(active_power_usage), POWER_USE_ACTIVE)
