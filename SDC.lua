local sdc = {}

local Nums = {
	[0] = {1,2,3,4,5,6},
	{2,3}, -- 1
	{1,2,4,5,7}, -- 2
	{1,2,3,4,7}, -- 3
	{2,3,6,7}, -- 4
	{1,3,4,6,7}, -- 5
	{1,3,4,5,6,7}, -- 6
	{1,2,3}, -- 7
	{1,2,3,4,5,6,7}, -- 8
	{1,2,3,4,6,7}, -- 9
}

local Chars = {
	["a"] = {1,2,3,5,6,7},
	["A"] = {1,2,3,5,6,7},
	["b"] = {3,4,5,6,7},
	["B"] = {3,4,5,6,7}, --{1,2,3,4,5,6,7},
	["c"] = {4,5,7},
	["C"] = {1,4,5,6},
	["d"] = {2,3,4,5,7},
	["D"] = {2,3,4,5,7},
	["e"] = {1,2,4,5,6,7},
	["E"] = {1,4,5,6,7},
	["f"] = {1,5,6,7},
	["F"] = {1,5,6,7},
	["g"] = {1,2,3,4,6,7},
	["G"] = {1,3,4,5,6},
	["h"] = {3,5,6,7},
	["H"] = {2,3,5,6,7},
	["i"] = {1,3},
	["I"] = {2,3},
	["j"] = {1,3,4},
	["J"] = {1,3,4},
	["l"] = {4,5,6},
	["L"] = {4,5,6},
	["n"] = {3,5,7},
	["N"] = {1,2,3,5,6},
	["o"] = {3,4,5,7},
	["O"] = {1,2,3,4,5,6},
	["p"] = {1,2,5,6,7},
	["P"] = {1,2,5,6,7},
	["q"] = {1,2,3,6,7},
	["Q"] = {1,2,3,6,7},
	["r"] = {5,7},
	["R"] = {5,7},
	["s"] = {1,3,4,6,7},
	["S"] = {1,3,4,6,7},
	["t"] = {4,5,6,7},
	["T"] = {4,5,6,7},
	["u"] = {3,4,5},
	["U"] = {2,3,4,5,6},
	["y"] = {2,3,6,7},
	["Y"] = {2,3,6,7},
}

function sdc.write(display, num : string, start : number)
	local counter = 0
	local group = start or 1
	local length = #num
	while counter < length do
		if group > #display.States then
			break
		end
		counter = counter + 1
		local char = num:sub(counter, counter)
		local nchar = num:sub(counter+1, counter+1)
		if char == "." or char == "," then
			display.States[group-1][8] = true
			continue
		end
		
		if tonumber(char) then
			local t = Nums[tonumber(char)]
			for i=1, #t do
				display.States[group][t[i]] = true
			end
		else
			local t = Chars[char] or Nums[0]
			for i=1, #t do
				display.States[group][t[i]] = true
			end
		end
		group = group + 1
	end
end

function sdc.clear(display)
	for i=1, 4 do
		local n = display.States[i]
		for j=1, #n do
			n[j] = false	
		end
	end
end

function sdc.color(display, color, group, index)
	if group == -1 then
		for i=1, #display.States do
			if index == -1 then
					for j=1, 8 do display.Colors[i][j] = color end
			else
					display.Colors[i][index] = color
			end
		end
	else
		if index == -1 then
					for j=1, 8 do display.Colors[group][j] = color end
			else
					display.Colors[group][index] = color
			end
	end
end

return sdc
