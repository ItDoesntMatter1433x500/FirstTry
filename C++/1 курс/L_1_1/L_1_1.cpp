// L_1_1.cpp : Defines the entry point for the console application.
//


#include "stdafx.h"
#include "math.h"
#include "conio.h"
float a,b,c,p,s;


int main()
{
	printf("Vvedite a, b, c: \n");

	scanf("%f%f%f",&a,&b,&c);

	p=(a+b+c)/2.f;

	s=sqrt(p*(p-a)*(p-b)*(p-c));

	printf("Pri A=%6.2f, B=%6.2f, C=%6.2f. \nI ploshcad' = %6.2f. ",a,b,c,s);
	
	getch();

	return 0;
}