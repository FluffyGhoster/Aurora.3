/mob/abstract/ghost/observer/LateLogin()
	..()
	if (ghostimage)
		ghostimage.icon_state = src.icon_state
	updateghostimages()
