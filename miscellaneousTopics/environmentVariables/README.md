## Environment variables:
1) They are essentially a storage location, that contains name,value pairs.
2) By convention, all environment variables are upper case letters. Note, nevertheless, that is is possible to create a "new" envirnment variable which is NOT all upper case letters.
3) `printenv` is a command that displays all environment variables.
4) In order to create an environment variable use the following syntax: 
`export name=value`, for example, to create an environment varialbe named ROTEM, with the value of 17, do the following:
`export ROTEM="17"`
- 4.1) In case an environment variable with the name `ROTEM` already exist, then its value will be override.
5) To remove (delete) an environment variable use the command `unset`, like so:
`unset ROTEM`
6) Once an environment variable was defined within a current shell session, it is relevant (defined) ONLY for that
session, i.e.- if we open a different shell session, this variable won't be defined there.
In order to add a "persistent" environment variable, add it to the `.bashrc` file (with the same syntax).