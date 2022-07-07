#include <stdio.h>

int sum(int a[], unsigned len){
	int i, sum = 0;
	for ( i =0; i<=len-1; i++)
		sum += a[i];
	return sum;
}

int main()
{
//	int arr[] = { 1, 2, 3};
//	int ret = sum(arr,0);
//	printf("sum = %d\n", ret);
	
	unsigned len = 0;
	int i;
	for(i=0;i<=len-1;i++)
		printf("%d\n",i);

	return 0;
}
