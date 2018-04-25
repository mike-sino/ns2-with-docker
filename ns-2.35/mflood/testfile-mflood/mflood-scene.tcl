#Agent/UDP set packetSize_ 6000

# ======================================================================
# Define options
# ======================================================================
set val(chan)       Channel/WirelessChannel
set val(prop)       Propagation/TwoRayGround
set val(netif)      Phy/WirelessPhy
set val(mac)        Mac/802_11
set val(ifq)        Queue/DropTail/PriQueue
set val(ll)         LL
set val(ant)        Antenna/OmniAntenna

set val(x)             1200   ;# X dimension of the topography
set val(y)             1200   ;# Y dimension of the topography
set val(ifqlen)         50            ;# max packet in ifq
set val(seed)           0.0
set val(rp)   		MFlood
set val(nn)             50             ;# how many nodes are simulated
set val(cp)             "cbr-50n-30c-1p"
#set val(sc)             "../scene-50n-0p-2s-400t-1200-1200"
set val(sc)             "scene-50n-0p-40s-400t-1200-1200"
#set val(sc)		"../scene/jscene-50n-0p-2s-400t-1200-1200-1"
set val(stop)	    100

# ======================================================================
# Main Program
# ======================================================================

#ns-random 0

# Initialize Global Variables
set ns_ [new Simulator]
set tracefd [open mflood-scene2.tr w]
$ns_ trace-all $tracefd

# set up topography
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

set namtrace    [open wireless1-out.nam w]
$ns_ namtrace-all-wireless $namtrace $val(x) $val(y)

#
# Create God
#
set god_ [create-god $val(nn)]

# Create the specified number of mobilenodes [$val(nn)] and "attach" them
# to the channel. 
# configure node
set channel [new Channel/WirelessChannel]
$channel set errorProbability_ 0.0

        $ns_ node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channel $channel \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON\
			 -macTrace OFF \
			 -movementTrace OFF			
			 
	for {set i 0} {$i < $val(nn) } {incr i} {
		set node_($i) [$ns_ node]	
		$node_($i) random-motion 0;	
	}

#
# Define node movement model
#
puts "Loading connection pattern..."
source $val(cp)

#
# Define traffic model
#
puts "Loading scenario file..."
source $val(sc)


# Define node initial position in nam

for {set i 0} {$i < $val(nn)} {incr i} {

    # 20 defines the node size in nam, must adjust it according to your scenario
    # The function must be called after mobility model is defined

    $ns_ initial_node_pos $node_($i) 20
}

# Tell nodes when the simulation ends
for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $val(stop).0 "$node_($i) reset";
}

$ns_ at $val(stop).0 "stop"
$ns_ at $val(stop).01 "puts \"NS EXITING...\" ; $ns_ halt"

proc stop {} {
    global ns_ tracefd
    $ns_ flush-trace
    close $tracefd
}

puts "Starting Simulation..."
$ns_ run






