# 初始化设定
BEGIN {
        sendLine = 0;
        recvLine = 0;
	fowardLine = 0;
}
# 应用层收到包
$0 ~/^s.* AGT/ {
        sendLine ++ ;
}
# 应用层发送包
$0 ~/^r.* AGT/ {
        recvLine ++ ;
}
# 路由层转发包 
$0 ~/^f.* RTR/ {
        fowardLine ++ ;
}
# 最后输出结果
END {
        printf "cbr s:%d r:%d, r/s Ratio:%.4f, f:%d \n", sendLine, recvLine, (recvLine/sendLine),fowardLine;
}

