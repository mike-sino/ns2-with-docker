# getData.awk

BEGIN {
	if(step ==0)
		step = 10;
	base = 0;
	start = 0;
	bytes = 0;
	total_bytes = 0;
	max = 0;
	calc = 0;

}

$0 ~/^s.* AGT/ {
	if (base == 0 && $3 == ("_" src "_")) {
		base = $2;
		start = $2;
		calc = 1;
	}
}

$0 ~/^r.* AGT/ && calc == 1{ 
	time = $2;
	if (time > base) {
		bw = bytes/(step * 1000.0);
                if (max < bw) max = bw;
                printf "%.9f %.9f\n", base, bw >> outfile;
                base += step;
                bytes = 0;
        }
	if ($3 == ("_" dst "_") && match($14,"." src ":") >=0 ) {
		total_bytes += $8;
		bytes += $8;
	}
}

END {							
	if (total_bytes)
		printf "# Avg B/w = %.3fKB/s\n", ((total_bytes/1000.0)/(time-start)) >> outfile;
	else	
		printf "Avg B/w = 0.0KB/s\n";
	printf "# Max B/w = %.3fKB/s\n", max >> outfile;		
}




