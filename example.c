#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int yylex(void);

#define KGRN  "\x1B[32m"
#define KCYN  "\x1B[36m"
#define RESET "\033[0m"

#define WORD 0
#define NUMBER 1

void init_prompt(void){
	int token_retrieved;
	printf("%sType in a number or a variable name\n", KCYN);
	printf("%s", KGRN);
	
	token_retrieved = yylex();
	if(token_retrieved == WORD){
		printf("Found a word. Code: %d\n",token_retrieved);
	}else if(token_retrieved == NUMBER){
		printf("Found a number. Code: %d\n",token_retrieved);
	}
	printf("%s", RESET);
}

int main(){
	init_prompt();
}
