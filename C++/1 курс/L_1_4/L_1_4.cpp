#include "stdafx.h"
#include "math.h"
#include "conio.h"

int main()
{
	float x,x1,x2,x3,y1,y2,y3,y4,y5;

	x=1;

	printf("\n #         X           Y1           Y2            Y3          Y4           Y5\n");

	for (int i=1; i<=7; i++)
	{
		x1=x/2;

		x2=x/4;

		x3=3*x/6;

		y1=sqrt(1+x);

		y2=1+x1*(1-x2*(1-x3*(1-5*x/8)));

		y3=1+x/2-x*x/(2*4)+3*x*x*x/(2*4*6)-3*5*x*x*x*x/(2*4*6*8);

		y4=fabs(y1-y2);

		y5=fabs((y1-y2)/y1);

		printf("\n %d    %9.6f    %9.6f    %9.6f    %9.6f    %9.6f %12.9f\n",i,x,y1,y2,y3,y4,y5);

		x*=0.5;
		
	}

	getch();
	return 0;
}