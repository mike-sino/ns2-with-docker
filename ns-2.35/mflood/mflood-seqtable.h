#ifndef __mflood_seqtable_h__
#define __mflood_seqtable_h__


#include <assert.h>
#include <sys/types.h>
#include <config.h>
#include <lib/bsd-list.h>
#include <scheduler.h>

#define INFINITY 0xff
#define RTF_DOWN 0
#define RTF_UP 1
#define REM_SEQ_COUNT 5000

// Route Table Entry
class MFlood_RTEntry {
	friend class MFlood_RTable;
	friend class MFlood;

public:
	MFlood_RTEntry();
	MFlood_RTEntry(nsaddr_t src,u_int32_t seq);
	bool isNewSeq(u_int32_t seq);	// old -> false, new->true
	void addSeq(u_int32_t seq);	    // add a seqno to seqno array(rt_seqnos)
	
protected:
	LIST_ENTRY(MFlood_RTEntry) rt_link;
	nsaddr_t src_;
//	u_int32_t seq_;
	u_int32_t		rt_seqnos[REM_SEQ_COUNT];	//seqno array
	u_int32_t       max_seqno;	//max seqno 
	u_int32_t       min_seqno;	//max seqno 
	u_int16_t		seq_it;	// seqno's iterator
};


// The Routing Table
class MFlood_RTable {
	friend class MFlood;

public:
	MFlood_RTable() { LIST_INIT(&rthead); }  // initial the routing table 
	void rt_delete(nsaddr_t id);
	MFlood_RTEntry *rt_lookup(nsaddr_t id);
	void rt_print();

private:
	LIST_HEAD(,MFlood_RTEntry) rthead;
};

#endif
