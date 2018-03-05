#=====================================
#Define options
#=====================================
set val(chan)           Channel/WirelessChannel    ;#Channel Type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             50                          ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set opt(cp) "cbr1";
set opt(sc) "scene1";
#########################################################

#########################################################
#===============================
# Main Program
#===============================
set ns_ [new Simulator]
set tracefd [open aodv.tr w]
$ns_ trace-all $tracefd
$ns_ use-newtrace
set namtracefd [open aodv.nam w]
$ns_ namtrace-all-wireless $namtracefd 1000 300
set topo [new Topography]
$topo load_flatgrid 1000 300
set god_ [new God]
create-god $val(nn)

$ns_ node-config -adhocRouting $val(rp) \
-llType $val(ll) \
-macType $val(mac) \
-ifqType $val(ifq) \
-ifqLen $val(ifqlen) \
-antType $val(ant) \
-propType $val(prop) \
-phyType $val(netif) \
-channelType $val(chan) \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace OFF \


####################################################
####################################################


for {set i 0} {$i<$val(nn)} {incr i} {
	set node_($i) [$ns_ node]
	$node_($i) random-motion 0
}
source $opt(cp)
source $opt(sc)
for {set i 0} {$i<$val(nn)} {incr i} {
	$ns_ at 300.1 "$node_($i) reset";
}
$ns_ at 300.2 "stop"
$ns_ at 300.3 "puts \"NS EXITING...\"; $ns_ halt"
proc stop {} {
	global ns_ tracefd namtracefd
	$ns_ flush-trace
	close $tracefd
	close $namtracefd
	exec nam olsr.nam &
	exit 0
}
$ns_ run
