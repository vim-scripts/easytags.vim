if !exists('timer_enabled')
	let timer_enabled = 0
endif

if !exists('timer_verbose_level')
	let timer_verbose_level = 1
endif

function! xolox#timer#start()
	if g:timer_enabled || &verbose >= g:timer_verbose_level
		return reltime()
	endif
	return []
endfunction

function! xolox#timer#stop(start, message)
	let duration = reltimestr(reltime(a:start))
	let duration = substitute(duration, '^\s*\(.\{-}\)\s*$', '\1', '')
	let level = g:timer_enabled ? 0 : g:timer_verbose_level
	call xolox#message(level, a:message, duration)
endfunction
