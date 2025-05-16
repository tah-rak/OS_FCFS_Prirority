
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    int etime;
    int ttime;
    int tatime;
};

int main() {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
    //char *arguments[] = {"file.txt", "input.txt",};
   
    int num_commands = sizeof(commands) / sizeof(commands[0]);
    int wtime = 0, sum_of_wtime = 0, sum_of_tatime = 0;

    for (int i = 0; i < num_commands; i++) 
   e:	31 ff                	xor    %edi,%edi
int main() {
  10:	56                   	push   %esi
    int wtime = 0, sum_of_wtime = 0, sum_of_tatime = 0;
  11:	31 f6                	xor    %esi,%esi
int main() {
  13:	53                   	push   %ebx
    int wtime = 0, sum_of_wtime = 0, sum_of_tatime = 0;
  14:	31 db                	xor    %ebx,%ebx
int main() {
  16:	51                   	push   %ecx
  17:	83 ec 28             	sub    $0x28,%esp
    char *commands[] = {"head", "writefile"};
  1a:	c7 45 c8 78 08 00 00 	movl   $0x878,-0x38(%ebp)
  21:	c7 45 cc 7d 08 00 00 	movl   $0x87d,-0x34(%ebp)
    char *arguments[] = {"file.txt", "input.txt",};
  28:	c7 45 d0 87 08 00 00 	movl   $0x887,-0x30(%ebp)
  2f:	c7 45 d4 90 08 00 00 	movl   $0x890,-0x2c(%ebp)
    {
    	int cpid;
        struct pstat pstat_info;

        // creating a child process
        cpid = fork();
  36:	e8 a0 03 00 00       	call   3db <fork>
        if (cpid < 0) 
  3b:	85 c0                	test   %eax,%eax
  3d:	0f 88 d7 00 00 00    	js     11a <main+0x11a>
	{
            printf(1, "fork failed to create\n");
            exit();
        }
        if (cpid == 0) 
  43:	0f 84 e4 00 00 00    	je     12d <main+0x12d>
            printf(1, "\nexec %s failed for the process\n", commands[i]);
            exit();
        }
	else 
	{
          if (procstat(cpid, &pstat_info) < 0) 
  49:	83 ec 08             	sub    $0x8,%esp
  4c:	8d 55 d8             	lea    -0x28(%ebp),%edx
  4f:	52                   	push   %edx
  50:	50                   	push   %eax
  51:	e8 35 04 00 00       	call   48b <procstat>
  56:	83 c4 10             	add    $0x10,%esp
  59:	85 c0                	test   %eax,%eax
  5b:	0f 88 12 01 00 00    	js     173 <main+0x173>
            }
        }

	//printing the statistics of the process.
        //printf(1, "\nProcess statistics for '%s %s':\n", commands[i], arguments[i]);
        printf(1, "\nProcess statistics for '%s':\n",arguments[i]);
  61:	83 ec 04             	sub    $0x4,%esp
  64:	ff 74 bd d0          	push   -0x30(%ebp,%edi,4)
        printf(1, "  End time of the process: %d\n", pstat_info.etime);
        printf(1, "  Total time of the process: %d\n", pstat_info.ttime);
	printf(1, "  Wating time of the process: %d\n", wtime);
	printf(1, "  Turnaround time of the process: %d\n\n", pstat_info.tatime);

	sum_of_wtime += wtime;
  68:	01 de                	add    %ebx,%esi
        printf(1, "\nProcess statistics for '%s':\n",arguments[i]);
  6a:	68 f4 08 00 00       	push   $0x8f4
  6f:	6a 01                	push   $0x1
  71:	e8 da 04 00 00       	call   550 <printf>
        printf(1, "  Creation time of the process: %d\n", pstat_info.ctime);
  76:	83 c4 0c             	add    $0xc,%esp
  79:	ff 75 d8             	push   -0x28(%ebp)
  7c:	68 14 09 00 00       	push   $0x914
  81:	6a 01                	push   $0x1
  83:	e8 c8 04 00 00       	call   550 <printf>
        printf(1, "  End time of the process: %d\n", pstat_info.etime);
  88:	83 c4 0c             	add    $0xc,%esp
  8b:	ff 75 dc             	push   -0x24(%ebp)
  8e:	68 38 09 00 00       	push   $0x938
  93:	6a 01                	push   $0x1
  95:	e8 b6 04 00 00       	call   550 <printf>
        printf(1, "  Total time of the process: %d\n", pstat_info.ttime);
  9a:	83 c4 0c             	add    $0xc,%esp
  9d:	ff 75 e0             	push   -0x20(%ebp)
  a0:	68 58 09 00 00       	push   $0x958
  a5:	6a 01                	push   $0x1
  a7:	e8 a4 04 00 00       	call   550 <printf>
	printf(1, "  Wating time of the process: %d\n", wtime);
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	53                   	push   %ebx
  b0:	68 7c 09 00 00       	push   $0x97c
  b5:	6a 01                	push   $0x1
  b7:	e8 94 04 00 00       	call   550 <printf>
	printf(1, "  Turnaround time of the process: %d\n\n", pstat_info.tatime);
  bc:	83 c4 0c             	add    $0xc,%esp
  bf:	ff 75 e4             	push   -0x1c(%ebp)
  c2:	68 a0 09 00 00       	push   $0x9a0
  c7:	6a 01                	push   $0x1
  c9:	e8 82 04 00 00       	call   550 <printf>
        sum_of_tatime += pstat_info.tatime;
  ce:	03 5d e4             	add    -0x1c(%ebp),%ebx
    for (int i = 0; i < num_commands; i++) 
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	83 ff 01             	cmp    $0x1,%edi
  d7:	75 37                	jne    110 <main+0x110>
	wtime += pstat_info.tatime;

    }

    printf(1, "Average Turnaround time using FCFS: %d", (sum_of_tatime/num_commands));
  d9:	89 d8                	mov    %ebx,%eax
  db:	83 ec 04             	sub    $0x4,%esp
  de:	c1 e8 1f             	shr    $0x1f,%eax
  e1:	01 d8                	add    %ebx,%eax
  e3:	d1 f8                	sar    %eax
  e5:	50                   	push   %eax
  e6:	68 c8 09 00 00       	push   $0x9c8
  eb:	6a 01                	push   $0x1
  ed:	e8 5e 04 00 00       	call   550 <printf>
    printf(1, "\nAverage Wating time using FCFS: %d\n", (sum_of_wtime/num_commands));
  f2:	89 f0                	mov    %esi,%eax
  f4:	83 c4 0c             	add    $0xc,%esp
  f7:	c1 e8 1f             	shr    $0x1f,%eax
  fa:	01 f0                	add    %esi,%eax
  fc:	d1 f8                	sar    %eax
  fe:	50                   	push   %eax
  ff:	68 f0 09 00 00       	push   $0x9f0
 104:	6a 01                	push   $0x1
 106:	e8 45 04 00 00       	call   550 <printf>

    exit();
 10b:	e8 d3 02 00 00       	call   3e3 <exit>
 110:	bf 01 00 00 00       	mov    $0x1,%edi
 115:	e9 1c ff ff ff       	jmp    36 <main+0x36>
            printf(1, "fork failed to create\n");
 11a:	57                   	push   %edi
 11b:	57                   	push   %edi
 11c:	68 9a 08 00 00       	push   $0x89a
 121:	6a 01                	push   $0x1
 123:	e8 28 04 00 00       	call   550 <printf>
            exit();
 128:	e8 b6 02 00 00       	call   3e3 <exit>
            char *args[] = {commands[i], arguments[i], 0};
 12d:	8b 5c bd c8          	mov    -0x38(%ebp,%edi,4),%ebx
 131:	8b 44 bd d0          	mov    -0x30(%ebp,%edi,4),%eax
	    printf(1, "Process%d\n",i);
 135:	52                   	push   %edx
 136:	57                   	push   %edi
 137:	68 b1 08 00 00       	push   $0x8b1
 13c:	6a 01                	push   $0x1
            char *args[] = {commands[i], arguments[i], 0};
 13e:	89 45 dc             	mov    %eax,-0x24(%ebp)
 141:	89 5d d8             	mov    %ebx,-0x28(%ebp)
 144:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
	    printf(1, "Process%d\n",i);
 14b:	e8 00 04 00 00       	call   550 <printf>
            exec(args[0], args);
 150:	8d 45 d8             	lea    -0x28(%ebp),%eax
 153:	59                   	pop    %ecx
 154:	5e                   	pop    %esi
 155:	50                   	push   %eax
 156:	ff 75 d8             	push   -0x28(%ebp)
 159:	e8 bd 02 00 00       	call   41b <exec>
            printf(1, "\nexec %s failed for the process\n", commands[i]);
 15e:	83 c4 0c             	add    $0xc,%esp
 161:	53                   	push   %ebx
 162:	68 d0 08 00 00       	push   $0x8d0
 167:	6a 01                	push   $0x1
 169:	e8 e2 03 00 00       	call   550 <printf>
            exit();
 16e:	e8 70 02 00 00       	call   3e3 <exit>
                printf(1, "procstat failed\n");
 173:	50                   	push   %eax
 174:	50                   	push   %eax
 175:	68 bc 08 00 00       	push   $0x8bc
 17a:	6a 01                	push   $0x1
 17c:	e8 cf 03 00 00       	call   550 <printf>
                exit();
 181:	e8 5d 02 00 00       	call   3e3 <exit>
 186:	66 90                	xchg   %ax,%ax
 188:	66 90                	xchg   %ax,%ax
 18a:	66 90                	xchg   %ax,%ax
 18c:	66 90                	xchg   %ax,%ax
 18e:	66 90                	xchg   %ax,%ax

00000190 <strcpy>:
 190:	55                   	push   %ebp
 191:	31 c0                	xor    %eax,%eax
 193:	89 e5                	mov    %esp,%ebp
 195:	53                   	push   %ebx
 196:	8b 4d 08             	mov    0x8(%ebp),%ecx
 199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
 1ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b1:	89 c8                	mov    %ecx,%eax
 1b3:	c9                   	leave  
 1b4:	c3                   	ret    
 1b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strcmp>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 17                	jne    1e8 <strcmp+0x28>
 1d1:	eb 3a                	jmp    20d <strcmp+0x4d>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
 1dc:	83 c2 01             	add    $0x1,%edx
 1df:	8d 59 01             	lea    0x1(%ecx),%ebx
 1e2:	84 c0                	test   %al,%al
 1e4:	74 1a                	je     200 <strcmp+0x40>
 1e6:	89 d9                	mov    %ebx,%ecx
 1e8:	0f b6 19             	movzbl (%ecx),%ebx
 1eb:	38 c3                	cmp    %al,%bl
 1ed:	74 e9                	je     1d8 <strcmp+0x18>
 1ef:	29 d8                	sub    %ebx,%eax
 1f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 204:	31 c0                	xor    %eax,%eax
 206:	29 d8                	sub    %ebx,%eax
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave  
 20c:	c3                   	ret    
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	31 c0                	xor    %eax,%eax
 212:	eb db                	jmp    1ef <strcmp+0x2f>
 214:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strlen>:
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
 226:	80 3a 00             	cmpb   $0x0,(%edx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 c0                	xor    %eax,%eax
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c0 01             	add    $0x1,%eax
 233:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 237:	89 c1                	mov    %eax,%ecx
 239:	75 f5                	jne    230 <strlen+0x10>
 23b:	89 c8                	mov    %ecx,%eax
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop
 240:	31 c9                	xor    %ecx,%ecx
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
 262:	8b 7d fc             	mov    -0x4(%ebp),%edi
 265:	89 d0                	mov    %edx,%eax
 267:	c9                   	leave  
 268:	c3                   	ret    
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strchr>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 12                	jne    293 <strchr+0x23>
 281:	eb 1d                	jmp    2a0 <strchr+0x30>
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
 288:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	84 d2                	test   %dl,%dl
 291:	74 0d                	je     2a0 <strchr+0x30>
 293:	38 d1                	cmp    %dl,%cl
 295:	75 f1                	jne    288 <strchr+0x18>
 297:	5d                   	pop    %ebp
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	31 c0                	xor    %eax,%eax
 2a2:	5d                   	pop    %ebp
 2a3:	c3                   	ret    
 2a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <gets>:
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
 2b8:	53                   	push   %ebx
 2b9:	31 db                	xor    %ebx,%ebx
 2bb:	83 ec 1c             	sub    $0x1c,%esp
 2be:	eb 27                	jmp    2e7 <gets+0x37>
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	57                   	push   %edi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 2e 01 00 00       	call   3fb <read>
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 2df:	3c 0a                	cmp    $0xa,%al
 2e1:	74 1d                	je     300 <gets+0x50>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 19                	je     300 <gets+0x50>
 2e7:	89 de                	mov    %ebx,%esi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 2f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5f                   	pop    %edi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	89 de                	mov    %ebx,%esi
 305:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 309:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5f                   	pop    %edi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <stat>:
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	push   0x8(%ebp)
 32d:	e8 f1 00 00 00       	call   423 <open>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	push   0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 f4 00 00 00       	call   43b <fstat>
 347:	89 1c 24             	mov    %ebx,(%esp)
 34a:	89 c6                	mov    %eax,%esi
 34c:	e8 ba 00 00 00       	call   40b <close>
 351:	83 c4 10             	add    $0x10,%esp
 354:	8d 65 f8             	lea    -0x8(%ebp),%esp
 357:	89 f0                	mov    %esi,%eax
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	be ff ff ff ff       	mov    $0xffffffff,%esi
 365:	eb ed                	jmp    354 <stat+0x34>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax

00000370 <atoi>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	0f be 02             	movsbl (%edx),%eax
 37a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 37d:	80 f9 09             	cmp    $0x9,%cl
 380:	b9 00 00 00 00       	mov    $0x0,%ecx
 385:	77 1e                	ja     3a5 <atoi+0x35>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax
 390:	83 c2 01             	add    $0x1,%edx
 393:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 396:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 39a:	0f be 02             	movsbl (%edx),%eax
 39d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
 3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a8:	89 c8                	mov    %ecx,%eax
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 45 10             	mov    0x10(%ebp),%eax
 3b7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ba:	56                   	push   %esi
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
 3be:	85 c0                	test   %eax,%eax
 3c0:	7e 13                	jle    3d5 <memmove+0x25>
 3c2:	01 d0                	add    %edx,%eax
 3c4:	89 d7                	mov    %edx,%edi
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 3d1:	39 f8                	cmp    %edi,%eax
 3d3:	75 fb                	jne    3d0 <memmove+0x20>
 3d5:	5e                   	pop    %esi
 3d6:	89 d0                	mov    %edx,%eax
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <fork>:
 3db:	b8 01 00 00 00       	mov    $0x1,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <exit>:
 3e3:	b8 02 00 00 00       	mov    $0x2,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <wait>:
 3eb:	b8 03 00 00 00       	mov    $0x3,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <pipe>:
 3f3:	b8 04 00 00 00       	mov    $0x4,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <read>:
 3fb:	b8 05 00 00 00       	mov    $0x5,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <write>:
 403:	b8 10 00 00 00       	mov    $0x10,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <close>:
 40b:	b8 15 00 00 00       	mov    $0x15,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <kill>:
 413:	b8 06 00 00 00       	mov    $0x6,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exec>:
 41b:	b8 07 00 00 00       	mov    $0x7,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <open>:
 423:	b8 0f 00 00 00       	mov    $0xf,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mknod>:
 42b:	b8 11 00 00 00       	mov    $0x11,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <unlink>:
 433:	b8 12 00 00 00       	mov    $0x12,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <fstat>:
 43b:	b8 08 00 00 00       	mov    $0x8,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <link>:
 443:	b8 13 00 00 00       	mov    $0x13,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mkdir>:
 44b:	b8 14 00 00 00       	mov    $0x14,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <chdir>:
 453:	b8 09 00 00 00       	mov    $0x9,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <dup>:
 45b:	b8 0a 00 00 00       	mov    $0xa,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <getpid>:
 463:	b8 0b 00 00 00       	mov    $0xb,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <sbrk>:
 46b:	b8 0c 00 00 00       	mov    $0xc,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <sleep>:
 473:	b8 0d 00 00 00       	mov    $0xd,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <uptime>:
 47b:	b8 0e 00 00 00       	mov    $0xe,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <ps>:
 483:	b8 16 00 00 00       	mov    $0x16,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <procstat>:
 48b:	b8 17 00 00 00       	mov    $0x17,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    
 493:	66 90                	xchg   %ax,%ax
 495:	66 90                	xchg   %ax,%ax
 497:	66 90                	xchg   %ax,%ax
 499:	66 90                	xchg   %ax,%ax
 49b:	66 90                	xchg   %ax,%ax
 49d:	66 90                	xchg   %ax,%ax
 49f:	90                   	nop

000004a0 <printint>:
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
 4a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
 4ac:	89 d1                	mov    %edx,%ecx
 4ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
 4b1:	85 d2                	test   %edx,%edx
 4b3:	0f 89 7f 00 00 00    	jns    538 <printint+0x98>
 4b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4bd:	74 79                	je     538 <printint+0x98>
 4bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
 4c6:	f7 d9                	neg    %ecx
 4c8:	31 db                	xor    %ebx,%ebx
 4ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
 4d0:	89 c8                	mov    %ecx,%eax
 4d2:	31 d2                	xor    %edx,%edx
 4d4:	89 cf                	mov    %ecx,%edi
 4d6:	f7 75 c4             	divl   -0x3c(%ebp)
 4d9:	0f b6 92 74 0a 00 00 	movzbl 0xa74(%edx),%edx
 4e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4e3:	89 d8                	mov    %ebx,%eax
 4e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
 4e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 4eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
 4ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4f1:	76 dd                	jbe    4d0 <printint+0x30>
 4f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4f6:	85 c9                	test   %ecx,%ecx
 4f8:	74 0c                	je     506 <printint+0x66>
 4fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4ff:	89 d8                	mov    %ebx,%eax
 501:	ba 2d 00 00 00       	mov    $0x2d,%edx
 506:	8b 7d b8             	mov    -0x48(%ebp),%edi
 509:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 50d:	eb 07                	jmp    516 <printint+0x76>
 50f:	90                   	nop
 510:	0f b6 13             	movzbl (%ebx),%edx
 513:	83 eb 01             	sub    $0x1,%ebx
 516:	83 ec 04             	sub    $0x4,%esp
 519:	88 55 d7             	mov    %dl,-0x29(%ebp)
 51c:	6a 01                	push   $0x1
 51e:	56                   	push   %esi
 51f:	57                   	push   %edi
 520:	e8 de fe ff ff       	call   403 <write>
 525:	83 c4 10             	add    $0x10,%esp
 528:	39 de                	cmp    %ebx,%esi
 52a:	75 e4                	jne    510 <printint+0x70>
 52c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52f:	5b                   	pop    %ebx
 530:	5e                   	pop    %esi
 531:	5f                   	pop    %edi
 532:	5d                   	pop    %ebp
 533:	c3                   	ret    
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 538:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 53f:	eb 87                	jmp    4c8 <printint+0x28>
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop

00000550 <printf>:
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 2c             	sub    $0x2c,%esp
 559:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 55c:	8b 75 08             	mov    0x8(%ebp),%esi
 55f:	0f b6 13             	movzbl (%ebx),%edx
 562:	84 d2                	test   %dl,%dl
 564:	74 6a                	je     5d0 <printf+0x80>
 566:	8d 45 10             	lea    0x10(%ebp),%eax
 569:	83 c3 01             	add    $0x1,%ebx
 56c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 56f:	31 c9                	xor    %ecx,%ecx
 571:	89 45 d0             	mov    %eax,-0x30(%ebp)
 574:	eb 36                	jmp    5ac <printf+0x5c>
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
 580:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 583:	b9 25 00 00 00       	mov    $0x25,%ecx
 588:	83 f8 25             	cmp    $0x25,%eax
 58b:	74 15                	je     5a2 <printf+0x52>
 58d:	83 ec 04             	sub    $0x4,%esp
 590:	88 55 e7             	mov    %dl,-0x19(%ebp)
 593:	6a 01                	push   $0x1
 595:	57                   	push   %edi
 596:	56                   	push   %esi
 597:	e8 67 fe ff ff       	call   403 <write>
 59c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	0f b6 13             	movzbl (%ebx),%edx
 5a5:	83 c3 01             	add    $0x1,%ebx
 5a8:	84 d2                	test   %dl,%dl
 5aa:	74 24                	je     5d0 <printf+0x80>
 5ac:	0f b6 c2             	movzbl %dl,%eax
 5af:	85 c9                	test   %ecx,%ecx
 5b1:	74 cd                	je     580 <printf+0x30>
 5b3:	83 f9 25             	cmp    $0x25,%ecx
 5b6:	75 ea                	jne    5a2 <printf+0x52>
 5b8:	83 f8 25             	cmp    $0x25,%eax
 5bb:	0f 84 07 01 00 00    	je     6c8 <printf+0x178>
 5c1:	83 e8 63             	sub    $0x63,%eax
 5c4:	83 f8 15             	cmp    $0x15,%eax
 5c7:	77 17                	ja     5e0 <printf+0x90>
 5c9:	ff 24 85 1c 0a 00 00 	jmp    *0xa1c(,%eax,4)
 5d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d3:	5b                   	pop    %ebx
 5d4:	5e                   	pop    %esi
 5d5:	5f                   	pop    %edi
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
 5e0:	83 ec 04             	sub    $0x4,%esp
 5e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5e6:	6a 01                	push   $0x1
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ee:	e8 10 fe ff ff       	call   403 <write>
 5f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
 5f7:	83 c4 0c             	add    $0xc,%esp
 5fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5fd:	6a 01                	push   $0x1
 5ff:	57                   	push   %edi
 600:	56                   	push   %esi
 601:	e8 fd fd ff ff       	call   403 <write>
 606:	83 c4 10             	add    $0x10,%esp
 609:	31 c9                	xor    %ecx,%ecx
 60b:	eb 95                	jmp    5a2 <printf+0x52>
 60d:	8d 76 00             	lea    0x0(%esi),%esi
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 10 00 00 00       	mov    $0x10,%ecx
 618:	6a 00                	push   $0x0
 61a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 61d:	8b 10                	mov    (%eax),%edx
 61f:	89 f0                	mov    %esi,%eax
 621:	e8 7a fe ff ff       	call   4a0 <printint>
 626:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 62a:	83 c4 10             	add    $0x10,%esp
 62d:	31 c9                	xor    %ecx,%ecx
 62f:	e9 6e ff ff ff       	jmp    5a2 <printf+0x52>
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 638:	8b 45 d0             	mov    -0x30(%ebp),%eax
 63b:	8b 10                	mov    (%eax),%edx
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 d0             	mov    %eax,-0x30(%ebp)
 643:	85 d2                	test   %edx,%edx
 645:	0f 84 8d 00 00 00    	je     6d8 <printf+0x188>
 64b:	0f b6 02             	movzbl (%edx),%eax
 64e:	31 c9                	xor    %ecx,%ecx
 650:	84 c0                	test   %al,%al
 652:	0f 84 4a ff ff ff    	je     5a2 <printf+0x52>
 658:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 65b:	89 d3                	mov    %edx,%ebx
 65d:	8d 76 00             	lea    0x0(%esi),%esi
 660:	83 ec 04             	sub    $0x4,%esp
 663:	83 c3 01             	add    $0x1,%ebx
 666:	88 45 e7             	mov    %al,-0x19(%ebp)
 669:	6a 01                	push   $0x1
 66b:	57                   	push   %edi
 66c:	56                   	push   %esi
 66d:	e8 91 fd ff ff       	call   403 <write>
 672:	0f b6 03             	movzbl (%ebx),%eax
 675:	83 c4 10             	add    $0x10,%esp
 678:	84 c0                	test   %al,%al
 67a:	75 e4                	jne    660 <printf+0x110>
 67c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 67f:	31 c9                	xor    %ecx,%ecx
 681:	e9 1c ff ff ff       	jmp    5a2 <printf+0x52>
 686:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
 698:	6a 01                	push   $0x1
 69a:	e9 7b ff ff ff       	jmp    61a <printf+0xca>
 69f:	90                   	nop
 6a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6a3:	83 ec 04             	sub    $0x4,%esp
 6a6:	8b 00                	mov    (%eax),%eax
 6a8:	6a 01                	push   $0x1
 6aa:	57                   	push   %edi
 6ab:	56                   	push   %esi
 6ac:	88 45 e7             	mov    %al,-0x19(%ebp)
 6af:	e8 4f fd ff ff       	call   403 <write>
 6b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6b8:	83 c4 10             	add    $0x10,%esp
 6bb:	31 c9                	xor    %ecx,%ecx
 6bd:	e9 e0 fe ff ff       	jmp    5a2 <printf+0x52>
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6cb:	83 ec 04             	sub    $0x4,%esp
 6ce:	e9 2a ff ff ff       	jmp    5fd <printf+0xad>
 6d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6d7:	90                   	nop
 6d8:	ba 15 0a 00 00       	mov    $0xa15,%edx
 6dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6e0:	b8 28 00 00 00       	mov    $0x28,%eax
 6e5:	89 d3                	mov    %edx,%ebx
 6e7:	e9 74 ff ff ff       	jmp    660 <printf+0x110>
 6ec:	66 90                	xchg   %ax,%ax
 6ee:	66 90                	xchg   %ax,%ax

000006f0 <free>:
 6f0:	55                   	push   %ebp
 6f1:	a1 2c 0d 00 00       	mov    0xd2c,%eax
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 708:	89 c2                	mov    %eax,%edx
 70a:	8b 00                	mov    (%eax),%eax
 70c:	39 ca                	cmp    %ecx,%edx
 70e:	73 30                	jae    740 <free+0x50>
 710:	39 c1                	cmp    %eax,%ecx
 712:	72 04                	jb     718 <free+0x28>
 714:	39 c2                	cmp    %eax,%edx
 716:	72 f0                	jb     708 <free+0x18>
 718:	8b 73 fc             	mov    -0x4(%ebx),%esi
 71b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71e:	39 f8                	cmp    %edi,%eax
 720:	74 30                	je     752 <free+0x62>
 722:	89 43 f8             	mov    %eax,-0x8(%ebx)
 725:	8b 42 04             	mov    0x4(%edx),%eax
 728:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 72b:	39 f1                	cmp    %esi,%ecx
 72d:	74 3a                	je     769 <free+0x79>
 72f:	89 0a                	mov    %ecx,(%edx)
 731:	5b                   	pop    %ebx
 732:	89 15 2c 0d 00 00    	mov    %edx,0xd2c
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 740:	39 c2                	cmp    %eax,%edx
 742:	72 c4                	jb     708 <free+0x18>
 744:	39 c1                	cmp    %eax,%ecx
 746:	73 c0                	jae    708 <free+0x18>
 748:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74e:	39 f8                	cmp    %edi,%eax
 750:	75 d0                	jne    722 <free+0x32>
 752:	03 70 04             	add    0x4(%eax),%esi
 755:	89 73 fc             	mov    %esi,-0x4(%ebx)
 758:	8b 02                	mov    (%edx),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	89 43 f8             	mov    %eax,-0x8(%ebx)
 75f:	8b 42 04             	mov    0x4(%edx),%eax
 762:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 765:	39 f1                	cmp    %esi,%ecx
 767:	75 c6                	jne    72f <free+0x3f>
 769:	03 43 fc             	add    -0x4(%ebx),%eax
 76c:	89 15 2c 0d 00 00    	mov    %edx,0xd2c
 772:	89 42 04             	mov    %eax,0x4(%edx)
 775:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 778:	89 0a                	mov    %ecx,(%edx)
 77a:	5b                   	pop    %ebx
 77b:	5e                   	pop    %esi
 77c:	5f                   	pop    %edi
 77d:	5d                   	pop    %ebp
 77e:	c3                   	ret    
 77f:	90                   	nop

00000780 <malloc>:
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 1c             	sub    $0x1c,%esp
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	8b 3d 2c 0d 00 00    	mov    0xd2c,%edi
 792:	8d 70 07             	lea    0x7(%eax),%esi
 795:	c1 ee 03             	shr    $0x3,%esi
 798:	83 c6 01             	add    $0x1,%esi
 79b:	85 ff                	test   %edi,%edi
 79d:	0f 84 9d 00 00 00    	je     840 <malloc+0xc0>
 7a3:	8b 17                	mov    (%edi),%edx
 7a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7a8:	39 f1                	cmp    %esi,%ecx
 7aa:	73 6a                	jae    816 <malloc+0x96>
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 de                	cmp    %ebx,%esi
 7b3:	0f 43 de             	cmovae %esi,%ebx
 7b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7c0:	eb 17                	jmp    7d9 <malloc+0x59>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7c8:	8b 02                	mov    (%edx),%eax
 7ca:	8b 48 04             	mov    0x4(%eax),%ecx
 7cd:	39 f1                	cmp    %esi,%ecx
 7cf:	73 4f                	jae    820 <malloc+0xa0>
 7d1:	8b 3d 2c 0d 00 00    	mov    0xd2c,%edi
 7d7:	89 c2                	mov    %eax,%edx
 7d9:	39 d7                	cmp    %edx,%edi
 7db:	75 eb                	jne    7c8 <malloc+0x48>
 7dd:	83 ec 0c             	sub    $0xc,%esp
 7e0:	ff 75 e4             	push   -0x1c(%ebp)
 7e3:	e8 83 fc ff ff       	call   46b <sbrk>
 7e8:	83 c4 10             	add    $0x10,%esp
 7eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ee:	74 1c                	je     80c <malloc+0x8c>
 7f0:	89 58 04             	mov    %ebx,0x4(%eax)
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	83 c0 08             	add    $0x8,%eax
 7f9:	50                   	push   %eax
 7fa:	e8 f1 fe ff ff       	call   6f0 <free>
 7ff:	8b 15 2c 0d 00 00    	mov    0xd2c,%edx
 805:	83 c4 10             	add    $0x10,%esp
 808:	85 d2                	test   %edx,%edx
 80a:	75 bc                	jne    7c8 <malloc+0x48>
 80c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80f:	31 c0                	xor    %eax,%eax
 811:	5b                   	pop    %ebx
 812:	5e                   	pop    %esi
 813:	5f                   	pop    %edi
 814:	5d                   	pop    %ebp
 815:	c3                   	ret    
 816:	89 d0                	mov    %edx,%eax
 818:	89 fa                	mov    %edi,%edx
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 820:	39 ce                	cmp    %ecx,%esi
 822:	74 4c                	je     870 <malloc+0xf0>
 824:	29 f1                	sub    %esi,%ecx
 826:	89 48 04             	mov    %ecx,0x4(%eax)
 829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 82c:	89 70 04             	mov    %esi,0x4(%eax)
 82f:	89 15 2c 0d 00 00    	mov    %edx,0xd2c
 835:	8d 65 f4             	lea    -0xc(%ebp),%esp
 838:	83 c0 08             	add    $0x8,%eax
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    
 840:	c7 05 2c 0d 00 00 30 	movl   $0xd30,0xd2c
 847:	0d 00 00 
 84a:	bf 30 0d 00 00       	mov    $0xd30,%edi
 84f:	c7 05 30 0d 00 00 30 	movl   $0xd30,0xd30
 856:	0d 00 00 
 859:	89 fa                	mov    %edi,%edx
 85b:	c7 05 34 0d 00 00 00 	movl   $0x0,0xd34
 862:	00 00 00 
 865:	e9 42 ff ff ff       	jmp    7ac <malloc+0x2c>
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 870:	8b 08                	mov    (%eax),%ecx
 872:	89 0a                	mov    %ecx,(%edx)
 874:	eb b9                	jmp    82f <malloc+0xaf>
