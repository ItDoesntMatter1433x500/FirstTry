#include "stdafx.h"
#include "math.h"
#include "conio.h"

int main()
{
	double e, y1, y2, x, h, abs, otn, x1;

	int n=1;

	printf("\n Vvedite X, Eps: \n");

	scanf("%lf%lf", &x, &e);

	y1=(exp(x)-exp(-x))/2.;

	y2=0;
	
	h=x;

	x1=x*x;

	do
	{

	n+=2;

	y2+=h;

	h=h*x1/(n*(n-1));

	}while(fabs(h)>e);

	abs=fabs(y1-y2);

	otn=fabs((y1-y2)/y1);

	printf("\n\n Y1=%10.7lf; Y2=%10.7lf, ABS=%10.7lf, OTN=%10.7lf ", y1, y2, abs, otn);

	getch();
	return 0;
}