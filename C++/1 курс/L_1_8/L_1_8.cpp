#include "stdafx.h"
#include "math.h"
#include "conio.h"

int main()
{
	const int nn=12;
	float X[nn], p;
	int n;
	

	printf("\n Vvedite kol-vo elementov massiva: ");
	scanf("%d", &n);

	printf("\n Vvedite massiv: \n");

	for (int i=0; i<n; i++)
		scanf("%f", &X[i]);

	int k=1;
	bool f=true;

	while(f)
	{
		f=false;
		for(int i=n-2; i>=0-1+k; i--)
	if (X[i]>X[i+1])
		{
			p=X[i];
			X[i]=X[i+1];
			X[i+1]=p;
			f=true;
		}
	printf("\n");
	for (int i=0; i<n; i++)
		printf(" %5.2f ", X[i]);
	k++;
	}
	printf("\n Konechnii massiv\n");

	for (int i=0; i<n; i++)
		printf(" %5.2f ", X[i]);

getch();
return 0;
}