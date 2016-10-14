# README

[![N|Solid](https://vericlouds.com/wp-content/uploads/2016/04/logo.png)](https://vericlouds.com/)

This is the Active Directory Server package, what it does:
  - Fetch account credential from Active Directory
  - Format and forward data to Splunk Dashboard app

### Prerequsite

Python, Active Directory need to be preinstalled.

### Installation
Perform the following steps to install this package:

Download Splunk Universal Forwarder from Splunk website and install it on the Active Directory Server

Then,
 ```sh
$ cd SplunkUniversalForwarder\etc
```

Edit file splunk-launch.conf to uncomment the SPLUNK_HOME env definition

Run splunk services as a domain controller for PowerShell script to work 

You need to activate forwarding as per your server details, by replacing the hostname below with your Splunk Index Server's hostname or IP address, and receiving-port by the Splunk Index Server's listening port:
 ```sh
$ Splunk add forward-server <hostname/ip>:receiving-port
```
Create a new folder vericlouds inside the  $SPLUNK_HOME/etc/apps/
 ```sh
$ cd $SPLUNK_HOME/etc/apps/
$ mkdir vericlouds
```

Download the package from  [universal forwarder part](https://github.com/appbugs/splunk-app/tree/master/Universal%20Forwarder%20Part) and copy the cotents into $SPLUNK_HOME/etc/apps/vericlouds/

Restart the Universal Forwarder
 ```sh
$ cd $SPLUNK_HOME/bin
$ splunk restart
```

### Configuration

Change the forwarding schedule by modifying file $SPLUNK_HOME\etc\apps\vericlouds\default\inputs.conf

### Development

Want to contribute? Great!

License
----

MIT
