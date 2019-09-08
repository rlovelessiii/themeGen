--[[
Ring Meters by londonali1010 (2009)
+ Original Work done by Londonali1010 
+ Modified version by Ujjwal Biswas
+ Modified for auto-generation by RLovelessIII
]]

settings_table = {{
    
	{{
        name='acpitemp',
        arg='',
        max=110,
        bg_colour=0x{color1.strip},
        bg_alpha=0.8,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=200, y=120,
        radius=97,
        thickness=4,
        start_angle=0,
        end_angle=240
    }},    
	{{
        name='cpu',
        arg='cpu1',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.8,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=200, y=120,
        radius=86,
        thickness=13,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='cpu',
        arg='cpu2',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.7,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=200, y=120,
        radius=71,
        thickness=12,
        start_angle=0,
        end_angle=240
    }},
{{
        name='cpu',
        arg='cpu3',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.6,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=200, y=120,
        radius=57,
        thickness=11,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='cpu',
        arg='cpu4',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.5,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=200, y=120,
        radius=44,
        thickness=10,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='memperc',
        arg='',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.8,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=340, y=234,
        radius=60,
        thickness=15,
        start_angle=180,
        end_angle=420
    }},
    {{
        name='swapperc',
        arg='',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.4,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=340, y=234,
        radius=45,
        thickness=10,
        start_angle=180,
        end_angle=420
    }},
    {{
        name='fs_used_perc',
        arg='/',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.8,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=220, y=280,
        radius=40,
        thickness=10,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='fs_used_perc',
        arg='/home',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.6,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=220, y=280,
        radius=28,
        thickness=10,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='fs_used_perc',
        arg='/boot',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.4,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=220, y=280,
        radius=16,
        thickness=10,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='downspeedf',
        arg='eth0','wlp1s0',
        max=12500,
        bg_colour=0x{color1.strip},
        bg_alpha=0.8,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=290, y=346,
        radius=30,
        thickness=12,
        start_angle=180,
        end_angle=420
    }},
    {{
        name='upspeedf',
        arg='eth0','wlp1s0',
        max=2500,
        bg_colour=0x{color1.strip},
        bg_alpha=0.6,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=290, y=346,
        radius=18,
        thickness=8,
        start_angle=180,
        end_angle=420
    }},
    {{
        name='time',
        arg='%S',
        max=60,
        bg_colour=0x{color1.strip},
        bg_alpha=0.8,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=430, y=97,
        radius=30,
        thickness=12,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='time',
        arg='%M',
        max=60,
        bg_colour=0x{color1.strip},
        bg_alpha=0.6,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=430, y=97,
        radius=18,
        thickness=8,
        start_angle=0,
        end_angle=240
    }},
    {{
        name='time',
        arg='%H',
        max=24,
        bg_colour=0x{color1.strip},
        bg_alpha=0.4,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=430, y=97,
        radius=10,
        thickness=4,
        start_angle=0,
        end_angle=240
    }},

    {{
        name='battery_percent',
        arg='BAT0',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.6,
        fg_colour=0x{color4.strip},
        fg_alpha=0.8,
        x=210, y=370,
        radius=18,
        thickness=10,
        start_angle=180,
        end_angle=420
    }},
    
    {{
        name='$',
        arg='',
        max=100,
        bg_colour=0x{color1.strip},
        bg_alpha=0.6,
        fg_colour=0x{color4.strip},
        fg_alpha=0.6,
        x=210, y=370,
        radius=3,
        thickness=13,
        start_angle=0,
        end_angle=360
    }},

}}

require 'cairo'

function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)

	local w,h=conky_window.width,conky_window.height
	
	local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
	local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

	local angle_0=sa*(2*math.pi/360)-math.pi/2
	local angle_f=ea*(2*math.pi/360)-math.pi/2
	local t_arc=t*(angle_f-angle_0)

	-- Draw background ring

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
	cairo_set_line_width(cr,ring_w)
	cairo_stroke(cr)
	
	-- Draw indicator ring

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
	cairo_stroke(cr)		
end

function conky_ring_stats()
	local function setup_rings(cr,pt)
		local str=''
		local value=0
		
		str=string.format('${{%s %s}}',pt['name'],pt['arg'])
		str=conky_parse(str)
		
		value=tonumber(str)
		if value == nil then value = 0 end
		pct=value/pt['max']
		
		draw_ring(cr,pct,pt)
	end

	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
	
	local cr=cairo_create(cs)	
	
	local updates=conky_parse('${{updates}}')
	update_num=tonumber(updates)

	if update_num>5 then
	    for i in pairs(settings_table) do
		setup_rings(cr,settings_table[i])
	    end
	end
   cairo_surface_destroy(cs)
  cairo_destroy(cr)
end
