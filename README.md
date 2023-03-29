# ![DropboxOOo logo][1] DropboxOOo
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

**Ce [document][2] en français.**

**The use of this software subjects you to our** [Terms Of Use][3] **and** [Data Protection Policy][4].

# version [0.0.6][5]

## Introduction:

**DropboxOOo** is part of a [Suite][6] of [LibreOffice][7] and/or [OpenOffice][8] extensions allowing to offer you innovative services in these office suites.  
This extension allows you to work in LibreOffice / OpenOffice on your Dropbox files, even while offline.

Being free software I encourage you:
- To duplicate its [source code][9].
- To make changes, corrections, improvements.
- To open [issue][10] if needed.

In short, to participate in the development of this extension.
Because it is together that we can make Free Software smarter.

## Requirement:

DropboxOOo uses a local [HsqlDB][11] database version 2.5.1.  
HsqlDB being a database written in Java, its use requires the [installation and configuration][12] in LibreOffice / OpenOffice of a **JRE version 11 or later**.  
I recommend [Adoptium][13] as your Java installation source.

If you are using **LibreOffice on Linux**, then you are subject to [bug 139538][14].  
To work around the problem, please uninstall the packages:
- libreoffice-sdbc-hsqldb
- libhsqldb1.8.0-java

If you still want to use the Embedded HsqlDB functionality provided by LibreOffice, then install the [HsqlDBembeddedOOo][15] extension.  
OpenOffice and LibreOffice on Windows are not subject to this malfunction.

## Installation:

It seems important that the file was not renamed when it was downloaded.
If necessary, rename it before installing it.

- Install ![OAuth2OOo logo][16] **[OAuth2OOo.oxt][17]** extension version 0.0.6.

You must first install this extension, if it is not already installed.

- Install ![jdbcDriverOOo logo][18] **[jdbcDriverOOo.oxt][19]** extension version 0.0.4.

You must install this extension, if it is not already installed.

- Install ![DropboxOOo logo][1] **[DropboxOOo.oxt][20]** extension version 0.0.6.

Restart LibreOffice / OpenOffice after installation.

## Configuration:

Configure LibreOffice Open / Save dialogs (not necessary with OpenOffice):

- **For LibreOffice V5.x and before:**

In menu Tools - Options - LibreOffice - General: check use LibreOffice dialogs.

- **For LibreOffice V6.x and above:**

In menu Tools - Options - LibreOffice - Advanced - Open Expert Configuration

Search for: UseSystemFileDialog (Found under: org.openoffice.Office.Common > Misc)

Edit or change "true" to "false" (set it to "false")

## Use:

**Open your Dropbox files:**

In File - Open - File name enter:

- **vnd-dropbox://your_emailaddress**
  with **your_emailaddress** which must be located on the following domain names:

  - **account@outlook.com**
    or
  - **account@outlook.fr**
    or
  - **account@hotmail.com**
    or
  - **account@gmail.com**

or

- **vnd-dropbox:///**

If you don't give **your_emailaddress**, you will be asked for...

After authorizing the [OAuth2OOo][21] application to access your Dropbox files, your Dropbox files should appear!!! normally  ;-)

## Has been tested with:

* LibreOffice 6.4.4.2 - Ubuntu 20.04 -  LxQt 0.14.1

* LibreOffice 7.0.0.0.alpha1 - Ubuntu 20.04 -  LxQt 0.14.1

* OpenOffice 4.1.8 x86_64 - Ubuntu 20.04 - LxQt 0.14.1

* OpenOffice 4.2.0.Build:9820 x86_64 - Ubuntu 20.04 - LxQt 0.14.1

* LibreOffice 6.1.5.2 - Raspbian 10 buster - Raspberry Pi 4 Model B

* LibreOffice 6.4.4.2 (x64) - Windows 7 SP1

I encourage you in case of problem :-(  
to create an [issue][10]  
I will try to solve it ;-)

## Historical:

### What has been done for version 0.0.5:

- Integration and use of the new Hsqldb v2.5.1 system versioning.

- Writing of a new [Replicator interface][22], launched in the background (python Thread) responsible for:

    - Perform the necessary procedures when creating a new user (initial Pull).

    - Carry out pulls regularly (every ten minutes) in order to synchronize any external changes (Pull all changes).

    - Replicate on demand all changes to the hsqldb 2.5.1 database using system versioning (Push all changes).

- Writing of a new [DataBase interface][23], responsible for making all calls to the database.

- Setting up a cache on the Identifiers, see method: [getIdentifier()][24], allowing access to a Content (file or folder) without access to the database for subsequent calls.

- Management of duplicate file/folder names by [SQL Views][25]: Child, Twin, Uri, and Title generating unique names if duplicates names exist.  
Although this functionality is only needed for gDriveOOo, it is implemented globally...

- Many other fix...

### What has been done for version 0.0.6:

- Using new scheme: **vnd-dropbox://** as claimed by [draft-king-vnd-urlscheme-03.txt][26]

- The trailing slash in the Uri is no longer needed.

- Many other fix...

### What remains to be done for version 0.0.6:

- Write the implementation Pull Change in the new [Replicator interface][22].

- Add new language for internationalization...

- Anything welcome...

[1]: <img/DropboxOOo.png>
[2]: <https://prrvchr.github.io/DropboxOOo/README_fr>
[3]: <https://prrvchr.github.io/DropboxOOo/source/DropboxOOo/registration/TermsOfUse_en>
[4]: <https://prrvchr.github.io/DropboxOOo/source/DropboxOOo/registration/PrivacyPolicy_en>
[5]: <https://prrvchr.github.io/DropboxOOo#historical>
[6]: <https://prrvchr.github.io/>
[7]: <https://www.libreoffice.org/download/download/>
[8]: <https://www.openoffice.org/download/index.html>
[9]: <https://github.com/prrvchr/DropboxOOo>
[10]: <https://github.com/prrvchr/DropboxOOo/issues/new>
[11]: <http://hsqldb.org/>
[12]: <https://wiki.documentfoundation.org/Documentation/HowTo/Install_the_correct_JRE_-_LibreOffice_on_Windows_10>
[13]: <https://adoptium.net/releases.html?variant=openjdk11>
[14]: <https://bugs.documentfoundation.org/show_bug.cgi?id=139538>
[15]: <https://prrvchr.github.io/HsqlDBembeddedOOo/>
[16]: <https://prrvchr.github.io/OAuth2OOo/img/OAuth2OOo.png>
[17]: <https://github.com/prrvchr/OAuth2OOo/raw/master/OAuth2OOo.oxt>
[18]: <https://prrvchr.github.io/jdbcDriverOOo/img/jdbcDriverOOo.png>
[19]: <https://github.com/prrvchr/jdbcDriverOOo/raw/master/source/jdbcDriverOOo/dist/jdbcDriverOOo.oxt>
[20]: <https://github.com/prrvchr/DropboxOOo/raw/master/source/DropboxOOo/dist/DropboxOOo.oxt>
[21]: <https://prrvchr.github.io/OAuth2OOo>
[22]: <https://github.com/prrvchr/DropboxOOo/blob/master/uno/lib/uno/ucb/replicator.py>
[23]: <https://github.com/prrvchr/DropboxOOo/blob/master/uno/lib/uno/ucb/database.py>
[24]: <https://github.com/prrvchr/DropboxOOo/blob/master/uno/lib/uno/ucb/datasource.py>
[25]: <https://github.com/prrvchr/DropboxOOo/blob/master/uno/lib/uno/ucb/dbqueries.py>
[26]: <https://datatracker.ietf.org/doc/html/draft-king-vnd-urlscheme-00>
