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
	requires_power = FALSE

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

/area/containment_facility/arrivals_scrub
	name = "Containment Facility Arrival Scrub"

/area/containment_facility/access_checkpoint
	name = "Containment Facility Access Checkpoint"

/area/containment_facility/common_area
	name = "Containment Facility Common Area"