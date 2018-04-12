BEGIN {
	sendLine = 0;
	recvLine = 0;
	forwardLine = 0;
}
$0 ~/^s.* AGT/ {
	sendLine ++ ;
}
$0 ~/^r.* AGT/ {
	recvLine ++ ;
}
$0 ~/^f.* RTR/ {
	forwardLine ++ ;
}
END {
	printf "cbr send:%d receive: %d, forward:%d,r/s Delivery Ratio:%.4f \n", sendLine, recvLine,forwardLine, (recvLine/sendLine);
}
