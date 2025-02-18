#!/bin/bash

#######################################################
# author: k0d14k
# description: bash port scanner
#######################################################

mkdir -p ./shmap
mkdir -p ./shmap/results
mkdir -p ./shmap/results/tcp/
mkdir -p ./shmap/results/udp/

declare -A tcp_ports
tcp_ports["1"]="[TCP/1] TCP Multiplexor on  "
tcp_ports["2"]="[TCP/2] compressnet Management Utility on  "
tcp_ports["3"]="[TCP/3] compressnet Compression Process on  "
tcp_ports["13"]="[TCP/13] Daytime Protocol on  "
tcp_ports["17"]="[TCP/17] Quote of the Day on  "
tcp_ports["20"]="[TCP/20] FTP - Il file transfer protocol - data on  "
tcp_ports["21"]="[TCP/21] FTP - Il file transfer protocol - control on  "
tcp_ports["22"]="[TCP/22] SSH - Secure login, file transfer (scp, SFTP) e port forwarding on  "
tcp_ports["23"]="[TCP/23] Telnet insecure text communications on  "
tcp_ports["25"]="[TCP/25] SMTP - Simple Mail Transfer Protocol (E-mail) on  "
tcp_ports["70"]="[TCP/70] Gopher on  "
tcp_ports["79"]="[TCP/79] finger Finger on  "
tcp_ports["80"]="[TCP/80] HTTP HyperText Transfer Protocol (WWW) on  "
tcp_ports["88"]="[TCP/88] Kerberos Authenticating agent on  "
tcp_ports["104"]="[TCP/104] DICOM - Digital Imaging and Communications in Medicine on  "
tcp_ports["110"]="[TCP/110] POP Post Office Protocol (E-mail) on  "
tcp_ports["113"]="[TCP/113] ident on  "
tcp_ports["119"]="[TCP/119] NNTP on  "
tcp_ports["139"]="[TCP/139] NetBIOS Session Service on  "
tcp_ports["143"]="[TCP/143] IMAP4 Internet Message Access Protocol (E-mail) on  "
tcp_ports["210"]="[TCP/210] ANSI Z39.50 on  "
tcp_ports["389"]="[TCP/389] LDAP on  "
tcp_ports["411"]="[TCP/411] Direct Connect on  "
tcp_ports["443"]="[TCP/443] HTTPS on  "
tcp_ports["445"]="[TCP/445] Microsoft-DS (Active Directory, share di Windows, Sasser-worm) on  "
tcp_ports["465"]="[TCP/465] SMTP - Simple Mail Transfer Protocol (E-mail) su SSL on  "
tcp_ports["502"]="[TCP/502] Modbus on  "
tcp_ports["563"]="[TCP/563] NNTP Network News Transfer Protocol (newsgroup Usenet) su SSL on  "
tcp_ports["587"]="[TCP/587] e-mail message submission (SMTP) on  "
tcp_ports["591"]="[TCP/591] FileMaker 6.0 Web Sharing on  "
tcp_ports["636"]="[TCP/636] LDAP su SSL on  "
tcp_ports["666"]="[TCP/666] Doom giocato in rete via TCP on  "
tcp_ports["993"]="[TCP/993] IMAP4 Internet Message Access Protocol (E-mail) su SSL on  "
tcp_ports["995"]="[TCP/995] POP3 Post Office Protocol (E-mail) su SSL on  "
tcp_ports["1080"]="[TCP/1080] SOCKS Proxy on  "
tcp_ports["1883"]="[TCP/1883] MQTT on  "
tcp_ports["1433"]="[TCP/1433] Microsoft SQL Server on  "
tcp_ports["1434"]="[TCP/1434] Microsoft-SQL-Monitor on  "
tcp_ports["1984"]="[TCP/1984] Big Brother on  "
tcp_ports["2101"]="[TCP/2101] rtcm-sc104 on  "
tcp_ports["3050"]="[TCP/3050] Firebird Database system on  "
tcp_ports["3128"]="[TCP/3128] HTTP usato dalle web cache e porta di default per Squid cache on  "
tcp_ports["3306"]="[TCP/3306] MySQL Database system on  "
tcp_ports["3389"]="[TCP/3389] Desktop Remoto di Windows e Microsoft Terminal Server (RDP) on  "
tcp_ports["3541"]="[TCP/3541] Voispeed on  "
tcp_ports["3542"]="[TCP/3542] Voispeed on  "
tcp_ports["3690"]="[TCP/3690] Subversion on  "
tcp_ports["4662"]="[TCP/4662] eMule (versioni precedenti alla 0.47, le più recenti la generano casualmente) on  "
tcp_ports["4711"]="[TCP/4711] eMule Web Server on  "
tcp_ports["4899"]="[TCP/4899] Radmin Connessione Remota on  "
tcp_ports["5000"]="[TCP/5000] Sybase database server (default) on  "
tcp_ports["5060"]="[TCP/5060] SIP on  "
tcp_ports["5084"]="[TCP/5084] EPCglobal Low-Level Reader Protocol (LLRP) on  "
tcp_ports["5085"]="[TCP/5085] EPCglobal Low-Level Reader Protocol (LLRP) criptato on  "
tcp_ports["5190"]="[TCP/5190] AOL e AOL Instant Messenger on  "
tcp_ports["5201"]="[TCP/5201] iPerf on  "
tcp_ports["5222"]="[TCP/5222] XMPP Client Connection on  "
tcp_ports["5269"]="[TCP/5269] XMPP Server Connection on  "
tcp_ports["5432"]="[TCP/5432] PostgreSQL Database system on  "
tcp_ports["5555"]="[TCP/5555] ADB Android Debug Bridge on  "
tcp_ports["5631"]="[TCP/5631] Symantec PcAnywhere on  "
tcp_ports["5800"]="[TCP/5800] Virtual Network Computing (http) on  "
tcp_ports["5900"]="[TCP/5900] Virtual Network Computing (main) on  "
tcp_ports["6000"]="[TCP/6000] X11 usato per X-windows on  "
tcp_ports["6379"]="[TCP/6379] Redis on  "
tcp_ports["6566"]="[TCP/6566] SANE on  "
tcp_ports["6667"]="[TCP/6667] Internet Relay Chat on  "
tcp_ports["8000"]="[TCP/8000] iRDMI. Spesso usato per sbaglio al posto della porta 8080. on  "
tcp_ports["8080"]="[TCP/8080] HTTP Alternate (http-alt) o WWW caching service (web cache). on  "
tcp_ports["8118"]="[TCP/8118] privoxy http filtering proxy service on  "
tcp_ports["8291"]="[TCP/8291] mikrotik porta di default usata dal software winbox per la configurazione degli apparecchi di marca Mikrotik. on  "
tcp_ports["8883"]="[TCP/8883] MQTT con SSL on  "
tcp_ports["41951"]="[TCP/41951] TVersity Media Server on  "
tcp_ports["1337"]="[TCP/1337] WASTE Encrypted File Sharing Program on  "
tcp_ports["1352"]="[TCP/1352] IBM Lotus Lotus Domino/Notes on  "
tcp_ports["1521"]="[TCP/1521] Oracle database default listener (CONFLITTO con l'uso registrato: nCube License Manager) on  "
tcp_ports["1965"]="[TCP/1965] Gemini, porta predefinita on  "
tcp_ports["2082"]="[TCP/2082] CPanel, porta di default port (CONFLITTO con l'uso registrato: Infowave Mobility Server) on  "
tcp_ports["2086"]="[TCP/2086] Web Host Manager, porta di default (CONFLITTO con l'uso registrato: GNUnet) on  "
tcp_ports["4662"]="[TCP/4662] eMule AdunanzA, porta di default per il protocollo eDonkey usato da eMule AdunanzA on  "
tcp_ports["5000"]="[TCP/5000] Universal plug-and-play Windows network device interoperability (CONFLITTO con l'uso registrato: complex-main) on  "
tcp_ports["5223"]="[TCP/5223] XMPP porta di default per SSL Client Connection on  "
tcp_ports["5800"]="[TCP/5800] VNC remote desktop protocol (per l'uso via HTTP) on  "
tcp_ports["5900"]="[TCP/5900] VNC remote desktop protocol (porta standard) on  "
tcp_ports["6881"]="[TCP/6881] BitTorrent on  "
tcp_ports["6969"]="[TCP/6969] BitTorrent tracker port (CONFLITTO con l'uso registrato: acmsoda) on  "
tcp_ports["9050"]="[TCP/9050] TOR, porta di default per il socks5 on  "
tcp_ports["9091"]="[TCP/9091] Transmission, porta di default per la gestione da browser on  "
tcp_ports["10000"]="[TCP/10000] Webmin interfaccia web di amministrazione on  "
tcp_ports["19132"]="[TCP/19132] Minecraft Bedrock Edition: videogioco di tipo sand-box on  "
tcp_ports["20000"]="[TCP/20000] OpenWebNet, protocollo per la comunicazione con i gateway Bticino per il Bus SCS on  "
tcp_ports["25565"]="[TCP/25565] Minecraft Java Edition: videogioco di tipo sand-box on  "
tcp_ports["31337"]="[TCP/31337] Back Orifice Remote administration tool (spesso usata dai Trojan) on  "
tcp_ports["30033"]="[TCP/30033] TeamSpeak, software VoIP proprietario, porta di default \"Filetransfer\" on  "
tcp_ports["32400"]="[TCP/32400] Plex, Accesso al Plex Media Server on  "
tcp_ports["32469"]="[TCP/32469] Plex, Accesso al Plex DLNA Server on  "
tcp_ports["8324"]="[TCP/8324] Plex, Accesso a Plex per Roku via Plex Companion on  "
tcp_ports["10101"]="[TCP/10101] Metin2 videogioco di tipo MMO on  "
tcp_ports["1194"]="[TCP/1194] OpenVPN on  "
tcp_ports["7400"]="[TCP/7400] RTPS (Real Time Publish Subscribe) DDS Discovery on  "
tcp_ports["7401"]="[TCP/7401] RTPS (Real Time Publish Subscribe) DDS User-Traffic on  "
tcp_ports["7402"]="[TCP/7402] RTPS (Real Time Publish Subscribe) DDS Meta-Traffic on  "
tcp_ports["2022"]="[TCP/2022]  Wings Pterodactyl pannello di moderazione per server minecraft on  "
tcp_ports["7659"]="[TCP/7659] Polypheny interfaccia utente on  "
declare -A udp_ports
udp_ports["7"]="[UDP/7] Echo Protocol on "
udp_ports["8"]="[UDP/8] Bif Protocol on "
udp_ports["9"]="[UDP/9] Discard Protocol on "
udp_ports["19"]="[UDP/19] Chargen Protocol on "
udp_ports["67"]="[UDP/67] BOOTP Bootstrap Protocol (Server) e DHCP Dynamic Host Configuration Protocol (Server) on "
udp_ports["68"]="[UDP/68] BOOTP Bootstrap Protocol (Client) e DHCP Dynamic Host Configuration Protocol (Client) on "
udp_ports["69"]="[UDP/69] TFTP Trivial File Transfer Protocol on "
udp_ports["123"]="[UDP/123] NTP usato per la sincronizzazione degli orologi client-server on "
udp_ports["137"]="[UDP/137] NetBIOS Name Service on "
udp_ports["138"]="[UDP/138] NetBIOS Datagram Service on "
udp_ports["161"]="[UDP/161] SNMP Simple Network Management Protocol (Agent) on "
udp_ports["162"]="[UDP/162] SNMP Simple Network Management Protocol (Manager) on "
udp_ports["445"]="[UDP/445] Microsoft-DS SMB file sharing on "
udp_ports["514"]="[UDP/514] SysLog usato per il system logging on "
udp_ports["554"]="[UDP/554] RTSP on "
udp_ports["631"]="[UDP/631] IPP (Internet Printing Protocol) e CUPS (implementazione per server di stampanti) on "
udp_ports["1194"]="[UDP/1194] OpenVPN on "
udp_ports["1434"]="[UDP/1434] Microsoft-SQL-Monitor on "
udp_ports["2049"]="[UDP/2049] Network File System on "
udp_ports["2101"]="[UDP/2101] rtcm-sc104 usato per le correzioni differenziali dei gps on "
udp_ports["3690"]="[UDP/3690] Subversion on "
udp_ports["4672"]="[UDP/4672] eMule (versioni precedenti alla 0.47, le più recenti la generano casualmente) on "
udp_ports["5060"]="[UDP/5060] SIP on "
udp_ports["5084"]="[UDP/5084] EPCglobal Low-Level Reader Protocol (LLRP) on "
udp_ports["5085"]="[UDP/5085] EPCglobal Low-Level Reader Protocol (LLRP) criptato on "
udp_ports["5632"]="[UDP/5632] Symantec PcAnywhere on "
udp_ports["7400"]="[UDP/7400] RTPS (Real Time Publish Subscribe) DDS Discovery on "
udp_ports["7401"]="[UDP/7401] RTPS (Real Time Publish Subscribe) DDS User-Traffic on "
udp_ports["7402"]="[UDP/7402] RTPS (Real Time Publish Subscribe) DDS Meta-Traffic on "
udp_ports["41951"]="[UDP/41951] TVersity Media Server on "
udp_ports["2022"]="[UDP/2022] Wings Pterodactyl pannello di moderazione per server minecraft on "
udp_ports["4672"]="[UDP/4672] eMule AdunanzA, porta di default per il protocollo eDonkey usato da eMule AdunanzA on "
udp_ports["7659"]="[UDP/7659] Polypheny interfaccia utente on "
udp_ports["9987"]="[UDP/9987] TeamSpeak, software VoIP proprietario, porta di default 'virtual voice server' on "
udp_ports["1900"]="[UDP/1900] Plex, Accesso al Plex DLNA Server on "
udp_ports["32410"]="[UDP/32410] Plex, rilevamento corrente della rete GDM on "
udp_ports["32412"]="[UDP/32412] Plex, rilevamento corrente della rete GDM on "
udp_ports["32413"]="[UDP/32413] Plex, rilevamento corrente della rete GDM on "
udp_ports["32414"]="[UDP/32414] Plex, rilevamento corrente della rete GDM on "
udp_ports["51820"]="[UDP/51820] Porta di Wireguard VPN on "

if [ $# -eq 0 ]; then echo -e "Welcome in shmap by k0d14k\nUsage:\n\t--ip\t\tSpecifies the IP address\n\t--ports\t\tSpecifies the port range from 1 to value\n\t--subnet\tSpecifies a subnet in the format of 192.168.0.x\n\n\nTips:\nCTRL+C will kill the app in ip enumeration and will skip the current IP in subnet enumeration"; fi
while [ "$1" != "" ]; do
	case "$1" in
		--ip )		ip="$2";	shift;;
		--ports )	ports="$2";	shift;;
		--subnet )	subnet="$2";	shift;;
	esac
	shift
done

if [[ $ip == "" && $subnet == "" ]]; then exit; fi
if [[ $ports == "" ]]; then exit; fi

#######################################################
# Function to check ICMP using ping (if is installed) #
#######################################################
check_icmp() {
	ping -c 1 $ip &>/dev/null
	if [ $? -eq 0 ]; then
		echo "Host $ip reachable"
	else
		echo "ICMP is not available on $ip"
	fi
}
#######################################################



#######################################################
# Function to check TCP ports                         #
#######################################################
check_tcp_port(){
	port=$1
	(echo > /dev/tcp/$ip/$port) &>/dev/null
	if [ $? -eq 0 ]; then
		if [[ -z ${tcp_ports["$port"]} ]]; then
  			echo -e "\r[TCP/$port] UNKNOWN on $ip"
		else
			echo -e "\r"${tcp_ports[$port]} $ip
		fi
	fi
}
#######################################################



##########################################################
# Function to check UDP Ports using nc (if is installed) #
##########################################################
check_udp_port() {
	port=$1
	nc -zvu $ip $port &>/dev/null
	if [ $? -eq 0 ]; then
		if [[ -z ${udp_ports["$port"]} ]]; then
  			echo -e "\r[UDP/$port] UNKNOWN on $ip"
		else
			echo -e "\r"${udp_ports[$port]} $ip
		fi
	fi
}
##########################################################


#######################################################################
# Main Function                                                       #
#######################################################################
which ping &>/dev/null
check_ping=$?
if [ $check_ping -eq 0 ]; then check_icmp; fi
which nc &>/dev/null
check_udp=$?

main(){
	echo -ne "\n"
	port_loop=1
	while [ $port_loop -eq 1 ] 
	do
		for port in $(seq 1 $ports); do
			trap break_loop SIGINT
			if [ $port_loop -eq 0 ]; then break; fi
			echo -ne "\r[$ip]:$port/$ports"
			check_tcp_port $port | tee -a ./shmap/results/tcp/$ip-tcp-scan.txt
			if [ $check_udp -eq 0 ]; then check_udp_port $port | tee -a ./shmap/results/udp/$ip-udp-scan.txt; fi
		done
		port_loop=0
	done
}
#######################################################################

######################
# Trap Functions     #
######################
function break_loop {
    port_loop=0
}
######################

if [ -n "$subnet" ] && [ "$subnet" != "" ]; then
	echo "###########################################################"
	echo "#                    SHMAP - by k0d14k                    #"
	echo "###########################################################"
	echo "# Subnet: $subnet"
	echo "# Port Range: [1 - $ports]"
	if [ $check_ping -eq 1 ]; then echo "# ICMP Scan enabled: No"; else echo "# ICMP Scan enabled: Yes"; fi
	echo "# TCP Scan enabled: Yes"
	if [ $check_udp -eq 1 ]; then echo "# UDP Scan enabled: No"; else echo "# UDP Scan enabled: Yes"; fi
	echo "###########################################################"
	for i in {1..254}; do
		ip=$(echo $subnet | sed "s/x/$i/g");
		main
	done
else
	echo "###########################################################"
	echo "#                    SHMAP - by k0d14k                    #"
	echo "###########################################################"
	echo "# IP: $ip"
	echo "# Port Range: [1 - $ports]"
	if [ $check_ping -eq 1 ]; then echo "# ICMP Scan enabled: No"; else echo "# ICMP Scan enabled: Yes"; fi
	echo "# TCP Scan enabled: Yes"
	if [ $check_udp -eq 1 ]; then echo "# UDP Scan enabled: No"; else echo "# UDP Scan enabled: Yes"; fi
	echo "###########################################################"
	main
fi