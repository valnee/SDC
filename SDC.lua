local sdc = {}

local LookTable = {
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

function sdc.write(display, num : string, start : number)
	local counter = 0
	local group = start or 1
	local length = #num
	while counter < length do
		counter = counter + 1
		local char = num:sub(counter, counter)
		
		if char == "." or char == "," then
			display.States[group-1][8] = true
			continue
		end
		
		local t = LookTable[tonumber(char)]
		for i=1, #t do
			display.States[group][t[i]] = true
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

return sdc
