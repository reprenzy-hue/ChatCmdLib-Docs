# ChatCmdLib

A lightweight Roblox **Chat Command Library** for exploit scripts, designed for easy command registration and full compatibility with both **TextChatService** (new chat system) and **Legacy Chat**.

---

## ✅ Features
- Prefix-based commands (default: `/`)
- Simple API: `AddChatCommand({Name, Desc, Func})`
- Automatically detects and hooks into the active chat system
- Ready for loadstring usage
- Default commands included: `print`, `notify`, `speed`

---

## 📥 Installation
\`\`\`lua
local cmd = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_REPO/ChatCmdLib/main.lua"))()
\`\`\`

---

## 🛠 API Usage
### ➤ Add a Command
\`\`\`lua
cmd.AddChatCommand({
    Name = "speed",
    Desc = "Change walkspeed",
    Func = function(arg)
        local n = tonumber(arg)
        if n then
            local c = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = n end
        end
    end
})
\`\`\`

### ➤ Command Table Structure
\`\`\`
Name : string   -- Command name
Desc : string   -- Description
Func : function -- Executes when the command is called
\`\`\`

Example in chat:
\`\`\`
/speed 100
\`\`\`

---

## ✅ Default Commands
\`\`\`
/print text   → Prints text to output
/notify text  → Shows Roblox notification
/speed number → Changes WalkSpeed
\`\`\`

---

## ✅ Future Additions
\`\`\`
- Custom prefixes
- Aliases for commands
- Built-in help command
- Optional UI for listing commands
\`\`\`

---

## ℹ️ Creator
- Writed by luauruler26
