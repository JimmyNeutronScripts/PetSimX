local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mybanks = lib.Network.Invoke("get my banks")
local Bank = mybanks[1]
local mybank = lib.Network.Invoke("get bank", Bank.BUID)

while wait(1) do
	lib.Network.Invoke("cancel bank outgoing invites")
	for key, value in pairs(mybank) do
		if(key == "Players") then
			for k, v in pairs(value) do
				-- kick all v values
				lib.Network.Invoke("kick from bank", Bank.BUID, v)
				wait(0.1)
			end
		end
	end
end