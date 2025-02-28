local e = require(game.ReplicatedStorage.Common.Enoria.packages.Enoria.Enoria)
local Widget = require(game.ReplicatedStorage.Common.Enoria.packages.Enoria.Enoria)

local Counter = {}
Counter.__index = Counter
setmetatable(Counter, Widget)

function Counter.new(context, increment)
	local self = Widget.new(nil, nil, context)
	setmetatable(self, Counter)
	
	self.CurrentNumber = 0
	self.Increment = increment or 1
	
	return self
end

function Counter:Build()
	
	local tree = self:BuildTree(
		e.TextButton(tostring(self.CurrentNumber), {
			Name = self.Increment,
			OnClick = function()
				self:SetState(function()
					self.CurrentNumber = self.CurrentNumber + self.Increment
				end)
			end,
		})
	)
	
	return tree
end

return Counter
