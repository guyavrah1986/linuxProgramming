# snippets

This folder contains different code snippets for commonlly used actions done with command line `git`.

# listing:

- 1) `commitToPushFlow`: In the most basic scenario where the local repositroy is fully synchronized with the remote, and it (the local) have ONLY "un-tracked" and/or "un-staged" files
			 what we need to do is "simply" perform `git add -A`--> `git commit` --> `git push`. This script does it all, only requiers as its only argument the commit message.

