// PBO ================================================================
// I have added some lines into ~ns2/tcl/lib/ns-lib.tcl
// I copy the file ns-lib.tcl to this directory for reference
// PBO ================================================================

#ifndef __mflood_h__
#define __mflood_h__

#include <sys/types.h>
#include <cmu-trace.h>
#include <priqueue.h>
#include <mflood/mflood-seqtable.h>
#include <list>
//#include <mflood_seqtable.h>

#define NOW (Scheduler::instance().clock())

// Should be set by the user using best guess (conservative)
#define NETWORK_DIAMETER 30	// 30 hops
 
// The followings are used for the forward() function. Controls pacing.
#define FORWARD_DELAY 0.01		// random delay
#define NO_DELAY -1.0		// no delay 

// The Routing Agent
class MFlood: public Agent {
	friend class MFlood_RTEntry;

public:
	MFlood(nsaddr_t id);
	void recv(Packet *p, Handler *);

protected:
	int command(int, const char *const *);
	inline int initialized() { return 1 && target_; }

	// Route Table Management
	void rt_resolve(Packet *p);

	// Packet TX Routines
	void forward(MFlood_RTEntry *rt, Packet *p, double delay);

	nsaddr_t index_;                  // IP Address of this node

	// Routing Table
	MFlood_RTable rtable_;

	// A mechanism for logging the contents of the routing
	Trace *logtarget;
	NsObject *uptarget_;
	NsObject *port_dmux_;
  private:
  	u_int32_t myseq_;
};

#endif 

