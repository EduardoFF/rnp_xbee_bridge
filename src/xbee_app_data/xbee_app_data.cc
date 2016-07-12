#include "xbee_app_data.h"

using namespace xbee_app_data;
using namespace std;

ostream &operator<<(ostream &os, const EndNodeInfo &info)
{
  os << " lat: " << info.latitude
     << " lon: " << info.longitude
     << " altitude " << info.altitude
     << " datarate " << info.dataRate;
  return os;
}

ostream &operator<<(ostream &os, const EndNodeDebug &info)
{
  os << " pkts_sent " << info.n_xbee_pkts_sent
     << " bytes_sent " << info.n_xbee_bytes_sent
     << " pkts_rcv " << info.n_xbee_pkts_rcv
     << " bytes_rcv " << info.n_xbee_bytes_rcv
     << " timestamp " << info.timestamp
     << " last_flow_notify_time " << (int) info.last_flow_notify_time
     << " manet_alive " << (info.manet_alive>0?"true":"false");
  return os;
}

ostream &operator<<(ostream &os, const Header &hdr)
{
  os << " src " << (int) +hdr.src;
  os << "type: ";
  if( hdr.type == XBEEDATA_ROUTING )
    os << "ROUTING";
  else if( hdr.type == XBEEDATA_ENDNODEINFO)
    os << "ENDNODEINFO";
  else if( hdr.type == XBEEDATA_ENDNODEDEBUG)
    os << "ENDNODEDEBUG";
  
  else if( hdr.type == XBEEDATA_FLOWINFO )
    os << "FLOWINFO";
  else if( hdr.type == XBEEDATA_PLANNING )
    os << "PLANNING"; 
  return os;
}
