
local function centerText(text)
    local x,y = term.getSize()
    local x2,y2 = term.getCursorPos()
    term.setCursorPos(math.ceil((x / 2) - (text:len() / 2)), y2)
    print(text)
end

local function clear()
    term.clear()
    term.setCursorPos(1,1)
    centerText("------------------------")
    centerText("Please select an option.")
    centerText("------------------------")
end

local function install()
    term.clear()
    term.setCursorPos(1,1)
    shell.run("/disk/setup")
end

local function exit()
    term.clear()
    term.setCursorPos(1,1)
end

local data = {
    { 
        name = "Install",
        func = install,
    },

    {
        name = "Exit",
        func = exit
    },

    {

        name = "Shutdown",
        func = os.shutdown
    }
}

local function list()
    for k,option in pairs(data) do
        centerText("- "..option.name.." -")
    end
end

clear()
list()

local e, b, x, y = os.pullEvent("mouse_click")
local tX, tY = term.getCursorPos()
for i,option in pairs(data) do
    pos = i+tY-#data-1
    if y == pos then
        option.func()
    end
end