# ��ʼ���趨
BEGIN {
        sendLine = 0;
        recvLine = 0;
	fowardLine = 0;
}
# Ӧ�ò��յ���
$0 ~/^s.* AGT/ {
        sendLine ++ ;
}
# Ӧ�ò㷢�Ͱ�
$0 ~/^r.* AGT/ {
        recvLine ++ ;
}
# ·�ɲ�ת���� 
$0 ~/^f.* RTR/ {
        fowardLine ++ ;
}
# ���������
END {
        printf "cbr s:%d r:%d, r/s Ratio:%.4f, f:%d \n", sendLine, recvLine, (recvLine/sendLine),fowardLine;
}

