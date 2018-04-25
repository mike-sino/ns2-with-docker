#ifndef __mflood_packet_h__
#define __mflood_packet_h__

/*
 * JFlood Routing Protocol Header Macros
 */
#define HDR_MFLOOD(p) ((struct hdr_mflood*)hdr_mflood::access(p))

/*
 * General JFlood Header
 */
struct hdr_mflood {
	u_int32_t	seq_;
	u_int32_t	dst_group;		// destination's group id
	
	// Header access methods
	static int offset_; // required by PacketHeaderManager
	inline static int& offset() { return offset_; }
	inline static hdr_mflood* access(const Packet* p) {
		return (hdr_mflood*) p->access(offset_);
	}
};

#endif /* __mflood_packet_h__ */
