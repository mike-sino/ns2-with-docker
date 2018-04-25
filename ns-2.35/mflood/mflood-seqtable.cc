#include <mflood/mflood-seqtable.h>

// The Routing Table
MFlood_RTEntry::MFlood_RTEntry() {
	src_ = 0;
//	seq_ = 0;
	for(int i=0;i<REM_SEQ_COUNT;i++)
		rt_seqnos[i] = 0xffffffff;
	max_seqno = 0;
	min_seqno = 0;
	seq_it = 0;
};

// The Routing Table
MFlood_RTEntry::MFlood_RTEntry(nsaddr_t src,u_int32_t seq) {
	src_ = src;
//	seq_ = seq;
	for(int i=0; i<REM_SEQ_COUNT; i++)
		rt_seqnos[i] = 0xffffffff;
	rt_seqnos[0] = seq;
	max_seqno = seq;
	min_seqno = 0;
	seq_it = 1;
};

bool MFlood_RTEntry::isNewSeq(u_int32_t seq) {
	if(seq > max_seqno)
		return true;
	//drop the data packet long time ago
	if(seq < min_seqno)
		return false;
	for(int i=0; i<REM_SEQ_COUNT; i++)
		if(seq == rt_seqnos[i])
			return false;

	return true;
}

void MFlood_RTEntry::addSeq(u_int32_t seq) {
	u_int16_t min_it = 0;
	if(seq < min_seqno)
		return;
	if(seq > max_seqno)
		max_seqno = seq;
/*
	for(int i=0;i<REM_SEQ_COUNT;i++)
		if(seq == rt_seqnos[i])
			return;
*/
	rt_seqnos[seq_it++] = seq;
	seq_it %= REM_SEQ_COUNT;
	min_seqno = 0xffffffff;

	for(int i=0; i<REM_SEQ_COUNT; i++)
		if(min_seqno > rt_seqnos[i])
			min_seqno = rt_seqnos[i];
}

// The Routing Table
MFlood_RTEntry *MFlood_RTable::rt_lookup(nsaddr_t id){
	MFlood_RTEntry *rt = rthead.lh_first;
	for(; rt; rt = rt->rt_link.le_next) {
		if(rt->src_ == id)
			break;
	}
	return rt;
}

void MFlood_RTable::rt_delete(nsaddr_t id) {
	MFlood_RTEntry *rt = rt_lookup(id);
	if(rt) {
		LIST_REMOVE(rt, rt_link);
		delete rt;
	}
}

void MFlood_RTable::rt_print() {
	MFlood_RTEntry *rt = rthead.lh_first;
	//printf("\n Seq table:\n");
	for(; rt; rt = rt->rt_link.le_next) {
		//printf("index: %d , seq: %d \n",rt->src_,rt->max_seqno);
	}
	return;
}



