# Advanced topics in bash scripting:

- multiThreadsInScript.sh: Basic example of using ("creating") multiple "background threads" of execution within a bash script and waiting for all of them to finish. 
	* Nice relevant link:
	- https://www.davidpashley.com/articles/writing-robust-shell-scripts/
	- https://stackoverflow.com/a/25361436/1971003

- shareVarBetweenScripts: Contains basic usage of sharing (passing) variables simple and "complex" (such as accossiative array) between different scripts.
	* Note that, once the first script "imports" the other script using the `.` operator, ALL commands that exists in the "imported script will be executed, i.e.- global variables initializations
	commands outside of every function,etc...
	* Note the usage of the `.` "operator" (and not the "equivaslent `source` operator) which is moore "portable" (exists in all shells). 
	

