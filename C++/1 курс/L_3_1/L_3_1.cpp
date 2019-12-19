#include "stdafx.h"
#include "math.h"
#include "conio.h"

const int nn=12, mm=14;
int n,m;

float f1(float D[][mm], int stolb, int str)
{
	float num=1;
	while((num>=0) && (stolb>=0))
	{
		if (*(D+str*nn+stolb)<0)
			num=*(D+str*nn+stolb);
		stolb--;
	}
	return num;
}

int main()
{
	float D[nn][mm], P[nn];
	bool f=false;

	printf("\n Vvedite kol-vo strok i stolbcov: ");
	scanf("%d%d", &n, &m);
	printf("\n\n  Vvedite matricu:\n\n");
	for (int i=0; i<n; i++)
		for (int j=0; j<m; j++)
			scanf("%f",&D[i][j]);

   for (int i=0, j=0; i<n; i++)
   {
	   P[j]=f1(D, m, n);
	   j++;
   }

   for (int i=0; i<m-1; i++)
   {
	   float min=1e10;
	   for (int j=i; j<m; j++)
		   if (min<P[i])
			   min=P[i];
	   P[i]=min;
	   printf(" %5.2f ", P[i]);
   }

	getch();
	return 0;
}