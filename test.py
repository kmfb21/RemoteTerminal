import subprocess

result=""
error=""
output = subprocess.Popen("ls -la", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

#print output
print output.stdout.read()
print output.stderr.read()


# ---firebase_REF.post("current/4", {4:5})
# firebase_REF.delete("current", 6)
# firebase_REF.put("response", 1, "a")
# result = os.system("pwd")
# print result