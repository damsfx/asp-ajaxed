﻿<%
'**************************************************************************************************************
'* Michal Gabrukiewicz Copyright (C) 2007 									
'* For license refer to the license.txt 									
'**************************************************************************************************************

'Uncomment the line if you want to use a configuration variable
'In 90% cases you don't need to change anything.
'(most of those settings are properties of classes and are initialized when the class is instantiated,
'therefore this means that you can change it after initialization also.)
'only the most common config variables are listed here. Check the documentation for even more configuration possibilities

'**************************************************************************************************************

'The environment. choose between LIVE or DEV. no setting always results in DEV
	'const AJAXED_ENVIRONMENT = "DEV"

'The vitual location to the ajaxed folder. must end AND start with an SLASH! (/)
	'const AJAXED_LOCATION = "/ajaxed/"

'The text which appears when a callback is being performed and the user has to wait
	'const AJAXED_LOADINGTEXT = "loading..."

'should the prototype JavaScript library be automatically loaded on every page?
	'const AJAXED_LOADPROTOTYPEJS = true

'the caption for the errors used with error() method
	'const AJAXED_ERRORCAPTION = "Erroro: "

'sets the response.buffer for each page.
	'const AJAXED_BUFFERING = true

'ID of the form which should be used by default when no form is specified
	'const AJAXED_FORMID = "frm"

'Advanced: should the codepage be set to the session directly?
'this is only recommended if you have IIS5 or lower which does not support
'setting the codepage directly. If you experience an codepage property error then turn this on.
	'const AJAXED_SESSION_CODEPAGE = true

'EMAIL CONFIGS
	'const AJAXED_MAILSERVER = "mail.domain.com"
	'const AJAXED_EMAIL_SENDER = "email@domain.com"
	'const AJAXED_EMAIL_SENDER_NAME = "your website"

'useful when developing
'if all emails should be sent to one email address (e.g. yours).
	'const AJAXED_EMAIL_ALLTO = "youremail@host.com"

'turn dispatching of if you dont want to dispatch the messages 
	'const AJAXED_EMAIL_DISPATCH = false

'DATABASE CONFIGS
'Should the database connection be established automatically on each page.
	'const AJAXED_DBCONNECTION = true

'If you want to use a database with the ajaxed Library then configure a proper connectionstring
'to your database. Some are suggested below. uncomment if applicable
'MSSQL
	'const AJAXED_CONNSTRING = "Driver={SQL Server};Server=localhost;Database=YOUR_DB;Uid=YOUR_USER;Pwd=YOUR_PASSWORD;"
'mySQL
	'const AJAXED_CONNSTRING = "Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=YOUR_DB;User=YOUR_USER;Password=YOUR_PASSWORD;Option=3;"
'MS ACCESS 2008
	'const AJAXED_CONNSTRING = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\myFolder\myAccess2007file.accdb;Persist Security Info=False;"
'MS ACCESS 2000-2003
	'const AJAXED_CONNSTRING = "Driver={Microsoft Access Driver (*.mdb)};Dbq=test.mdb;"
'PostgreSQL
	'const AJAXED_CONNSTRING = "Driver={PostgreSQL};Server=localhost;Port=5432;Database=YOUR_DB;Uid=YOUR_USER;Pwd=YOUR_PASSWORD;"
'Oracle
	'const AJAXED_CONNSTRING = "Driver={Microsoft ODBC for Oracle};Server=localhost;Uid=YOUR_USER;Pwd=YOUR_PASSWORD;"
'Sqlite with ODBC - (odbc driver http://www.ch-werner.de/sqliteodbc/)
	'const AJAXED_CONNSTRING = "DRIVER=SQLite3 ODBC Driver;Database=mydb.sqlite;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;"
%>