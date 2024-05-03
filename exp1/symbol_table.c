#include<stdio.h>
#include<string.h>

int main(){
   char exp[50];
   scanf("%[^\n]s",&exp);
   printf(" expression : %s\n",exp);

   char * token = strtok(exp, " ");

   int i=0;
   // loop through the string to extract all other tokens
   while( token != NULL ) {
      if((token[0]>=65 && token[0] <=90)|| (token[0]>=97 && token[0] <=122)){
         printf("\n%s is a identifier\n",token);
      }
      else if(token[0]==43 || token[0]==42 || token[0]==45 || token[0]==47){
          printf("\n%s is a arithmetic operator\n",token);
      }
      else if (token[0]>=48 && token[0]<=57 ){
         printf("\n%s is a constant\n",token);
      }
      else if (token[0]=='='){
         printf("\n%s is a assignment operator\n",token);
      }
      token = strtok(NULL, " ");
   }


   

   return 0;
}