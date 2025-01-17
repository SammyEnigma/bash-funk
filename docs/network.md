# Bash-Funk "network" module

[//]: # (THIS FILE IS GENERATED BY BASH-FUNK GENERATOR)

The following commands are available when this module is loaded:

1. [-block-port](#-block-port)
1. [-flush-dns](#-flush-dns)
1. [-is-port-open](#-is-port-open)
1. [-my-ips](#-my-ips)
1. [-my-public-hostname](#-my-public-hostname)
1. [-my-public-ip](#-my-public-ip)
1. [-run-echo-server](#-run-echo-server)
1. [-set-proxy](#-set-proxy)
1. [-test-all-network](#-test-all-network)


## <a name="license"></a>License

```
Copyright 2015-2022 by Vegard IT GmbH (https://vegardit.com)
SPDX-License-Identifier: Apache-2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


## <a name="-block-port"></a>-block-port

```
Usage: -block-port [OPTION]... [BIND_ADDRESS] PORT

Binds to the given port and thus block other programs from binding to it.

Parameters:
  BIND_ADDRESS (default: '0.0.0.0')
      The local bind address. E.g. 127.0.0.1.
  PORT (required, integer: 0-65535)
      Number of the port to occupy.

Options:
-d, --duration SECONDS (integer: ?-?)
        Duration in seconds to block the port.
    -----------------------------
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.

Examples:
$ -block-port --duration 1  12345
Binding to 0.0.0.0:12345...
Press [CTRL]+[C] to abort.
$ -block-port -d 1  127.0.0.1  12345
Binding to 127.0.0.1:12345...
Press [CTRL]+[C] to abort.
```

*Implementation:*
```bash
echo "Binding to $_BIND_ADDRESS:$_PORT..."

[[ $_duration ]] && local timeout="Timeout => $_duration," || local timeout="";

perl << EOF
   use IO::Socket;
   \$server = IO::Socket::INET->new(
      LocalAddr => '$_BIND_ADDRESS',
      LocalPort => $_PORT,
      Type => SOCK_STREAM,
      ReuseAddr => 1,
      $timeout
      Listen => 10
   ) or die "Couldn't bind to $_BIND_ADDRESS:$_PORT: \$@\n";
   print("Press [CTRL]+[C] to abort.\n");
   while (\$client = \$server->accept()) { }
   close(\$server);
EOF
```


## <a name="-flush-dns"></a>-flush-dns

```
Usage: -flush-dns [OPTION]...

Flushes the local DNS cache.

Options:
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
case $OSTYPE in
   cygwin|msys) cmd="ipconfig /flushdns" ;;
   darwin) cmd="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder" ;;
   *)
     if hash systemd-resolve &>/dev/null; then
        cmd="sudo systemd-resolve --flush-caches && systemd-resolve --statistics"
     elif hash resolvectl &>/dev/null; then
        cmd="sudo resolvectl flush-caches && resolvectl statistics"
     elif [ -f /etc/init.d/networking ]; then
        cmd="sudo /etc/init.d/networking restart"
     elif systemctl &>/dev/null; then
        cmd="sudo systemctl restart networking"
     else
        cmd="sudo systemctl restart networking"
     fi
  ;;
esac
echo $cmd
eval $cmd
```


## <a name="-is-port-open"></a>-is-port-open

```
Usage: -is-port-open [OPTION]... HOSTNAME PORT [CONNECT_TIMEOUT_IN_SECONDS]

Checks if a TCP connection can be established to the given port.

Parameters:
  HOSTNAME (required)
      Target hostname.
  PORT (required, integer: 0-65535)
      Target TCP port.
  CONNECT_TIMEOUT_IN_SECONDS (default: '5', integer: ?-?)
      Number of seconds to try to connect to the given port. Default is 5 seconds.

Options:
-v, --verbose
        Prints additional information during command execution.
    -----------------------------
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.

Examples:
$ -is-port-open localhost 12345 1

$ -is-port-open -v localhost 12345 1
localhost:12345 is not reachable.
```

*Implementation:*
```bash
if hash nc &>/dev/null; then
   if nc -vz -w $_CONNECT_TIMEOUT_IN_SECONDS $_HOSTNAME $_PORT; then
      portStatus=open
   else
      portStatus=
   fi
else
   local portStatus=$(perl << EOF
      use IO::Socket;
      my \$socket=IO::Socket::INET->new(
         PeerAddr => "$_HOSTNAME",
         PeerPort => $_PORT,
         Timeout => $_CONNECT_TIMEOUT_IN_SECONDS
      );

      if (defined \$socket) {
         sleep 1;
         (defined \$socket->connected ? print("open") : q{});
      }
EOF
   )
fi

if [[ $portStatus == "open" ]]; then
   [[ $_verbose ]] && echo "$_HOSTNAME:$_PORT is open." || true
   return 0
else
   [[ $_verbose ]] && echo "$_HOSTNAME:$_PORT is not reachable." || true
   return 1
fi
```


## <a name="-my-ips"></a>-my-ips

```
Usage: -my-ips [OPTION]...

Prints the configured IP v4 addresses of this host excluding 127.0.0.1.

Options:
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
if [[ $OSTYPE == cygwin || $OSTYPE == msys ]]; then
   ipconfig /all | grep "IPv4 Address" | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
else
   if [ -f /proc/net/fib_trie ]; then
      awk '/32 host/ { if(uniq[ip]++ && ip != "127.0.0.1") print ip } {ip=$2}' /proc/net/fib_trie
   elif hash ip &>/dev/null; then
      ip -4 -o addr show scope global | awk '{split($4, cidr, "/"); print cidr[1]}'
   elif hash ifconfig &>/dev/null; then
      ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
   else
      echo "Error: None of the required commands found: ip, ifconfig"
      return 1
   fi
fi
```


## <a name="-my-public-hostname"></a>-my-public-hostname

```
Usage: -my-public-hostname [OPTION]...

Prints the public hostname of this host.

Options:
-m, --method TYPE (one of: [finger,ftp,https,nslookup,telnet])
        Method to determine the public hostname. Default is 'https'.
    -----------------------------
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
case ${_method:-https} in
   finger)
      if ! hash finger &>/dev/null; then
         echo "Required command 'ftp' is not available."
         return 1
      fi
      finger @4.ifcfg.me 2>/dev/null | sed -nE 's/Your Host is (.*)/\1/p'
      return ${PIPESTATUS[0]}
     ;;
   ftp)
      if ! hash ftp &>/dev/null; then
         echo "Required command 'ftp' is not available."
          return 1
      fi
      echo close | ftp 4.ifcfg.me 2>/dev/null | sed -nE 's/.*[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ \((.*)\)/\1/p'
      return ${PIPESTATUS[0]}
     ;;
   https)
      hash wget &>/dev/null && local get="wget -qO- --user-agent=curl" || local get="curl -s"
      $get https://4.ifcfg.me/h
     ;;
   nslookup)
      if ! hash nslookup &>/dev/null; then
         echo "Required command 'nslookup' is not available."
         return 1
      fi
      nslookup . 4.ifcfg.me 2>/dev/null | sed -nE 's/Name:\t(.*)/\1//p'
      return ${PIPESTATUS[0]}
     ;;
   telnet)
      if ! hash telnet &>/dev/null; then
         echo "Required command 'telnet' is not available."
         return 1
      fi
      telnet 4.ifcfg.me 2>/dev/null | sed -nE 's/Your Host is (.*)/\1/p'
      return ${PIPESTATUS[0]}
     ;;
esac
```


## <a name="-my-public-ip"></a>-my-public-ip

```
Usage: -my-public-ip [OPTION]...

Prints the public IP v4 address of this host.

Options:
-m, --method TYPE (one of: [dns,http,https,nslookup,telnet])
        Method to determine the public IP v4 address. Default is 'http'.
    -----------------------------
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
case ${_method:-http} in
   dns)
      if hash dig &>/dev/null; then
         dig @resolver1.opendns.com -4 myip.opendns.com +short
      elif ! hash host &>/dev/null; then
         echo "Required command 'dig' or 'host' is not available."
         return 1
      else
         host myip.opendns.com resolver1.opendns.com | grep --color=never -oP '(?<=myip.opendns.com has address )[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
      fi
     ;;
   http)
      hash wget &>/dev/null && local get="wget -qO- --user-agent=curl" || local get="curl -s"
      # alternatives: icanhazip.com, ifconfig.co, ifconfig.me, ipecho.net
      $get http://whatismyip.akamai.com/
     ;;
   https)
      hash wget &>/dev/null && local get="wget -qO- --user-agent=curl" || local get="curl -s"
      # alternatives: icanhazip.com, ifconfig.co, ifconfig.me
      $get https://ipecho.net/plain
     ;;
   nslookup)
      if ! hash nslookup &>/dev/null; then
         echo "Required command 'nslookup' is not available."
         return 1
      fi
      nslookup myip.opendns.com resolver1.opendns.com | grep -oP '(?<=Address: )[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
      return ${PIPESTATUS[0]}
     ;;
   telnet)
      if ! hash telnet &>/dev/null; then
         echo "Required command 'telnet' is not available."
         return 1
      fi
      telnet telnetmyip.com 2>/dev/null | sed -nE 's/.*ip\": \"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).+/\1/p'
      return ${PIPESTATUS[0]}
     ;;
esac
```


## <a name="-run-echo-server"></a>-run-echo-server

```
Usage: -run-echo-server [OPTION]... [BIND_ADDRESS] PORT

Runs a simple single-connection TCP echo server.

Requirements:
  + Command 'python' must be available.

Parameters:
  BIND_ADDRESS (default: '0.0.0.0')
      The local bind address. E.g. 127.0.0.1.
  PORT (required, integer: 0-65535)
      Number of the TCP port to be used.

Options:
    --disconnect_when string
        String that can be send to the server to disconnect the current connection.
    --stop_when string
        String that can be send to the server to shut it down.
    -----------------------------
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
if [[ ! $_stop_when ]]; then
   local _stop_when=stop
fi

if [[ ! $_disconnect_when ]]; then
   local _disconnect_when=quit
fi

python -c "
import socket, sys

def run():
   srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
   srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
   srv.bind(('$_BIND_ADDRESS', $_PORT))
   srv.listen(0)

   print('Running TCP echo server on $_BIND_ADDRESS:$_PORT...')

   while 1:
      conn, src_addr = srv.accept()
      print('[CONNECT] %s' % src_addr)
      while 1:
         data, src_addr = conn.recvfrom(256)
         if not data:
            continue
         if data == '$_stop_when\r\n':
            print('[SHUTDOWN] %s' % src_addr)
            sys.exit(0)
         if data == '$_disconnect_when\r\n':
            print('[DISCONNECT] %s' % src_addr)
            conn.shutdown(1)
            conn.close()
            break
         conn.sendall(data)
         sys.stdout.write(data)
         sys.stdout.flush()
try:
   run()
except KeyboardInterrupt:
   pass
"
```


## <a name="-set-proxy"></a>-set-proxy

```
Usage: -set-proxy [OPTION]... PROXY_URL [NO_PROXY]

Sets the proxy environment variables.

Parameters:
  PROXY_URL (required)
      The proxy URL to set.
  NO_PROXY
      Proxy exclusions.

Options:
-v, --verbose
        Prints additional information during command execution.
    -----------------------------
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
for varname in all_proxy ALL_PROXY ftp_proxy FTP_PROXY http_proxy HTTP_PROXY https_proxy HTTPS_PROXY; do
   [[ $_verbose ]] && echo "Setting $varname=$_PROXY_URL"
   export $varname=$_PROXY_URL
done

# exclude local IPs from proxy
if hash ifconfig &>/dev/null; then
   local my_ips=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
else
   local my_ips=::1,127.0.0.1
fi
no_proxy=localhost,${my_ips//$'\n'/,}

# exclude metadata IP if AWS EC2 server
if [[ -f /sys/hypervisor/uuid && $(head -c 3 /sys/hypervisor/uuid) == "ec2" ]]; then
   no_proxy="$no_proxy,169.254.169.254"
fi

export no_proxy="$no_proxy,$_NO_PROXY"
[[ $_verbose ]] && echo "Setting no_proxy=$no_proxy"
[[ $_verbose ]] && echo "Setting NO_PROXY="
export NO_PROXY=$no_proxy
```


## <a name="-test-all-network"></a>-test-all-network

```
Usage: -test-all-network [OPTION]...

Performs a selftest of all functions of this module by executing each function with option '--selftest'.

Options:
    --help
        Prints this help.
    --selftest
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
-block-port --selftest && echo || return 1
-flush-dns --selftest && echo || return 1
-is-port-open --selftest && echo || return 1
-my-ips --selftest && echo || return 1
-my-public-hostname --selftest && echo || return 1
-my-public-ip --selftest && echo || return 1
-run-echo-server --selftest && echo || return 1
-set-proxy --selftest && echo || return 1
```
