#include "stdafx.h"
#include "math.h"
#include "conio.h"


int main()
{
	float x,y1,y2;
	x=0;
	y1=0;
	y2=0;

	printf("\n\n Vvedite X: ");
	scanf("%f",&x);

	if (x<-1) 
		y1=0;
	else if (x<0)
			y1=x+1;
		 else if (x<1)
			y1=x;
			  else y1=0;
	


	if ((x<-1)||(x>=1)) 
		y2=0;
	if ((x>=-1)&&(x<0))
		y2=x+1;
	if ((x>=0)&&(x<1))
		y2=x;

	printf("\n Pri X=%5.2f  Y1=%5.2f  Y2=%5.2f",x,y1,y2);

	getch();

	return 0;
}
