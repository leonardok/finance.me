README
=======

*Hi, this is Leonardo speaking. I don't know how you find this piece of
software but you should know that it comes with absolutely no waranty.*

This readme is under construction.

INSTALLING
------------------

To install please download ruby on rails from http://www.rubyonrails.org and install.

### Windows
First: you really should think about getting linux running, but if you are *really* sure you want to do this then do the following:
	
#### Install ruby from the link:
(take note on the ruby install folder)

    http://rubyforge.org/frs/download.php/29263/ruby186-26.exe

	
#### Download Sqlite3 dll from 
    http://www.sqlite.org/download.html
Look for "sqlitedll-*.zip". Unpack on ruby "bin" folder.


#### Uupdate your ruby-gems with the command:
    c:\> gem update --system
	
After go to ruby prompt and install rails, a ruby framework for web development and mongrel (this is optional) with the command:

    c:\> gem install rails mongrel sqlite3-ruby

To run the server execute the command-line

    c:\> ruby script\server

	
### MAC
Install rubygems from rubyonrails website.

	my_user@localhost: 


### Linux
If you are a linux user you should already know what to do, but if you don't, on ruby on rails website there is a nice how to install rails. When you finish go to the project folder and execute:

    ./code/script/server


	
	
## UTILITIES
For now there is no interface to add categories and subcategories, this should be done directly by SQLite. A nice application to do this is the firefox plugin "SQLite Manager".
	
	
## NOTES

- Only tested with ruby186-26 on windows