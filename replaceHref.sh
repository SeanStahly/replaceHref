#!/usr/bin/env python
import os, shutil, re, sys

#changedEmail = sys.argv[1]
if len(sys.argv) > 2:

	if os.path.isdir('./htmlEmail'):
		shutil.rmtree('./htmlEmail')
	os.mkdir('./htmlEmail', 0755)
	newEmail = ""


	with open('testEmail.txt') as f:
		content = f.readlines()
		regex = re.compile(r'href=\".*\"', re.IGNORECASE)
		for l in content:
			line = l
			if "href=\"" in line:
				newEmail += regex.sub('href="' + sys.argv[2] + '\"', line)
				#newEmail += regex.sub('href="http://www.google.com\"', line)
				#print line.replace('href\"*\"', 'href\"http://www.google.com\"')
			else:
				newEmail += line
	with open('./htmlEmail/newEmail.html', 'w+') as f:
		f.write(newEmail)
else:
	print 'Please enter the location of the email and/or the new href'
