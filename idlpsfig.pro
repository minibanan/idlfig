PRO IDLPSFIG, filename=filename, close=close, xsize=xsize, ysize=ysize, xdata=xdata, ydata=ydata, nodata=nodata, linestyle=linestyle, thick=thick, psym=psym, symsize=symsize, xr=xr, yr=yr, $
	title=title, xtitle=xtitle, ytitle=ytitle, titsize=titsize, xtitsize=xtitsize, ytitsize=ytitsize, charthick=charthick, xthick=xthick, ythick=ythick, plotcol=plotcol, position=position
	
	; Use generic filename if not supplied
	if not keyword_set(filename) then filename='idl.ps'
	
	if keyword_set(close) then begin
		device,/close
		;FixPS,filename		; This line is what fucks up the plots! Write own routine based on fixps.pro from Coyote!
		set_plot,'x'
	endif else begin
		
		; Setup PS file
		if not keyword_set(xsize) then xsize=20
		if not keyword_set(ysize) then ysize=15
		set_plot,'ps'
		device,filename=filename,xsize=xsize,ysize=ysize,/color
		
		; Plot data if input
		if keyword_set(xdata) and keyword_set(ydata) then begin
			
			; Control plotting symbols appearance
			if not keyword_set(linestyle) then linestyle=0
			if not keyword_set(psym) then psym=0
			if not keyword_set(symsize) then symsize=1.5
			if not keyword_set(thick) then thick=5
			if not keyword_set(plotcol) then plotcol='Black'
			
			; Control plot position and axes
			if not keyword_set(position) then begin
				position=[0.09,0.1,0.95,0.92]
			  if not keyword_set(title) then position=[0.09,0.1,0.95,0.99] 			
			endif
			if not keyword_set(xthick) then xthick=4.0
			if not keyword_set(ythick) then ythick=4.0
			
			; Control plot and axis titles
			if not keyword_set(title) then title=''
			if not keyword_set(xtitle) then xtitle=''
			if not keyword_set(ytitle) then ytitle=''
			if not keyword_set(titsize) then titsize=2.0
			if not keyword_set(xtitsize) then xtitsize=0.7
			if not keyword_set(ytitsize) then ytitsize=0.7
			if not keyword_set(charthick) then charthick=4
			
			; Control axis ranges
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

			; Do the actual plot of data
			plot,xdata,ydata,xr=xr,yr=yr,/xs,/ys,title=title,xtitle=xtitle,ytitle=ytitle,charsize=titsize,xcharsize=xtitsize,ycharsize=ytitsize,charthick=charthick,xthick=xthick,ythick=ythick,position=position,/norm,/nodata
			if not keyword_set(nodata) then oplot,xdata,ydata,linestyle=linestyle,thick=thick,psym=psym,symsize=symsize,color=cgColor(plotcol)
			
		endif
		
	endelse

END
