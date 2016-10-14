# Vericlouds Splunk App HowTo 

[![N|Solid](https://vericlouds.com/wp-content/uploads/2016/04/logo.png)](https://vericlouds.com/)

You have signed up for the VeriClouds App for Splunk, this app helps automatically detect email accounts with compromised passwords in your organization. 

This app has two halves, one half is installed on the Splunk Index Server, the other half is installed on a server that hosts Active Directory, below are instructions on how to install each half.

## Install and config on Splunk Index Server 

### Prerequsite

Python and Splunk Enterprise edition need to be preinstalled and running.

### Installation
The Vericlouds app will be installed as an app on Splunk Index Server by
Performing the following steps:

1. Create a new folder vericlouds inside the  $SPLUNK_HOME/etc/apps/

```sh
$ cd $SPLUNK_HOME/etc/apps/
$ mkdir vericlouds
```

2. Download the vericlouds splunk app from [github](https://github.com/appbugs/splunk-app) and install:

```sh
$ git clone https://github.com/appbugs/splunk-app.git 
$ cd /splunk-app/Splunk Server
$ copy * $SPLUNK_HOME/etc/apps/vericlouds/ splunk $SPLUNK_HOME/etc/apps/
```

3. Restart the Splunk Server

```sh
$ cd $SPLUNK_HOME/bin
$ splunk restart
```

4. Open Splunk dashboard, select vericlouds app, a page will be displayed to ask you enter vericlouds REST API link, enter the correct link then save.
5. Vericlouds Dashboard will display, which will show you the accounts compromised.

### Configuration

Change the REST API polling schedule by going to:   
- Setting->Data Input->REST->Vericlouds_DataFetch

change the interval value then save

## Install and config on Server hosting Active Directory
### Prerequsite

Python and Active Directory need to be preinstalled and running.

### Installation

1. Dowload and install Splunk Universal Forwarder
2. Activate forwarding to your Splunk Index Server as per your server's setup, by replacing the hostname below with your Splunk Index Server's hostname or IP address, and receiving-port by the Splunk Index Server's listening port:

```sh
$ Splunk add forward-server <hostname/ip>:receiving-port
$ splunk restart
```

3. Create Vericlouds folder

```sh
$ cd $SPLUNK_HOME/etc/apps/
$ mkdir vericlouds
```

4. Install the vericlouds app

```sh
$ git clone https://github.com/appbugs/splunk-app.git 
$ cd /splunk-app/Universal Forwarder Part
$ copy * $SPLUNK_HOME/etc/apps/vericlouds/ splunk $SPLUNK_HOME/etc/apps/
```

5. Restart Forwarder

```sh
$ splunk restart
```

### Configuration

Change the forwarding schedule by modifying file $SPLUNK_HOME\etc\apps\vericlouds\default\inputs.conf

open the file for edit, change the interval value then save

