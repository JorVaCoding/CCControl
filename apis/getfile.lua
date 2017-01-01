os.loadAPI("/apis/git")
local args = { ... }

if #args < 1 then
	print( "getfile <file> [localfile]" )
	return
end


local gitfile = args[1]
local localfile = gitfile
if #args > 1 then
	localfile = args[2]
end

git.save("jorvacoding", "cccontrol", "build", gitfile, localfile, true)
