#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int sort(int, int*);
int main(){
    int size, vetor[10];
    int i=0;
    printf("Digite o tamanho do vetor(0<n<=10):");
    scanf("%d",&size);
    if (size>10|| size<1){
        printf("Tamanho fora do intervalo estabelecido");
        return 1;
    }
    for (i=0; i<size;i++){
        printf("Digite o valor da posição %d do vetor:",i);
        scanf("%d", &vetor[i]);
    }
    
    sort(size-1, vetor);
    printf("Vetor ordenado: ");
    for (i=0; i<size;i++){
        printf("%d ",vetor[i]);
    }
    
    printf("\n");
    return 0;
}