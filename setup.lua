write("Loading APIs... ");
os.loadAPI("/disk/git")
print("complete.")

write("Clearing computer... ");
shell.run("delete /*")
print("complete.")

write("Downloading files... ")
git.save("jorvacoding", "cccontrol", "build", "apis/git.lua", "/apis/git", true)
git.save("jorvacoding", "cccontrol", "build", "apis/json.lua", "/apis/json", true)
git.save("jorvacoding", "cccontrol", "build", "apis/encrypt.lua", "/apis/encrypt", true)
print("complete.")
