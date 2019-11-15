## Process, process group, jobs and sessions in Linux

# Shell
Each shell you get at login becomes the leader of its own new session and process group, and sets the controlling process group of the terminal to itself.
The shell creates a process group within the current session for each "job" it launches, and places each process it starts into the appropriate process group.
For example, `ls | head` is a pipeline of two `processes`, which the shell considers a single `job`, and will belong to a single, new process group.

# Process
A process is a (collection of) thread of execution and other context, such as address space and file descriptor table. A process may start other processes; these new processes will belong to the same process group as the parent unless other action is taken. Each process may also have a "controlling terminal", which starts off the same as its parent.

# Jobs
The shell has the concept of "foreground" jobs and "background" jobs. Foreground jobs are process groups with control of the terminal, and background jobs are process groups without control of the terminal.
- It is possible to "pass" job from the foreground to the background and vice versa using the `fg` and `bg` command respectively.
- The "current" job considered to be the last job that was stopped when it was in the foreground or the last job that was started in the background.