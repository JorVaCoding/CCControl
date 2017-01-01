print("Loading APIs... ");
os.loadAPI("/disk/git")

print("Clearing computer... ");
shell.run("delete /apis/*")
shell.run("delete /os/*")

print("Downloading files... ")
git.save("jorvacoding", "cccontrol", "build", "apis/git.lua", "/apis/git", true)
git.save("jorvacoding", "cccontrol", "build", "apis/json.lua", "/apis/json", true)
git.save("jorvacoding", "cccontrol", "build", "apis/encrypt.lua", "/apis/encrypt", true)
