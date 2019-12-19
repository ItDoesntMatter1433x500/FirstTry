#include "stdafx.h"
#include "math.h"
#include "conio.h"

int main()
{
	const int mm=11, nn=13;
	float A[mm][nn];
	int m, n, maxj;

	printf("\n Vvedite kol-vo strok i stolbcov: ");
	scanf("%d%d", &m, &n);

	printf("\n\n Vvedite massiv\n\n");

	for (int i=0; i<m; i++) {
		for (int j=0; j<m; j++){ 
			scanf("%f", &A[i][j]);}}

	printf("\n\n Konechnii massiv:\n\n");


	for (int i=0; i<m; i++) 
	{
		 float max=-1e34, s1=0, s2=0;

		for (int j=0; j<n; j++)
		{ 
			printf(" %4.1f ", A[i][j]);
				if (A[i][j]>max)
				{
					max=A[i][j];
					maxj=j;
				}
		}
		if (maxj!=0)
		for (int j=0; j<maxj; j++)
			s1+=A[i][j];

		if (maxj!=n-1)
		for (int j=maxj+1; j<n; j++)
			s2+=A[i][j];

		printf(" Nom=%3d, SumDo=%4.1f, SumPo=%4.1f\n", maxj, s1, s2);
	}


	 getch();
	return 0;
}

