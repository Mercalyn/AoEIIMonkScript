SetBatchLines, -1 

; unitx/y is the x/y dir of monk group select
; number after is the number group, so need to select monks by number
unitx2 := 353
unity2 := 951
unitx3 := 353
unity3 := 951
activeGroup := 1

loop {
	; get monk group
	if(GetKeyState("2", "P")){
		activeGroup := 2
	}
	if(GetKeyState("3", "P")){
		activeGroup := 3
	}

	; this one is getkeystate because that detects keydown
	if(GetKeyState("lalt", "P")){
		
		; monk mode, immediately go to monk listed
		; get current pos so can go back to there after
		mousegetpos, x, y
		send %activeGroup%
		
		
		; go to unit dir click
		if(activeGroup == 2){
			mouseclick, left, %unitx2%, %unity2%
		}
		if(activeGroup == 3){
			mouseclick, left, %unitx3%, %unity3%
		}
		mousemove, %x%, %y%	
		
		; perform pixel search for the white formation box
		PixelSearch, Px, Py, 174, 1032, 178, 1038, 0x000000, 5, Fast
		if ErrorLevel{
			; not found, which means it selected
		}
		else{
			; found, which means still on formation group, so reset both
			if(activeGroup == 2){
				unitx2 := 312
				unity2 := 951
			}
			if(activeGroup == 3){
				unitx3 := 312
				unity3 := 951
			}
			
		}
		
		; check which group so assigns right coords
		if(activeGroup == 2){
			; set or reset unit x
			if (unitx2 > 1490){
				unitx2 := 353
				unity2 := (unity2 + 41)
			}
			else{
				unitx2 := (unitx2 + 41)
			}
			; reset y if higher than row 3
			if (unity2 > 1034){
				unity2 := 951
			}
		}
		if(activeGroup == 3){
			; set or reset unit x
			if (unitx3 > 1490){
				unitx3 := 353
				unity3 := (unity3 + 41)
			}
			else{
				unitx3 := (unitx3 + 41)
			}
			; reset y if higher than row 3
			if (unity3 > 1034){
				unity3 := 951
			}
		}
		
		
	}
	
	sleep, 20
}

Numpad3::
mousegetpos, mx, my
msgbox %mx% %my%


NumpadMult::exitapp
