--// ChatCmdLib Exploit
local p=game.Players.LocalPlayer
local commands={}

local function AddChatCommand(d)
    if not d.Name or not d.Func then return end
    commands[d.Name:lower()]=d
end

local function run(msg)
    if msg:sub(1,1)~="/"then return end
    local cmd,arg=msg:match("^/(%S+)%s*(.*)$")
    if not cmd then return end
    local d=commands[cmd:lower()]
    if d then task.spawn(d.Func,arg)end
end

local tcs=game:GetService("TextChatService")
if tcs.ChatVersion==Enum.ChatVersion.TextChatService then
    tcs.MessageReceived:Connect(function(m)
        if m.Status==Enum.TextChatMessageStatus.Success and m.TextSource and m.TextSource.UserId==p.UserId then
            run(m.Text)
        end
    end)
else
    p.Chatted:Connect(run)
end

-- Default Commands
AddChatCommand({Name="print",Desc="Cetak teks",Func=function(a)print(a)end})
AddChatCommand({Name="notify",Desc="Notif teks",Func=function(a)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="Cmd",Text=a,Duration=3})end)end})
AddChatCommand({Name="speed",Desc="Ubah WalkSpeed",Func=function(a)local n=tonumber(a)if not n then return end local ch=p.Character or p.CharacterAdded:Wait()local h=ch:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=n end end})

return {
    AddChatCommand=AddChatCommand,
    Commands=commands
}
