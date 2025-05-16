
_uniq:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

//using the maxmium length (we can use direct numeric if required) 
#define MAX_LINE_LENGTH 1000

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec e8 0b 00 00    	sub    $0xbe8,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
	if (argc <= 1)  // Check if the number of command-line arguments is not equal to 2
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	0f 8e 80 01 00 00    	jle    1a5 <main+0x1a5>
	char *inputFile;
	char cond[10];
	if (argc > 2)
	{
		inputFile = argv[2];
		strcpy(cond,argv[1]);
  25:	8b 72 04             	mov    0x4(%edx),%esi
	if (argc > 2)
  28:	83 f8 02             	cmp    $0x2,%eax
  2b:	0f 85 8d 00 00 00    	jne    be <main+0xbe>
		inputFile = argv[1];
	}

    	//initialization and assign values
   	// Store input file name from the command line
	int fileDescriptor = open(inputFile, 0);
  31:	83 ec 08             	sub    $0x8,%esp
	char previousLine[MAX_LINE_LENGTH] = ""; 
  34:	8d bd 34 f4 ff ff    	lea    -0xbcc(%ebp),%edi
	int fileDescriptor = open(inputFile, 0);
  3a:	6a 00                	push   $0x0
  3c:	56                   	push   %esi
  3d:	e8 a1 05 00 00       	call   5e3 <open>
	char previousLine[MAX_LINE_LENGTH] = ""; 
  42:	b9 f9 00 00 00       	mov    $0xf9,%ecx
	char currentLine[MAX_LINE_LENGTH]; 
	char cmpLine[MAX_LINE_LENGTH];
	char currentCharacter;
	int count=0; 
	if (fileDescriptor < 0) // Check if opening the file failed
  47:	83 c4 10             	add    $0x10,%esp
	char previousLine[MAX_LINE_LENGTH] = ""; 
  4a:	c7 85 30 f4 ff ff 00 	movl   $0x0,-0xbd0(%ebp)
  51:	00 00 00 
	int fileDescriptor = open(inputFile, 0);
  54:	89 c3                	mov    %eax,%ebx
	char previousLine[MAX_LINE_LENGTH] = ""; 
  56:	31 c0                	xor    %eax,%eax
  58:	f3 ab                	rep stos %eax,%es:(%edi)
	if (fileDescriptor < 0) // Check if opening the file failed
  5a:	85 db                	test   %ebx,%ebx
  5c:	78 7c                	js     da <main+0xda>
	{
		printf(1, "Error: Cannot open file %s\n", inputFile); 
        	exit();
   	}

    	printf(1, "Uniq command is being executed in user mode\n");
  5e:	50                   	push   %eax
  5f:	50                   	push   %eax
  60:	68 64 0a 00 00       	push   $0xa64
  65:	6a 01                	push   $0x1
  67:	e8 a4 06 00 00       	call   710 <printf>
	int value = 0;
    	while (read(fileDescriptor, &currentCharacter, 1) == 1)  // Read one character at a time from the file to compare the previous and current line
  6c:	83 c4 10             	add    $0x10,%esp
	int count=0; 
  6f:	c7 85 14 f4 ff ff 00 	movl   $0x0,-0xbec(%ebp)
  76:	00 00 00 
  79:	31 ff                	xor    %edi,%edi
  7b:	eb 19                	jmp    96 <main+0x96>
  7d:	8d 76 00             	lea    0x0(%esi),%esi
    	{
		currentLine[value] = currentCharacter;
  80:	0f b6 95 25 f4 ff ff 	movzbl -0xbdb(%ebp),%edx
  87:	88 94 3d 18 f8 ff ff 	mov    %dl,-0x7e8(%ebp,%edi,1)
		value += 1;
  8e:	83 c7 01             	add    $0x1,%edi
	    // Check for newline character
        	if (currentCharacter == '\n') 
  91:	80 fa 0a             	cmp    $0xa,%dl
  94:	74 57                	je     ed <main+0xed>
    	while (read(fileDescriptor, &currentCharacter, 1) == 1)  // Read one character at a time from the file to compare the previous and current line
  96:	83 ec 04             	sub    $0x4,%esp
  99:	8d 85 25 f4 ff ff    	lea    -0xbdb(%ebp),%eax
  9f:	6a 01                	push   $0x1
  a1:	50                   	push   %eax
  a2:	53                   	push   %ebx
  a3:	e8 13 05 00 00       	call   5bb <read>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	83 f8 01             	cmp    $0x1,%eax
  ae:	74 d0                	je     80 <main+0x80>
			}	

		value = 0;
    		}
	}
	close(fileDescriptor);
  b0:	83 ec 0c             	sub    $0xc,%esp
  b3:	53                   	push   %ebx
  b4:	e8 12 05 00 00       	call   5cb <close>
    	exit(); 
  b9:	e8 e5 04 00 00       	call   5a3 <exit>
		inputFile = argv[2];
  be:	8b 5a 08             	mov    0x8(%edx),%ebx
		strcpy(cond,argv[1]);
  c1:	50                   	push   %eax
  c2:	50                   	push   %eax
  c3:	8d 85 26 f4 ff ff    	lea    -0xbda(%ebp),%eax
  c9:	56                   	push   %esi
		inputFile = argv[2];
  ca:	89 de                	mov    %ebx,%esi
		strcpy(cond,argv[1]);
  cc:	50                   	push   %eax
  cd:	e8 7e 02 00 00       	call   350 <strcpy>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	e9 57 ff ff ff       	jmp    31 <main+0x31>
		printf(1, "Error: Cannot open file %s\n", inputFile); 
  da:	50                   	push   %eax
  db:	56                   	push   %esi
  dc:	68 91 0a 00 00       	push   $0xa91
  e1:	6a 01                	push   $0x1
  e3:	e8 28 06 00 00       	call   710 <printf>
        	exit();
  e8:	e8 b6 04 00 00       	call   5a3 <exit>
	    		currentLine[value] = '\0'; // Null-terminate the current line
  ed:	89 c6                	mov    %eax,%esi
			if (strcmp(cond,"-i") == 0)
  ef:	8d 85 26 f4 ff ff    	lea    -0xbda(%ebp),%eax
	    		currentLine[value] = '\0'; // Null-terminate the current line
  f5:	c6 84 3d 18 f8 ff ff 	movb   $0x0,-0x7e8(%ebp,%edi,1)
  fc:	00 
			if (strcmp(cond,"-i") == 0)
  fd:	57                   	push   %edi
  fe:	57                   	push   %edi
  ff:	68 ad 0a 00 00       	push   $0xaad
 104:	50                   	push   %eax
 105:	e8 76 02 00 00       	call   380 <strcmp>
 10a:	83 c4 10             	add    $0x10,%esp
 10d:	85 c0                	test   %eax,%eax
 10f:	0f 84 fa 00 00 00    	je     20f <main+0x20f>
            		else if(strcmp(cond,"-d") == 0)
 115:	8d 85 26 f4 ff ff    	lea    -0xbda(%ebp),%eax
 11b:	51                   	push   %ecx
 11c:	51                   	push   %ecx
 11d:	68 b0 0a 00 00       	push   $0xab0
 122:	50                   	push   %eax
 123:	e8 58 02 00 00       	call   380 <strcmp>
 128:	83 c4 10             	add    $0x10,%esp
 12b:	89 c7                	mov    %eax,%edi
 12d:	85 c0                	test   %eax,%eax
 12f:	0f 84 84 00 00 00    	je     1b9 <main+0x1b9>
            		else if(strcmp(cond,"-c") == 0)
 135:	50                   	push   %eax
 136:	50                   	push   %eax
 137:	8d 85 26 f4 ff ff    	lea    -0xbda(%ebp),%eax
 13d:	68 b3 0a 00 00       	push   $0xab3
 142:	50                   	push   %eax
 143:	e8 38 02 00 00       	call   380 <strcmp>
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 85 3c 01 00 00    	jne    28f <main+0x28f>
                		if ((strcmp(previousLine,currentLine) == 0) || (strcmp(previousLine,"") == 0))
 153:	8d 95 30 f4 ff ff    	lea    -0xbd0(%ebp),%edx
 159:	50                   	push   %eax
 15a:	50                   	push   %eax
 15b:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 161:	50                   	push   %eax
 162:	52                   	push   %edx
 163:	89 95 10 f4 ff ff    	mov    %edx,-0xbf0(%ebp)
 169:	e8 12 02 00 00       	call   380 <strcmp>
 16e:	83 c4 10             	add    $0x10,%esp
 171:	8b 95 10 f4 ff ff    	mov    -0xbf0(%ebp),%edx
 177:	85 c0                	test   %eax,%eax
 179:	0f 85 5b 01 00 00    	jne    2da <main+0x2da>
                        		count++;
 17f:	8b b5 14 f4 ff ff    	mov    -0xbec(%ebp),%esi
 185:	83 c6 01             	add    $0x1,%esi
                		strcpy(previousLine, currentLine);
 188:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 18e:	57                   	push   %edi
 18f:	57                   	push   %edi
 190:	50                   	push   %eax
 191:	52                   	push   %edx
 192:	e8 b9 01 00 00       	call   350 <strcpy>
 197:	89 b5 14 f4 ff ff    	mov    %esi,-0xbec(%ebp)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	e9 d4 fe ff ff       	jmp    79 <main+0x79>
		printf(1, "Usage: %s <program_name> <inputFile.txt>\n", argv[0]);
 1a5:	50                   	push   %eax
 1a6:	ff 32                	push   (%edx)
 1a8:	68 38 0a 00 00       	push   $0xa38
 1ad:	6a 01                	push   $0x1
 1af:	e8 5c 05 00 00       	call   710 <printf>
		exit();
 1b4:	e8 ea 03 00 00       	call   5a3 <exit>
                		if (strcmp(previousLine,currentLine) == 0)
 1b9:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 1bf:	52                   	push   %edx
 1c0:	52                   	push   %edx
 1c1:	8d 95 30 f4 ff ff    	lea    -0xbd0(%ebp),%edx
 1c7:	50                   	push   %eax
 1c8:	52                   	push   %edx
 1c9:	89 95 10 f4 ff ff    	mov    %edx,-0xbf0(%ebp)
 1cf:	e8 ac 01 00 00       	call   380 <strcmp>
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	8b 95 10 f4 ff ff    	mov    -0xbf0(%ebp),%edx
 1dd:	85 c0                	test   %eax,%eax
 1df:	75 11                	jne    1f2 <main+0x1f2>
                        		++count;
 1e1:	8b 85 14 f4 ff ff    	mov    -0xbec(%ebp),%eax
 1e7:	8d 78 01             	lea    0x1(%eax),%edi
                            		if (count == 1)
 1ea:	85 c0                	test   %eax,%eax
 1ec:	0f 84 2d 01 00 00    	je     31f <main+0x31f>
                        	strcpy(previousLine,currentLine);
 1f2:	50                   	push   %eax
 1f3:	50                   	push   %eax
 1f4:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 1fa:	50                   	push   %eax
 1fb:	52                   	push   %edx
 1fc:	e8 4f 01 00 00       	call   350 <strcpy>
 201:	89 bd 14 f4 ff ff    	mov    %edi,-0xbec(%ebp)
 207:	83 c4 10             	add    $0x10,%esp
 20a:	e9 6a fe ff ff       	jmp    79 <main+0x79>
                    		strcpy(cmpLine, currentLine);
 20f:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 215:	56                   	push   %esi
 216:	56                   	push   %esi
 217:	8d b5 00 fc ff ff    	lea    -0x400(%ebp),%esi
 21d:	50                   	push   %eax
 21e:	56                   	push   %esi
 21f:	e8 2c 01 00 00       	call   350 <strcpy>
                    		for (int i = 0; cmpLine[i]!='\0'; i++)
 224:	0f b6 85 00 fc ff ff 	movzbl -0x400(%ebp),%eax
 22b:	83 c4 10             	add    $0x10,%esp
 22e:	89 f2                	mov    %esi,%edx
 230:	84 c0                	test   %al,%al
 232:	74 1c                	je     250 <main+0x250>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                        		if(cmpLine[i] >= 'A' && cmpLine[i] <= 'Z')
 238:	8d 48 bf             	lea    -0x41(%eax),%ecx
 23b:	80 f9 19             	cmp    $0x19,%cl
 23e:	77 05                	ja     245 <main+0x245>
			               		cmpLine[i] = cmpLine[i] + 32;
 240:	83 c0 20             	add    $0x20,%eax
 243:	88 02                	mov    %al,(%edx)
                    		for (int i = 0; cmpLine[i]!='\0'; i++)
 245:	0f b6 42 01          	movzbl 0x1(%edx),%eax
 249:	83 c2 01             	add    $0x1,%edx
 24c:	84 c0                	test   %al,%al
 24e:	75 e8                	jne    238 <main+0x238>
                    		if (strcmp(previousLine, cmpLine) != 0)
 250:	8d bd 30 f4 ff ff    	lea    -0xbd0(%ebp),%edi
 256:	51                   	push   %ecx
 257:	51                   	push   %ecx
 258:	56                   	push   %esi
 259:	57                   	push   %edi
 25a:	e8 21 01 00 00       	call   380 <strcmp>
 25f:	83 c4 10             	add    $0x10,%esp
 262:	85 c0                	test   %eax,%eax
 264:	0f 84 0f fe ff ff    	je     79 <main+0x79>
                        		printf(1,"%s", currentLine); //Displaying the unique line
 26a:	50                   	push   %eax
 26b:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 271:	50                   	push   %eax
 272:	68 b9 0a 00 00       	push   $0xab9
 277:	6a 01                	push   $0x1
 279:	e8 92 04 00 00       	call   710 <printf>
                        		strcpy(previousLine, cmpLine);
 27e:	58                   	pop    %eax
 27f:	5a                   	pop    %edx
 280:	56                   	push   %esi
 281:	57                   	push   %edi
 282:	e8 c9 00 00 00       	call   350 <strcpy>
 287:	83 c4 10             	add    $0x10,%esp
 28a:	e9 ea fd ff ff       	jmp    79 <main+0x79>
				if (strcmp(currentLine, previousLine) != 0)
 28f:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 295:	56                   	push   %esi
 296:	56                   	push   %esi
 297:	8d b5 30 f4 ff ff    	lea    -0xbd0(%ebp),%esi
 29d:	56                   	push   %esi
 29e:	50                   	push   %eax
 29f:	e8 dc 00 00 00       	call   380 <strcmp>
 2a4:	83 c4 10             	add    $0x10,%esp
 2a7:	85 c0                	test   %eax,%eax
 2a9:	0f 84 ca fd ff ff    	je     79 <main+0x79>
                			printf(1, "%s", currentLine); // Print the current line
 2af:	50                   	push   %eax
 2b0:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 2b6:	50                   	push   %eax
 2b7:	68 b9 0a 00 00       	push   $0xab9
 2bc:	6a 01                	push   $0x1
 2be:	e8 4d 04 00 00       	call   710 <printf>
                			strcpy(previousLine, currentLine); // Copy the current line to the previous line buffer
 2c3:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 2c9:	5a                   	pop    %edx
 2ca:	59                   	pop    %ecx
 2cb:	50                   	push   %eax
 2cc:	56                   	push   %esi
 2cd:	e8 7e 00 00 00       	call   350 <strcpy>
 2d2:	83 c4 10             	add    $0x10,%esp
 2d5:	e9 9f fd ff ff       	jmp    79 <main+0x79>
                		if ((strcmp(previousLine,currentLine) == 0) || (strcmp(previousLine,"") == 0))
 2da:	50                   	push   %eax
 2db:	50                   	push   %eax
 2dc:	68 ac 0a 00 00       	push   $0xaac
 2e1:	52                   	push   %edx
 2e2:	89 95 10 f4 ff ff    	mov    %edx,-0xbf0(%ebp)
 2e8:	e8 93 00 00 00       	call   380 <strcmp>
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	8b 95 10 f4 ff ff    	mov    -0xbf0(%ebp),%edx
 2f6:	85 c0                	test   %eax,%eax
 2f8:	0f 84 81 fe ff ff    	je     17f <main+0x17f>
                        		printf(1,"%d %s",count, previousLine);
 2fe:	52                   	push   %edx
 2ff:	ff b5 14 f4 ff ff    	push   -0xbec(%ebp)
 305:	68 b6 0a 00 00       	push   $0xab6
 30a:	6a 01                	push   $0x1
 30c:	e8 ff 03 00 00       	call   710 <printf>
 311:	8b 95 10 f4 ff ff    	mov    -0xbf0(%ebp),%edx
 317:	83 c4 10             	add    $0x10,%esp
 31a:	e9 69 fe ff ff       	jmp    188 <main+0x188>
                            			printf(1,"%s", currentLine);
 31f:	50                   	push   %eax
 320:	8d 85 18 f8 ff ff    	lea    -0x7e8(%ebp),%eax
 326:	50                   	push   %eax
 327:	68 b9 0a 00 00       	push   $0xab9
 32c:	6a 01                	push   $0x1
 32e:	89 95 14 f4 ff ff    	mov    %edx,-0xbec(%ebp)
 334:	e8 d7 03 00 00       	call   710 <printf>
 339:	8b 95 14 f4 ff ff    	mov    -0xbec(%ebp),%edx
 33f:	83 c4 10             	add    $0x10,%esp
 342:	e9 ab fe ff ff       	jmp    1f2 <main+0x1f2>
 347:	66 90                	xchg   %ax,%ax
 349:	66 90                	xchg   %ax,%ax
 34b:	66 90                	xchg   %ax,%ax
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 350:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 351:	31 c0                	xor    %eax,%eax
{
 353:	89 e5                	mov    %esp,%ebp
 355:	53                   	push   %ebx
 356:	8b 4d 08             	mov    0x8(%ebp),%ecx
 359:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 360:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 364:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 367:	83 c0 01             	add    $0x1,%eax
 36a:	84 d2                	test   %dl,%dl
 36c:	75 f2                	jne    360 <strcpy+0x10>
    ;
  return os;
}
 36e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 371:	89 c8                	mov    %ecx,%eax
 373:	c9                   	leave  
 374:	c3                   	ret    
 375:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
 387:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 38a:	0f b6 02             	movzbl (%edx),%eax
 38d:	84 c0                	test   %al,%al
 38f:	75 17                	jne    3a8 <strcmp+0x28>
 391:	eb 3a                	jmp    3cd <strcmp+0x4d>
 393:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 397:	90                   	nop
 398:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 39c:	83 c2 01             	add    $0x1,%edx
 39f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3a2:	84 c0                	test   %al,%al
 3a4:	74 1a                	je     3c0 <strcmp+0x40>
    p++, q++;
 3a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3a8:	0f b6 19             	movzbl (%ecx),%ebx
 3ab:	38 c3                	cmp    %al,%bl
 3ad:	74 e9                	je     398 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3af:	29 d8                	sub    %ebx,%eax
}
 3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3c4:	31 c0                	xor    %eax,%eax
 3c6:	29 d8                	sub    %ebx,%eax
}
 3c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3cd:	0f b6 19             	movzbl (%ecx),%ebx
 3d0:	31 c0                	xor    %eax,%eax
 3d2:	eb db                	jmp    3af <strcmp+0x2f>
 3d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <strlen>:

uint
strlen(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3e6:	80 3a 00             	cmpb   $0x0,(%edx)
 3e9:	74 15                	je     400 <strlen+0x20>
 3eb:	31 c0                	xor    %eax,%eax
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
 3f0:	83 c0 01             	add    $0x1,%eax
 3f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3f7:	89 c1                	mov    %eax,%ecx
 3f9:	75 f5                	jne    3f0 <strlen+0x10>
    ;
  return n;
}
 3fb:	89 c8                	mov    %ecx,%eax
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    
 3ff:	90                   	nop
  for(n = 0; s[n]; n++)
 400:	31 c9                	xor    %ecx,%ecx
}
 402:	5d                   	pop    %ebp
 403:	89 c8                	mov    %ecx,%eax
 405:	c3                   	ret    
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <memset>:

void*
memset(void *dst, int c, uint n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 417:	8b 4d 10             	mov    0x10(%ebp),%ecx
 41a:	8b 45 0c             	mov    0xc(%ebp),%eax
 41d:	89 d7                	mov    %edx,%edi
 41f:	fc                   	cld    
 420:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 422:	8b 7d fc             	mov    -0x4(%ebp),%edi
 425:	89 d0                	mov    %edx,%eax
 427:	c9                   	leave  
 428:	c3                   	ret    
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <strchr>:

char*
strchr(const char *s, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43a:	0f b6 10             	movzbl (%eax),%edx
 43d:	84 d2                	test   %dl,%dl
 43f:	75 12                	jne    453 <strchr+0x23>
 441:	eb 1d                	jmp    460 <strchr+0x30>
 443:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 447:	90                   	nop
 448:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 44c:	83 c0 01             	add    $0x1,%eax
 44f:	84 d2                	test   %dl,%dl
 451:	74 0d                	je     460 <strchr+0x30>
    if(*s == c)
 453:	38 d1                	cmp    %dl,%cl
 455:	75 f1                	jne    448 <strchr+0x18>
      return (char*)s;
  return 0;
}
 457:	5d                   	pop    %ebp
 458:	c3                   	ret    
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 460:	31 c0                	xor    %eax,%eax
}
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 475:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 478:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 479:	31 db                	xor    %ebx,%ebx
{
 47b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 47e:	eb 27                	jmp    4a7 <gets+0x37>
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	6a 01                	push   $0x1
 485:	57                   	push   %edi
 486:	6a 00                	push   $0x0
 488:	e8 2e 01 00 00       	call   5bb <read>
    if(cc < 1)
 48d:	83 c4 10             	add    $0x10,%esp
 490:	85 c0                	test   %eax,%eax
 492:	7e 1d                	jle    4b1 <gets+0x41>
      break;
    buf[i++] = c;
 494:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 498:	8b 55 08             	mov    0x8(%ebp),%edx
 49b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 49f:	3c 0a                	cmp    $0xa,%al
 4a1:	74 1d                	je     4c0 <gets+0x50>
 4a3:	3c 0d                	cmp    $0xd,%al
 4a5:	74 19                	je     4c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4a7:	89 de                	mov    %ebx,%esi
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4af:	7c cf                	jl     480 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bb:	5b                   	pop    %ebx
 4bc:	5e                   	pop    %esi
 4bd:	5f                   	pop    %edi
 4be:	5d                   	pop    %ebp
 4bf:	c3                   	ret    
  buf[i] = '\0';
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	89 de                	mov    %ebx,%esi
 4c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cc:	5b                   	pop    %ebx
 4cd:	5e                   	pop    %esi
 4ce:	5f                   	pop    %edi
 4cf:	5d                   	pop    %ebp
 4d0:	c3                   	ret    
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	6a 00                	push   $0x0
 4ea:	ff 75 08             	push   0x8(%ebp)
 4ed:	e8 f1 00 00 00       	call   5e3 <open>
  if(fd < 0)
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	85 c0                	test   %eax,%eax
 4f7:	78 27                	js     520 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4f9:	83 ec 08             	sub    $0x8,%esp
 4fc:	ff 75 0c             	push   0xc(%ebp)
 4ff:	89 c3                	mov    %eax,%ebx
 501:	50                   	push   %eax
 502:	e8 f4 00 00 00       	call   5fb <fstat>
  close(fd);
 507:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50a:	89 c6                	mov    %eax,%esi
  close(fd);
 50c:	e8 ba 00 00 00       	call   5cb <close>
  return r;
 511:	83 c4 10             	add    $0x10,%esp
}
 514:	8d 65 f8             	lea    -0x8(%ebp),%esp
 517:	89 f0                	mov    %esi,%eax
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 520:	be ff ff ff ff       	mov    $0xffffffff,%esi
 525:	eb ed                	jmp    514 <stat+0x34>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 537:	0f be 02             	movsbl (%edx),%eax
 53a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 53d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 540:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 545:	77 1e                	ja     565 <atoi+0x35>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 568:	89 c8                	mov    %ecx,%eax
 56a:	c9                   	leave  
 56b:	c3                   	ret    
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	8b 45 10             	mov    0x10(%ebp),%eax
 577:	8b 55 08             	mov    0x8(%ebp),%edx
 57a:	56                   	push   %esi
 57b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 57e:	85 c0                	test   %eax,%eax
 580:	7e 13                	jle    595 <memmove+0x25>
 582:	01 d0                	add    %edx,%eax
  dst = vdst;
 584:	89 d7                	mov    %edx,%edi
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    

0000059b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 59b:	b8 01 00 00 00       	mov    $0x1,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <exit>:
SYSCALL(exit)
 5a3:	b8 02 00 00 00       	mov    $0x2,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <wait>:
SYSCALL(wait)
 5ab:	b8 03 00 00 00       	mov    $0x3,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <pipe>:
SYSCALL(pipe)
 5b3:	b8 04 00 00 00       	mov    $0x4,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <read>:
SYSCALL(read)
 5bb:	b8 05 00 00 00       	mov    $0x5,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <write>:
SYSCALL(write)
 5c3:	b8 10 00 00 00       	mov    $0x10,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <close>:
SYSCALL(close)
 5cb:	b8 15 00 00 00       	mov    $0x15,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <kill>:
SYSCALL(kill)
 5d3:	b8 06 00 00 00       	mov    $0x6,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <exec>:
SYSCALL(exec)
 5db:	b8 07 00 00 00       	mov    $0x7,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <open>:
SYSCALL(open)
 5e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <mknod>:
SYSCALL(mknod)
 5eb:	b8 11 00 00 00       	mov    $0x11,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <unlink>:
SYSCALL(unlink)
 5f3:	b8 12 00 00 00       	mov    $0x12,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <fstat>:
SYSCALL(fstat)
 5fb:	b8 08 00 00 00       	mov    $0x8,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <link>:
SYSCALL(link)
 603:	b8 13 00 00 00       	mov    $0x13,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <mkdir>:
SYSCALL(mkdir)
 60b:	b8 14 00 00 00       	mov    $0x14,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <chdir>:
SYSCALL(chdir)
 613:	b8 09 00 00 00       	mov    $0x9,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <dup>:
SYSCALL(dup)
 61b:	b8 0a 00 00 00       	mov    $0xa,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <getpid>:
SYSCALL(getpid)
 623:	b8 0b 00 00 00       	mov    $0xb,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <sbrk>:
SYSCALL(sbrk)
 62b:	b8 0c 00 00 00       	mov    $0xc,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <sleep>:
SYSCALL(sleep)
 633:	b8 0d 00 00 00       	mov    $0xd,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <uptime>:
SYSCALL(uptime)
 63b:	b8 0e 00 00 00       	mov    $0xe,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <ps>:
//SYSCALL(aba)
//SYSCALL(readtextfile)
//SYSCALL(head1)
//SYSCALL(uniq1)

SYSCALL(ps)
 643:	b8 16 00 00 00       	mov    $0x16,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <procstat>:
SYSCALL(procstat)
 64b:	b8 17 00 00 00       	mov    $0x17,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <custmpro>:
SYSCALL(custmpro)
 653:	b8 18 00 00 00       	mov    $0x18,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    
 65b:	66 90                	xchg   %ax,%ax
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 3c             	sub    $0x3c,%esp
 669:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 66c:	89 d1                	mov    %edx,%ecx
{
 66e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 671:	85 d2                	test   %edx,%edx
 673:	0f 89 7f 00 00 00    	jns    6f8 <printint+0x98>
 679:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 67d:	74 79                	je     6f8 <printint+0x98>
    neg = 1;
 67f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 686:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 688:	31 db                	xor    %ebx,%ebx
 68a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 c8                	mov    %ecx,%eax
 692:	31 d2                	xor    %edx,%edx
 694:	89 cf                	mov    %ecx,%edi
 696:	f7 75 c4             	divl   -0x3c(%ebp)
 699:	0f b6 92 1c 0b 00 00 	movzbl 0xb1c(%edx),%edx
 6a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6a3:	89 d8                	mov    %ebx,%eax
 6a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6b1:	76 dd                	jbe    690 <printint+0x30>
  if(neg)
 6b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6b6:	85 c9                	test   %ecx,%ecx
 6b8:	74 0c                	je     6c6 <printint+0x66>
    buf[i++] = '-';
 6ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6cd:	eb 07                	jmp    6d6 <printint+0x76>
 6cf:	90                   	nop
    putc(fd, buf[i]);
 6d0:	0f b6 13             	movzbl (%ebx),%edx
 6d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6d6:	83 ec 04             	sub    $0x4,%esp
 6d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6dc:	6a 01                	push   $0x1
 6de:	56                   	push   %esi
 6df:	57                   	push   %edi
 6e0:	e8 de fe ff ff       	call   5c3 <write>
  while(--i >= 0)
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	39 de                	cmp    %ebx,%esi
 6ea:	75 e4                	jne    6d0 <printint+0x70>
}
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ef:	5b                   	pop    %ebx
 6f0:	5e                   	pop    %esi
 6f1:	5f                   	pop    %edi
 6f2:	5d                   	pop    %ebp
 6f3:	c3                   	ret    
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6ff:	eb 87                	jmp    688 <printint+0x28>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop

00000710 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 719:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 71c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 71f:	0f b6 13             	movzbl (%ebx),%edx
 722:	84 d2                	test   %dl,%dl
 724:	74 6a                	je     790 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 726:	8d 45 10             	lea    0x10(%ebp),%eax
 729:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 72c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 72f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 731:	89 45 d0             	mov    %eax,-0x30(%ebp)
 734:	eb 36                	jmp    76c <printf+0x5c>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
 740:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 743:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 748:	83 f8 25             	cmp    $0x25,%eax
 74b:	74 15                	je     762 <printf+0x52>
  write(fd, &c, 1);
 74d:	83 ec 04             	sub    $0x4,%esp
 750:	88 55 e7             	mov    %dl,-0x19(%ebp)
 753:	6a 01                	push   $0x1
 755:	57                   	push   %edi
 756:	56                   	push   %esi
 757:	e8 67 fe ff ff       	call   5c3 <write>
 75c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 75f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 762:	0f b6 13             	movzbl (%ebx),%edx
 765:	83 c3 01             	add    $0x1,%ebx
 768:	84 d2                	test   %dl,%dl
 76a:	74 24                	je     790 <printf+0x80>
    c = fmt[i] & 0xff;
 76c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 76f:	85 c9                	test   %ecx,%ecx
 771:	74 cd                	je     740 <printf+0x30>
      }
    } else if(state == '%'){
 773:	83 f9 25             	cmp    $0x25,%ecx
 776:	75 ea                	jne    762 <printf+0x52>
      if(c == 'd'){
 778:	83 f8 25             	cmp    $0x25,%eax
 77b:	0f 84 07 01 00 00    	je     888 <printf+0x178>
 781:	83 e8 63             	sub    $0x63,%eax
 784:	83 f8 15             	cmp    $0x15,%eax
 787:	77 17                	ja     7a0 <printf+0x90>
 789:	ff 24 85 c4 0a 00 00 	jmp    *0xac4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 790:	8d 65 f4             	lea    -0xc(%ebp),%esp
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
  write(fd, &c, 1);
 7a0:	83 ec 04             	sub    $0x4,%esp
 7a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 7a6:	6a 01                	push   $0x1
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7ae:	e8 10 fe ff ff       	call   5c3 <write>
        putc(fd, c);
 7b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7b7:	83 c4 0c             	add    $0xc,%esp
 7ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7bd:	6a 01                	push   $0x1
 7bf:	57                   	push   %edi
 7c0:	56                   	push   %esi
 7c1:	e8 fd fd ff ff       	call   5c3 <write>
        putc(fd, c);
 7c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7c9:	31 c9                	xor    %ecx,%ecx
 7cb:	eb 95                	jmp    762 <printf+0x52>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7d8:	6a 00                	push   $0x0
 7da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	89 f0                	mov    %esi,%eax
 7e1:	e8 7a fe ff ff       	call   660 <printint>
        ap++;
 7e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7ed:	31 c9                	xor    %ecx,%ecx
 7ef:	e9 6e ff ff ff       	jmp    762 <printf+0x52>
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7fb:	8b 10                	mov    (%eax),%edx
        ap++;
 7fd:	83 c0 04             	add    $0x4,%eax
 800:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 803:	85 d2                	test   %edx,%edx
 805:	0f 84 8d 00 00 00    	je     898 <printf+0x188>
        while(*s != 0){
 80b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 80e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 810:	84 c0                	test   %al,%al
 812:	0f 84 4a ff ff ff    	je     762 <printf+0x52>
 818:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 81b:	89 d3                	mov    %edx,%ebx
 81d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
          s++;
 823:	83 c3 01             	add    $0x1,%ebx
 826:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 829:	6a 01                	push   $0x1
 82b:	57                   	push   %edi
 82c:	56                   	push   %esi
 82d:	e8 91 fd ff ff       	call   5c3 <write>
        while(*s != 0){
 832:	0f b6 03             	movzbl (%ebx),%eax
 835:	83 c4 10             	add    $0x10,%esp
 838:	84 c0                	test   %al,%al
 83a:	75 e4                	jne    820 <printf+0x110>
      state = 0;
 83c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 83f:	31 c9                	xor    %ecx,%ecx
 841:	e9 1c ff ff ff       	jmp    762 <printf+0x52>
 846:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 0a 00 00 00       	mov    $0xa,%ecx
 858:	6a 01                	push   $0x1
 85a:	e9 7b ff ff ff       	jmp    7da <printf+0xca>
 85f:	90                   	nop
        putc(fd, *ap);
 860:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 863:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 866:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 868:	6a 01                	push   $0x1
 86a:	57                   	push   %edi
 86b:	56                   	push   %esi
        putc(fd, *ap);
 86c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 86f:	e8 4f fd ff ff       	call   5c3 <write>
        ap++;
 874:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 878:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87b:	31 c9                	xor    %ecx,%ecx
 87d:	e9 e0 fe ff ff       	jmp    762 <printf+0x52>
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 888:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 88b:	83 ec 04             	sub    $0x4,%esp
 88e:	e9 2a ff ff ff       	jmp    7bd <printf+0xad>
 893:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 897:	90                   	nop
          s = "(null)";
 898:	ba bc 0a 00 00       	mov    $0xabc,%edx
        while(*s != 0){
 89d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8a0:	b8 28 00 00 00       	mov    $0x28,%eax
 8a5:	89 d3                	mov    %edx,%ebx
 8a7:	e9 74 ff ff ff       	jmp    820 <printf+0x110>
 8ac:	66 90                	xchg   %ax,%ax
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	a1 d0 0d 00 00       	mov    0xdd0,%eax
{
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8c8:	89 c2                	mov    %eax,%edx
 8ca:	8b 00                	mov    (%eax),%eax
 8cc:	39 ca                	cmp    %ecx,%edx
 8ce:	73 30                	jae    900 <free+0x50>
 8d0:	39 c1                	cmp    %eax,%ecx
 8d2:	72 04                	jb     8d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	39 c2                	cmp    %eax,%edx
 8d6:	72 f0                	jb     8c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8de:	39 f8                	cmp    %edi,%eax
 8e0:	74 30                	je     912 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8e5:	8b 42 04             	mov    0x4(%edx),%eax
 8e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8eb:	39 f1                	cmp    %esi,%ecx
 8ed:	74 3a                	je     929 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8f1:	5b                   	pop    %ebx
  freep = p;
 8f2:	89 15 d0 0d 00 00    	mov    %edx,0xdd0
}
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret    
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 900:	39 c2                	cmp    %eax,%edx
 902:	72 c4                	jb     8c8 <free+0x18>
 904:	39 c1                	cmp    %eax,%ecx
 906:	73 c0                	jae    8c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 908:	8b 73 fc             	mov    -0x4(%ebx),%esi
 90b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 90e:	39 f8                	cmp    %edi,%eax
 910:	75 d0                	jne    8e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 912:	03 70 04             	add    0x4(%eax),%esi
 915:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 918:	8b 02                	mov    (%edx),%eax
 91a:	8b 00                	mov    (%eax),%eax
 91c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 91f:	8b 42 04             	mov    0x4(%edx),%eax
 922:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 925:	39 f1                	cmp    %esi,%ecx
 927:	75 c6                	jne    8ef <free+0x3f>
    p->s.size += bp->s.size;
 929:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 92c:	89 15 d0 0d 00 00    	mov    %edx,0xdd0
    p->s.size += bp->s.size;
 932:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 935:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 938:	89 0a                	mov    %ecx,(%edx)
}
 93a:	5b                   	pop    %ebx
 93b:	5e                   	pop    %esi
 93c:	5f                   	pop    %edi
 93d:	5d                   	pop    %ebp
 93e:	c3                   	ret    
 93f:	90                   	nop

00000940 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	57                   	push   %edi
 944:	56                   	push   %esi
 945:	53                   	push   %ebx
 946:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 949:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 94c:	8b 3d d0 0d 00 00    	mov    0xdd0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 952:	8d 70 07             	lea    0x7(%eax),%esi
 955:	c1 ee 03             	shr    $0x3,%esi
 958:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 95b:	85 ff                	test   %edi,%edi
 95d:	0f 84 9d 00 00 00    	je     a00 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 963:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 965:	8b 4a 04             	mov    0x4(%edx),%ecx
 968:	39 f1                	cmp    %esi,%ecx
 96a:	73 6a                	jae    9d6 <malloc+0x96>
 96c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 971:	39 de                	cmp    %ebx,%esi
 973:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 976:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 97d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 980:	eb 17                	jmp    999 <malloc+0x59>
 982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 988:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 98a:	8b 48 04             	mov    0x4(%eax),%ecx
 98d:	39 f1                	cmp    %esi,%ecx
 98f:	73 4f                	jae    9e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 991:	8b 3d d0 0d 00 00    	mov    0xdd0,%edi
 997:	89 c2                	mov    %eax,%edx
 999:	39 d7                	cmp    %edx,%edi
 99b:	75 eb                	jne    988 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 99d:	83 ec 0c             	sub    $0xc,%esp
 9a0:	ff 75 e4             	push   -0x1c(%ebp)
 9a3:	e8 83 fc ff ff       	call   62b <sbrk>
  if(p == (char*)-1)
 9a8:	83 c4 10             	add    $0x10,%esp
 9ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ae:	74 1c                	je     9cc <malloc+0x8c>
  hp->s.size = nu;
 9b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9b3:	83 ec 0c             	sub    $0xc,%esp
 9b6:	83 c0 08             	add    $0x8,%eax
 9b9:	50                   	push   %eax
 9ba:	e8 f1 fe ff ff       	call   8b0 <free>
  return freep;
 9bf:	8b 15 d0 0d 00 00    	mov    0xdd0,%edx
      if((p = morecore(nunits)) == 0)
 9c5:	83 c4 10             	add    $0x10,%esp
 9c8:	85 d2                	test   %edx,%edx
 9ca:	75 bc                	jne    988 <malloc+0x48>
        return 0;
  }
}
 9cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9cf:	31 c0                	xor    %eax,%eax
}
 9d1:	5b                   	pop    %ebx
 9d2:	5e                   	pop    %esi
 9d3:	5f                   	pop    %edi
 9d4:	5d                   	pop    %ebp
 9d5:	c3                   	ret    
    if(p->s.size >= nunits){
 9d6:	89 d0                	mov    %edx,%eax
 9d8:	89 fa                	mov    %edi,%edx
 9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9e0:	39 ce                	cmp    %ecx,%esi
 9e2:	74 4c                	je     a30 <malloc+0xf0>
        p->s.size -= nunits;
 9e4:	29 f1                	sub    %esi,%ecx
 9e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9ef:	89 15 d0 0d 00 00    	mov    %edx,0xdd0
}
 9f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9f8:	83 c0 08             	add    $0x8,%eax
}
 9fb:	5b                   	pop    %ebx
 9fc:	5e                   	pop    %esi
 9fd:	5f                   	pop    %edi
 9fe:	5d                   	pop    %ebp
 9ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a00:	c7 05 d0 0d 00 00 d4 	movl   $0xdd4,0xdd0
 a07:	0d 00 00 
    base.s.size = 0;
 a0a:	bf d4 0d 00 00       	mov    $0xdd4,%edi
    base.s.ptr = freep = prevp = &base;
 a0f:	c7 05 d4 0d 00 00 d4 	movl   $0xdd4,0xdd4
 a16:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a19:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a1b:	c7 05 d8 0d 00 00 00 	movl   $0x0,0xdd8
 a22:	00 00 00 
    if(p->s.size >= nunits){
 a25:	e9 42 ff ff ff       	jmp    96c <malloc+0x2c>
 a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a30:	8b 08                	mov    (%eax),%ecx
 a32:	89 0a                	mov    %ecx,(%edx)
 a34:	eb b9                	jmp    9ef <malloc+0xaf>
