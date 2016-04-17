#include "flow_notifier.h"
#include <sys/time.h>
#include <algorithm>
#include <glog/logging.h>
#define IT(c) __typeof((c).begin())
#define FOREACH(i,c) for(__typeof((c).begin()) i=(c).begin();i!=(c).end();++i)

FlowNotifier::FlowNotifier()
{
}

void
FlowNotifier::readAddressBook(const std::string &fn_addrbook)
{
  ifstream ifile(fn_addrbook.c_str());
  int node_id;
  string ip_addr, mac_addr;
  while( ifile >> node_id >> ip_addr >> mac_addr )
    {
      node_addr ip_a, mac_a;
      if( parseIP(ip_addr, ip_a) )
	{
	  m_addrBookAddr[ip_a] = node_id;
	  m_addrBookId[node_id] = ip_a;
	}
      if( parseMAC(mac_addr, mac_a) )
	{
	  m_addrBookAddr[mac_a] = node_id;
	  m_addrBookId[node_id] = mac_a;
	}
    }
}

int
FlowNotifier::getIdFromAddressBook(node_addr &addr)
{
  IT(m_addrBookAddr) it = m_addrBookAddr.find(addr);
  if( it == m_addrBookAddr.end())
    return -1;
  else
    return it->second;
}

FlowList
FlowNotifier::getFlows(int dt)
{
  FlowList flist;
  uint64_t ddt =  getTime() - dt;
  FOREACH(it, m_flowBySrc)
    {
      FOREACH(jt, it->second )
	{
	  FlowEntry &fe = jt->second;
	  if( fe.last_activity >= ddt )
	    {
	      flist.push_back(fe);
	    }
	}
    }
  return flist;
}

				   
std::ostream &
operator<<(std::ostream &os, const FlowMap &rdata)
{
    return os;
}

std::ostream &
operator<<(std::ostream &os, const node_addr &addr)
{
  if( addr.type == 'i' )
    {
      os << "IP ";
      char ips[15];
      sprintf(ips, "%d.%d.%d.%d",
	      addr.value[0],
	      addr.value[1],
	      addr.value[2],
	      addr.value[3]);
      os << ips;
    }
  else if( addr.type == 'm' )
    {
      os << "MAC ";
      char macs[16];
      sprintf(macs, "%02x:%02x:%02x:%02x:%02x:%02x",
	      addr.value[0],
	      addr.value[1],
	      addr.value[2],
	      addr.value[3],
	      addr.value[4],
	      addr.value[5]);

      os << macs;
    }
  else
    {
      os << "INVALID_ADDR";
    }
  return os;
}

FlowNotifier::FlowNotifier(const char * url, 
                             const string &channel,
                             bool handle)
{
    m_lcm = lcm_create(url); /// Create a new LCM instance
    m_lcmURL = url; /// Set LCM URL
    m_lcmChannel = channel; /// Set LCM channel
    pthread_mutex_init(&m_mutex, NULL);
    if( handle )
    {
        if (isLCMReady())/// FIXME: better outside?
        {
            subscribeToChannel(channel);
        }
        run();
    }
}

bool
FlowNotifier::run()
{
    int status = pthread_create(&m_thread, NULL, internalThreadEntryFunc, this);
    return (status == 0);
}


/* Inserts LCM data to FlowMap */
void
FlowNotifier::handleMessage(const lcm::ReceiveBuffer* rbuf,
                             const std::string& chan,
                             const flow_list_t* msg)
{
    uint64_t tt = getTime();

    printf("FlowNotifier: [%lld] got config \n", (long long)tt);
    printf("  Received message on channel \"%s\":\n", chan.c_str());
    printf("  timestamp   = %lld\n", (long long)msg->timestamp);

    for(int i = 0; i < msg->n; i++)
    {
      FlowEntry f_entry;
      
      if( isIPAddress(msg->flows[i].src_addr) &&
	  isIPAddress(msg->flows[i].dst_addr) )
	{
	  printf("is IP addr\n");
	  if( !parseIP(msg->flows[i].src_addr, f_entry.src_addr) ||
	      !parseIP(msg->flows[i].dst_addr, f_entry.dst_addr) )
	    {
	      printf("parsing error\n");
	    }
	  else
	    {
	      cout << f_entry.src_addr << endl;
	      m_flowBySrc[f_entry.src_addr][f_entry.dst_addr] = f_entry;
	      m_flowByDst[f_entry.dst_addr][f_entry.src_addr] = f_entry;	
	    }
	  //	  f_entry.src_addr = parseIP(msg->flows[i].dst_addr);
	}
      else
	if(isMACAddress(msg->flows[i].src_addr) &&
	   isMACAddress(msg->flows[i].dst_addr) )
	  {
	    printf("is MAC addr\n");
	    if ( !parseMAC(msg->flows[i].src_addr, f_entry.src_addr) ||
		 !parseMAC(msg->flows[i].dst_addr, f_entry.dst_addr) )
	      {
		printf("parsing error for MAC address\n");
	      }
	    else
	      {
		cout << f_entry.src_addr << endl;
		m_flowBySrc[f_entry.src_addr][f_entry.dst_addr] = f_entry;
		m_flowByDst[f_entry.dst_addr][f_entry.src_addr] = f_entry;
	      }
	  }
    }
    pthread_mutex_lock(&m_mutex);
    pthread_mutex_unlock(&m_mutex);
}


/// WARNING: this is a simple check for an IP address of the
/// form xxx.xxx.xxx.xxx , it does not tell if address is valid
bool
FlowNotifier::isIPAddress(const std::string &s)
{
  return (std::count(s.begin(), s.end(), '.') == 3 );
}

/// WARNING: this is a simple check for a MAC address of the
/// form xx:xx:xx:xx:xx:xx , it does not tell if address is validx
bool
FlowNotifier::isMACAddress(const std::string &s)
{
  return ((std::count(s.begin(), s.end(), ':') == 5 )
	  || (std::count(s.begin(), s.end(), '-') == 5 ));
    
}
    
bool
FlowNotifier::parseIP(const std::string &ss, node_addr &addr)
{
  //  const char *
  //IPAddressArg::basic_parse(const char *s, const char *end,
  //			  unsigned char value[4], int &nbytes)
  //{
  int nbytes = 0;
  const char *s = ss.c_str();
  memset(addr.value, 0, 4);
  addr.type = 0;
  int d = 0;
  const char *end = s + ss.size();
  while (d < 4 && s != end && (d == 0 || *s == '.')) {
    const char *t = s + !!d;
    if (t == end || !isdigit((unsigned char) *t))
      break;
    int part = *t - '0';
    for (++t; t != end && isdigit((unsigned char) *t) && part <= 255; ++t)
      part = part * 10 + *t - '0';
    if (part > 255)
      break;
    s = t;
    addr.value[d] = part;
    if (++d == 4)
      break;
  }
  nbytes = d;
  if (nbytes == 4)
    {
      addr.type ='i';
      return true;
    }
  else
    return false;
     
}

bool
FlowNotifier::parseMAC(const std::string &ss, node_addr &addr)
{
  int d = 0, p = 0, sep = 0;
  const char *s = ss.c_str();
  const char *begin = ss.c_str();
  const char *end = s + ss.size();
  memset(addr.value, 0, 6);
  addr.type = 0;
  for (s = begin; s != end; ++s) {
    int digit;
    if (*s >= '0' && *s <= '9')
      digit = *s - '0';
    else if (*s >= 'a' && *s <= 'f')
      digit = *s - 'a' + 10;
    else if (*s >= 'A' && *s <= 'F')
      digit = *s - 'A' + 10;
    else {
      if (sep == 0 && (*s == '-' || *s == ':'))
	sep = *s;
      if (*s == sep && (p == 1 || p == 2) && d < 5) {
	p = 0;
	++d;
	continue;
      } else
	break;
    }

    if (p == 2 || d == 6)
      break;
   addr.value[d] = (p ? addr.value[d] << 4 : 0) + digit;
    ++p;
  }

  if (s == end && p != 0 && d == 5)
    {
      addr.type ='m';
      return true;
    }
  else
    return false;
}



/// returns time in milliseconds
uint64_t
FlowNotifier::getTime()
{
    struct timeval timestamp;
    gettimeofday(&timestamp, NULL);

    uint64_t ms1 = (uint64_t) timestamp.tv_sec;
    ms1*=1000;

    uint64_t ms2 = (uint64_t) timestamp.tv_usec;
    ms2/=1000;

    return (ms1+ms2);
}

std::string
FlowNotifier::getTimeStr()
{
    char buffer [80];
    timeval curTime;
    gettimeofday(&curTime, NULL);
    int milli = curTime.tv_usec / 1000;
    strftime(buffer, 80, "%Y-%m-%d %H:%M:%S", localtime(&curTime.tv_sec));
    char currentTime[84] = "";
    sprintf(currentTime, "%s:%d", buffer, milli);
    std::string ctime_str(currentTime);
    return ctime_str;
}

inline bool 
FlowNotifier::isLCMReady() 
{
    if (!m_lcm.good())
    {
        printf("LCM is not ready :(");
        return false;
    }
    else
    {
        printf("LCM is ready :)");
        return true;
    }
}

inline void 
FlowNotifier::subscribeToChannel(const string & channel)
{
    printf("Listening to channel %s\n", channel.c_str());
    m_lcm.subscribe(channel, &FlowNotifier::handleMessage, this);
}

void
FlowNotifier::internalThreadEntry()
{
    while (true)
    {
        m_lcm.handle();
    }
}


