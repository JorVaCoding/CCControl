if not http then
    printError("Git requires http API")
    printError("Set http_enable to true in ComputerCraft.cfg")
    return
end

local function uE(string)
    return textutils.urlEncode(string)
end

function get(user, repo, branch, file)
    url = "https://raw.githubusercontent.com/"..user.."/"..repo.."/"..branch.."/"..file
    write("Connecting to github... ")
    local response = http.get(url)
    if response then
        print("Success.")
        local sResponse = response.readAll()
        response.close()
        if sResponse ~= "404: Not Found" then
            return sResponse
        else
            printError("File not found!");
        end
    else
        printError( "Failed." )
    end
end



function save(user, repo, branch, file, localfile, override)
    sPath = fs.combine( "", localfile )
    if fs.exists( sPath )then
        write( "File already exists" )
        if override then
            print("... Overriding.")
        else
            print(".")
        end
    end

    local res = get(user, repo, branch, file)
    if res then        
        local sFile = fs.open(sPath, "w")
        sFile.write(res)
        sFile.close()
        print("Downloaded '"..file.."' as '"..localfile.."'")
    end 
end