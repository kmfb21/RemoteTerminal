from firebase import firebase
# import os
import subprocess

while 1:
    # set up db
    firebase_REF = firebase.FirebaseApplication('https://remotemac-d5039.firebaseio.com', authentication=None)

    # get whether has command now
    done = firebase_REF.get("done", None)
    if done == 0:
        # not done, get the command
        command = firebase_REF.get("command", None)
        # delete old response
        # firebase_REF.delete("/", "response")

        # p = os.popen(command, 'r')
        # save new and update done=1
        # i = 1
        # while 1:
        #     line = p.readline()
        #     if not line:
        #         break
        #     firebase_REF.put("response", i, line)
        #     i += 1
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        firebase_REF.put("response", 1, p.stdout.read())
        firebase_REF.put("response", 2, p.stderr.read())

        firebase_REF.put("", "done", 1)
