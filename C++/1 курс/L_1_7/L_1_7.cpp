#include "stdafx.h"
#include "math.h"
#include "conio.h"


int main()
{
	const int nn=25;

	float D[nn], F[nn], s=0, p=1, srarifm, srgeom;

	int n, i, j=0;

	printf("\n Vvedite kol-vo elementov: ");
	scanf("%d",&n);

	for (i=0; i<n; i++)
	{
		scanf("%f",&D[i]);
		s+=fabs(D[i]);
		p*=fabs(D[i]);
	}
	srarifm=s/n;

	srgeom=powf(p, 1./n);

	for (i=0; i<n; i++)
	{
		if ((D[i]<srarifm)&&(D[i]>srgeom))
		{
			F[j]=D[i];

			j++;
		}
	}
	

	for (i=0; i<n; i++)
	{
		printf(" %5.2lf", D[i]);
	}

	printf("\n\n");
    i=0;
	while (i<j)
	{
		printf(" %5.2lf", F[i]);

		i++;
	}

	printf(" Sr.Arifm.=%6.3lf, Sr.Geom.=%6.3lf", srarifm, srgeom);

	getch();



	return 0;
}