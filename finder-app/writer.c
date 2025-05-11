#include <stdio.h>
#include <fcntl.h>	//open()
#include <syslog.h> 
#include <unistd.h> //write()
#include <string.h> //strlen()

#define ARGNUM 2
int main(int argc, char *argv[])
{
	//open syslog
	openlog("Writer_Assignment2", 0, LOG_USER);
	
	//if provided arguments not enough, log a syslog error
	//note that argc also includes the script name that is executed, thus argc always 1 extra than provided args
	if(argc < ARGNUM+1)
	{
		syslog(LOG_ERR, "Invalid number of arguments, expected %d but obtained %d", ARGNUM, argc-1);
		return 1;
	}
	
	int fd;
	char *writefile = argv[1];
	const char *writestr = argv[2];
	ssize_t nr;
	fd =  open(writefile, O_WRONLY | O_CREAT | O_TRUNC, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP | S_IROTH);
	if(fd==-1)
	{
		syslog(LOG_ERR, "File open failed");
		return 1;
	}
	nr = write(fd, writestr, strlen(writestr));
	if (nr==-1)
	{
		syslog(LOG_ERR, "File could not be created");
		return 1;
	}
	
	syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
	return 0;
}
