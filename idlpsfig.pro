PRO IDLPSFIG, filename=filename, close=close, xtitle=
	
	if keyword_set(close) then begin
		device,/close
		set_plot,'x'
	endif else begin
		if not keyword_set(filename) then filename='idl.ps'
		set_plot,'ps'
		device,filename=filename
	endelse

END
