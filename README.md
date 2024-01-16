<!--
╔════════════════════════════════════════════════════════════════════════════════════╗
║                                                                                    ║
║   Copyright (c) 2020 https://prrvchr.github.io                                     ║
║                                                                                    ║
║   Permission is hereby granted, free of charge, to any person obtaining            ║
║   a copy of this software and associated documentation files (the "Software"),     ║
║   to deal in the Software without restriction, including without limitation        ║
║   the rights to use, copy, modify, merge, publish, distribute, sublicense,         ║
║   and/or sell copies of the Software, and to permit persons to whom the Software   ║
║   is furnished to do so, subject to the following conditions:                      ║
║                                                                                    ║
║   The above copyright notice and this permission notice shall be included in       ║
║   all copies or substantial portions of the Software.                              ║
║                                                                                    ║
║   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                  ║
║   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                  ║
║   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.        ║
║   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY             ║
║   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,             ║
║   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE       ║
║   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                    ║
║                                                                                    ║
╚════════════════════════════════════════════════════════════════════════════════════╝
-->
# [![dDriveOOo logo][1]][2] Documentation

**Ce [document][3] en français.**

**The use of this software subjects you to our [Terms Of Use][4] and [Data Protection Policy][5].**

# version [1.1.0][6]

## Introduction:

**dDriveOOo** is part of a [Suite][7] of [LibreOffice][8] ~~and/or [OpenOffice][9]~~ extensions allowing to offer you innovative services in these office suites.  
This extension allows you to work in LibreOffice on your Dropbox files, even while offline.

Being free software I encourage you:
- To duplicate its [source code][10].
- To make changes, corrections, improvements.
- To open [issue][11] if needed.

In short, to participate in the development of this extension.
Because it is together that we can make Free Software smarter.

___

## Requirement:

The dDriveOOo extension uses the OAuth2OOo extension to work.  
It must therefore meet the [requirement of the OAuth2OOo extension][12].

The dDriveOOo extension uses the jdbcDriverOOo extension to work.  
It must therefore meet the [requirement of the jdbcDriverOOo extension][13].

**On Linux and macOS the Python packages** used by the extension, if already installed, may come from the system and therefore **may not be up to date**.  
To ensure that your Python packages are up to date it is recommended to use the **System Info** option in the extension Options accessible by:  
**Tools -> Options -> Internet -> dDriveOOo -> View log -> System Info**  
If outdated packages appear, you can update them with the command:  
`pip install --upgrade <package-name>`

For more information see: [What has been done for version 1.1.0][14].

___

## Installation:

It seems important that the file was not renamed when it was downloaded.
If necessary, rename it before installing it.

- [![OAuth2OOo logo][17]][18] Install **[OAuth2OOo.oxt][19]** extension [![Version][20]][19]

    You must first install this extension, if it is not already installed.

- [![jdbcDriverOOo logo][21]][22] Install **[jdbcDriverOOo.oxt][23]** extension [![Version][24]][23]

    You must install this extension, if it is not already installed.

- ![dDriveOOo logo][25] Install **[dDriveOOo.oxt][26]** extension [![Version][27]][26]

Restart LibreOffice after installation.

**On Windows, restarting LibreOffice may not be enough.**  
To ensure that LibreOffice restarts correctly, use the Windows Task Manager to verify that no LibreOffice services are visible after LibreOffice is shut down.

___

## Use:

**Open your Dropbox files:**

In **File -> Open** enter in the first drop-down list:

- For a named Url: **vnd-dropbox://your_email@your_provider**  

or

- For an unnamed Url (anonymous): **vnd-dropbox:///**

And validate not by the **Open** button but by the **Enter** key.

If you don't give **your_email@your_provider**, you will be asked for...

Anonymous Urls allow you to remain anonymous (your account does not appear in the Url) while named Urls allow you to access several accounts simultaneously.

After authorizing the [OAuth2OOo][18] application to access your Dropbox files, your Dropbox files should appear!!! normally  :wink:

___

## Has been tested with:

* LibreOffice 7.3.7.2 - Lubuntu 22.04 - Python version 3.10.12

* LibreOffice 7.5.4.2(x86) - Windows 10 - Python version 3.8.16 (under Lubuntu 22.04 / VirtualBox 6.1.38)

* LibreOffice 7.4.3.2(x64) - Windows 10(x64) - Python version 3.8.15 (under Lubuntu 22.04 / VirtualBox 6.1.38)

* **Does not work with OpenOffice** see [bug 128569][28]. Having no solution, I encourage you to install **LibreOffice**.

I encourage you in case of problem :confused:  
to create an [issue][11]  
I will try to solve it :smile:

___

## Historical:

### What has been done for version 0.0.5:

- Integration and use of the new Hsqldb v2.5.1 system versioning.

- Writing of a new [Replicator][29] interface, launched in the background (python Thread) responsible for:

    - Perform the necessary procedures when creating a new user (initial Pull).

    - Carry out pulls regularly (every ten minutes) in order to synchronize any external changes (Pull all changes).

    - Replicate on demand all changes to the hsqldb 2.5.1 database using system versioning (Push all changes).

- Writing of a new [DataBase][30] interface, responsible for making all calls to the database.

- Setting up a cache on the Identifiers, see method: [_getUser()][31], allowing access to a Content (file or folder) without access to the database for subsequent calls.

- Management of duplicate file/folder names by [SQL Views][32]: Child, Twin, Uri, and Title generating unique names if duplicates names exist.  
Although this functionality is only needed for gDriveOOo, it is implemented globally...

- Many other fix...

### What has been done for version 0.0.6:

- Using new scheme: **vnd-dropbox://** as claimed by [draft-king-vnd-urlscheme-03.txt][33]

- Achievement of handling duplicate file/folder names by SQL views in HsqlDB:
    - A [**Twin**][34] view grouping all the duplicates by parent folder and ordering them by creation date, modification date.
    - A [**Uri**][35] view generating unique indexes for each duplicate.
    - A [**Title**][36] view generating unique names for each duplicate.
    - A recursive view [**Path**][37] to generate a unique path for each file / folder.

- Creation of a [Provider][38] able to respond to the two types of Urls supported (named and anonymous).  
  Regular expressions (regex), declared in the [UCB configuration file][39], are now used by OpenOffice/LibreOffice to send URLs to the appropriate ContentProvider.

- Use of the new UNO struct [DateTimeWithTimezone][40] provided by the extension [jdbcDriverOOo][22] since its version 0.0.4.  
  Although this struct already exists in LibreOffice, its creation was necessary in order to remain compatible with OpenOffice (see [Enhancement Request 128560][41]).

- Modification of the [Replicator][29] interface, in order to allow:
    - To choose the data synchronization order (local first then remote or vice versa).
    - Synchronization of local changes by atomic operations performed in chronological order to fully support offline work.  
    To do this, three SQL procedures [GetPushItems][42], [GetPushProperties][43] and [UpdatePushItems][44] are used for each user who has accessed his files / folders.

- Rewrite of the [options window][45] accessible by: **Tools -> Options -> Internet -> dDriveOOo** in order to allow:
    - Access to the two log files concerning the activities of the UCP and the data replicator.
    - Choice of synchronization order.
    - The modification of the interval between two synchronizations.
    - Access to the underlying HsqlDB 2.7.2 database managing your Dropbox metadata.

- The presence or absence of a trailing slash in the Url is now supported.

- Many other fix...

### What has been done for version 1.0.1:

- Implementation of the management of shared files.

- The name of the shared folder can be defined before any connection in: **Tools -> Options -> Internet -> dDriveOOo -> Handle shared documents in folder:**

- Many other fix...

### What has been done for version 1.0.2:

- The absence or obsolescence of the **OAuth2OOo** and/or **jdbcDriverOOo** extensions necessary for the proper functioning of **dDriveOOo** now displays an error message.

- Many other things...

### What has been done for version 1.0.3:

- Support for version **1.2.0** of the **OAuth2OOo** extension. Previous versions will not work with **OAuth2OOo** extension 1.2.0 or higher.

### What has been done for version 1.0.4:

- Support for version **1.2.1** of the **OAuth2OOo** extension. Previous versions will not work with **OAuth2OOo** extension 1.2.1 or higher.

### What has been done for version 1.0.5:

- Support for version **1.2.3** of the **OAuth2OOo** extension. Fixed [issue #12][46].

### What has been done for version 1.0.6:

- Support for version **1.2.4** of the **OAuth2OOo** extension. Many issues resolved.

### What has been done for version 1.0.7:

- Now use Python dateutil package to convert to UNO DateTime.

### What has been done for version 1.1.0:

- All Python packages necessary for the extension are now recorded in a [requirements.txt][47] file following [PEP 508][48].
- Now if you are not on Windows then the Python packages necessary for the extension can be easily installed with the command:  
  `pip install requirements.txt`
- Modification of the [Requirement][49] section.

### What remains to be done for version 1.1.0:

- Add new language for internationalization...

- Anything welcome...

[1]: </img/drive.svg#collapse>
[2]: <https://prrvchr.github.io/dDriveOOo/>
[3]: <https://prrvchr.github.io/dDriveOOo/README_fr>
[4]: <https://prrvchr.github.io/dDriveOOo/source/dDriveOOo/registration/TermsOfUse_en>
[5]: <https://prrvchr.github.io/dDriveOOo/source/dDriveOOo/registration/PrivacyPolicy_en>
[6]: <https://prrvchr.github.io/dDriveOOo#historical>
[7]: <https://prrvchr.github.io/>
[8]: <https://www.libreoffice.org/download/download/>
[9]: <https://www.openoffice.org/download/index.html>
[10]: <https://github.com/prrvchr/dDriveOOo>
[11]: <https://github.com/prrvchr/dDriveOOo/issues/new>
[12]: <https://prrvchr.github.io/OAuth2OOo/#requirement>
[13]: <https://prrvchr.github.io/jdbcDriverOOo/#requirement>
[14]: <https://prrvchr.github.io/dDriveOOo/#what-has-been-done-for-version-110>
[17]: <https://prrvchr.github.io/OAuth2OOo/img/OAuth2OOo.svg#middle>
[18]: <https://prrvchr.github.io/OAuth2OOo>
[19]: <https://github.com/prrvchr/OAuth2OOo/releases/latest/download/OAuth2OOo.oxt>
[20]: <https://img.shields.io/github/v/tag/prrvchr/OAuth2OOo?label=latest#right>
[21]: <https://prrvchr.github.io/jdbcDriverOOo/img/jdbcDriverOOo.svg#middle>
[22]: <https://prrvchr.github.io/jdbcDriverOOo>
[23]: <https://github.com/prrvchr/jdbcDriverOOo/releases/latest/download/jdbcDriverOOo.oxt>
[24]: <https://img.shields.io/github/v/tag/prrvchr/jdbcDriverOOo?label=latest#right>
[25]: <img/dDriveOOo.svg#middle>
[26]: <https://github.com/prrvchr/dDriveOOo/releases/latest/download/dDriveOOo.oxt>
[27]: <https://img.shields.io/github/downloads/prrvchr/dDriveOOo/latest/total?label=v1.0.7#right>
[28]: <https://bz.apache.org/ooo/show_bug.cgi?id=128569>
[29]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/replicator.py>
[30]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/database.py>
[31]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/datasource.py#L127>
[32]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py>
[33]: <https://datatracker.ietf.org/doc/html/draft-king-vnd-urlscheme-03>
[34]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L163>
[35]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L173>
[36]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L193>
[37]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L213>
[38]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/ucp/provider.py>
[39]: <https://github.com/prrvchr/dDriveOOo/blob/master/source/dDriveOOo/dDriveOOo.xcu#L42>
[40]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/rdb/idl/io/github/prrvchr/css/util/DateTimeWithTimezone.idl>
[41]: <https://bz.apache.org/ooo/show_bug.cgi?id=128560>
[42]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L512>
[43]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L557>
[44]: <https://github.com/prrvchr/dDriveOOo/blob/master/uno/lib/uno/ucb/dbqueries.py#L494>
[45]: <https://github.com/prrvchr/dDriveOOo/tree/master/uno/lib/uno/options/ucb>
[46]: <https://github.com/prrvchr/gDriveOOo/issues/12>
[47]: <https://github.com/prrvchr/mDriveOOo/tree/master/source/mDriveOOo/requirements.txt>
[48]: <https://peps.python.org/pep-0508/>
[49]: <https://prrvchr.github.io/mDriveOOo/#requirement>
