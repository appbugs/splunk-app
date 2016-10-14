# README

[![N|Solid](https://vericlouds.com/wp-content/uploads/2016/04/logo.png)](https://vericlouds.com/)

This is a Splunk App that monitors compromised account on your Active Directory, what it does:
  - Fetch account credential from Active Directory
  - Looks for compromised account and display the finding

### Prerequsite

Python and Splunk Enterprise edition need to be preinstalled.

### Installation
Perform the following steps to install this app.

Create a new folder vericlouds inside the  $SPLUNK_HOME/etc/apps/
 ```sh
$ cd $SPLUNK_HOME/etc/apps/
$ mkdir vericlouds
```

Download the vericlouds splunk app from [github](https://github.com/appbugs/splunk-app/tree/master/Splunk%20Server) and copy the cotents into $SPLUNK_HOME/etc/apps/vericlouds/

Restart the Splunk
 ```sh
$ cd $SPLUNK_HOME/bin
$ splunk restart
```

Open Splunk dashboard, select vericlouds app, a page will be displayed to ask you enter vericlouds REST API link, enter the correct link then save.

Dashboard page will display, which will show you the accounts compromised.

### Configuration

Change the REST API polling schedule by going to:   
- Setting->Data Input->REST->Vericlouds_DataFetch

change the interval value then save

### Development

Want to contribute? Great!

License
----

MIT
