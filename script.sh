#!/usr/bin/expect

set my_user_id [lindex $argv 0]
set my_password [lindex $argv 1]
set telnet_host [lindex $argv 2]
set my_enable [lindex $argv 3]

# Open a telnet session to a remote server, and wait for a username prompt.
spawn ssh utnp.tn.utexas.edu
expect "Username:"

# Send the username, and then wait for a password prompt.
send "$my_user_id\r"
expect "Password:"

# Send the password, and then wait for a shell prompt.
send "$my_password\r"
expect "command:"

# Send the prebuilt command, and then wait for another shell prompt.
send "telnet $telnet_host"
send "\r"
expect "Username:"

# Send the username, and then wait for a password prompt.
send "$my_user_id\r"
expect "Password:"

# Send the password, and then wait for a shell prompt.
send "$my_password\r"
send "en"
send "\r"
expect "Password:"
send "$my_enable"
send "\r"

# Capture the results of the command into a variable. This can be displayed, or written to disk.
#set results $expect_out(buffer)
#puts $expect_out(buffer)

# Exit the telnet session, and wait for a special end-of-file character.
expect "#"
sleep 1
send  "exit\r"
expect "command:"
send "quit\r"
expect eof
