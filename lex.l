%{

typedef enum {
    Word = 0,
    Number = 1
} Token;

%}

%option noyywrap

WORD [a-zA-Z0-9\/\.-]+
DIGIT           [0-9]
MANTISSA        ({DIGIT}+\.?{DIGIT}*|\.{DIGIT}+)
EXPONENT        ([Ee][+-]?{DIGIT}+)
NUMBER          ({MANTISSA}{EXPONENT}?)
%%


{NUMBER} { return Number;}
{WORD}  { return Word;}

%%

void flex_cleanup(void) {
    yy_delete_buffer(YY_CURRENT_BUFFER);
}

