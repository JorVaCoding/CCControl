os.loadAPI("/apis/json")

if not fs.exists("/os/os.json") then
    printError("OS list not found.")
    return
end

local ostable = json.decodeFromFile("/os/os.json")

local function centerText(text)
    local x,y = term.getSize()
    local x2,y2 = term.getCursorPos()
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
    print(text)
end

local function clear()
    term.clear()
    term.setCursorPos(1,1)
    centerText("--------------------")
    centerText("Please select an OS.")
    centerText("--------------------")
end

local function run(dir, boot)
    term.clear()
    term.setCursorPos(1,1)
    shell.run("/os/"..dir.."/"..boot)
end

local bootList = {}

local function list()
    bootList = {}
    i = 1
    for k,option in pairs(ostable) do
        term.setCursorPos(1,i+3)
        centerText("- "..option.displayName.." -")
        bootList[k] = i
        i = i + 1
    end
end

clear()
list()

local booted = false
while not booted do
    local e, b, x, y = os.pullEvent("mouse_click")
    local tX, tY = term.getCursorPos()
    for k,option in pairs(ostable) do
        if y == bootList[k]+3 then
            booted = true
            run(option.dir, option.bootFile)
        end
    end
end
-- printError("Shutting down!")
-- os.sleep(1)
-- os.shutdown()

