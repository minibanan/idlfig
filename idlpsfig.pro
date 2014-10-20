PRO IDLPSFIG, filename=filename, close=close, xsize=xsize, ysize=ysize, xdata=xdata, ydata=ydata, psym=psym, xr=xr, yr=yr, $
	title=title, xtitle=xtitle, ytitle=ytitle, titsize=titsize, xtitsize=xtitsize, ytitsize=ytitsize, position=position
	
	if keyword_set(close) then begin
		device,/close
		set_plot,'x'
	endif else begin
		if not keyword_set(filename) then filename='idl.ps'
		if not keyword_set(xsize) then xsize=10
		if not keyword_set(ysize) then ysize=10
		set_plot,'ps'
		device,filename=filename,xsize=xsize,ysize=ysize
		if keyword_set(xdata) and keyword_set(ydata) then begin
			if not keyword_set(psym) then psym=0
			if not keyword_set(position) then position=[0.1,0.1,0.9,0.9]
			if not keyword_set(title) then title=''
			if not keyword_set(xtitle) then xtitle=''
			if not keyword_set(ytitle) then ytitle=''
			if not keyword_set(titsize) then titsize=2.0
			if not keyword_set(xtitsize) then xtitsize=0.5
			if not keyword_set(ytitsize) then ytitsize=1.0
			if not keyword_set(xr) then begin
				xr = minmax(xdata,/nan)
				xrange = xr[1] - xr[0]
				xr[0] = xr[0]-0.05*xrange
				xr[1] = xr[1]+0.05*xrange
			endif
			if not keyword_set(yr) then begin
				yr = minmax(ydata,/nan)
				yrange = yr[1] - yr[0]
				yr[0] = yr[0]-0.05*yrange
				yr[1] = yr[1]+0.05*yrange
			endif
			plot,xdata,ydata,psym=psym,xr=xr,yr=yr,/xs,/ys,title=title,xtitle=xtitle,ytitle=ytitle,charsize=titsize,xcharsize=xtitsize,ycharsize=ytitsize,position=position,/norm
		endif
	endelse

END
