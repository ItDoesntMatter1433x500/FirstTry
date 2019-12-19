#include "stdafx.h"
#include "conio.h"
#include "math.h"

int main()
{
	double a=-10, b=20, y, max, maxx, e1, e2;

	int k=0;

	printf("\n Vvedite Eps1 i Eps2: ");

	scanf("%lf%lf", &e1,&e2);

	printf("\n\n Tochki peregiba: \n");

	max=(a-1)*(a-1)*log(4.)*sin(2*a);

	while ((b-a)>e1)
	{
		y=(a-1)*(a-1)*log(4.)*sin(2*a);

		if (y<e2)
		{
			k+=1;
			printf(" %4.1lf",a);
		}
		else if (y>max)
				{
					max=y;
					maxx=a;
				}

		a+=e1;
	}

	printf("\n\n Vsego %4d tochek peregiba i max=%5.2lf",k,maxx);

	getch();

	return 0;
}