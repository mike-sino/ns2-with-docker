BEGIN{
	requests=0;
	frequency=0;
}
{
	id=$5;
	source_ip=$57;
	if(($1=="s")&&($61=="REQUEST")&&(id==source_ip))
	{requests++;}
}
END{
	frequency=requests/300;
	printf("Routing arouse frequency: %.4f\n",frequency);
}
