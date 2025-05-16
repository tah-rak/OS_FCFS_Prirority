#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

struct pstat {
    int ctime;
    int etime;
    int ttime;
    int tatime;
    int priority;
};

int main() {
    //char *commands[] = {"writefile", "head"};
    //char *arguments[] = {"input.txt", "file.txt"};
    char *commands[] = {"head","writefile"};
    char *arguments[] = {"file.txt", "input.txt",};
    int prior[] = {3,2,1};
    //char *commands[] = {"uniq", "head","cat"};
    //char *arguments[] = {"input.txt", "file.txt","input.txt"};    

    //char *commands[] = {"head","uniq"};
    //char *arguments[] = {"file.txt", "input.txt",};
   
    int num_commands = sizeof(commands) / sizeof(commands[0]);
    int wtime = 0, sum_of_wtime = 0, sum_of_tatime = 0;

    for (int i = 0; i < num_commands; i++) 
    {
    	int cpid;
        struct pstat pstat_info;

        // creating a child process
       cpid = custmpro(prior[i]);
        if (cpid < 0) 
	{
            printf(1, "fork failed to create\n");
            exit();
        }
        if (cpid == 0) 
	{
	    // This is the child process
            char *args[] = {commands[i], arguments[i], 0};
		
            exec(args[0], args);
            printf(1, "\nexec %s failed for the process\n", commands[i]);
            exit();
        }
	else 
	{
          if (procstat(cpid, &pstat_info) < 0) 
	    {
                printf(1, "procstat failed\n");
                exit();
            }
        }

	//printing the statistics of the process.
        //printf(1, "\nProcess statistics for '%s %s':\n", commands[i], arguments[i]);
        printf(1, "\nProcess statistics for '%s':\n", arguments[i]);
        printf(1,"  Priority of this process is: %d\n",pstat_info.priority);
	printf(1, "  Creation time of the process: %d\n", pstat_info.ctime);
        printf(1, "  End time of the process: %d\n", pstat_info.etime);
        printf(1, "  Total time of the process: %d\n", pstat_info.ttime);
	printf(1, "  Wating time of the process: %d\n", wtime);
	printf(1, "  Turnaround time of the process: %d\n\n", pstat_info.tatime);

	sum_of_wtime += wtime;
        sum_of_tatime += pstat_info.tatime;
	wtime += pstat_info.tatime;

    }

    printf(1, "Average Turnaround time using PBS: %d", (sum_of_tatime/num_commands));
    printf(1, "\nAverage Wating time using PBS: %d\n", (sum_of_wtime/num_commands));

    exit();
}

