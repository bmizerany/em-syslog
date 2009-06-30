require "lib/em/syslog"

SYSLOG_SERVER = '192.168.249.134'
SYSLOG_PORT   = 514

#EM.kqueue
#EM.epoll
EM.run {
  
  # This is gonna be our 'syslog' server for testing to make sure we're getting the correct packets
  #EM.open_datagram_socket SYSLOG_SERVER, SYSLOG_PORT do |c|
  #  def c.receive_data data
  #    p data      
  #  end
  #end
  
  EM.add_periodic_timer(10) {    
    EM.syslog_setup(SYSLOG_SERVER, SYSLOG_PORT)
    
    EM.emergency('emergency')
    EM.alert('alert')
    EM.critical('critical')
    EM.error('error')
    EM.warning('warning')
    EM.notice('notice')
    EM.informational('informational')
    EM.info('info')
    EM.debug('debug')
  } 
  
}