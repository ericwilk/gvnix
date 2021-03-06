gvNIX - Spring Roo Addon Suite
======================================

Welcome to gvNIX, an Spring Roo Addon Suite.

gvNIX is an Spring Roo Addon Suite that focuses both enterprise knowledge and enterprise standards to build Java applications.

gvNIX is sponsored by the <a href="http://www.dgti.gva.es/" target="_blank">General Directorate for Information Technologies</a> (DGTI) at Regional Ministry of Finance and Public Administration of the Generalitat Valenciana (Valencian Community, Spain), and led by <a href="http://www.disid.com" target="_blank">DISID</a>.

About this doc
==============

These instructions show you how to get started with gvNIX source tree. Note
that these instructions are for developers looking to develop gvNIX itself.

If you like to try a release that has already been built, tested and
distributed by the core development team, we recommend that you visit gvNIX
download page http://www.gvnix.org and read the documentation.

Copyright (C) 2010 Conselleria d'Infraestructures i Transport - Generalitat Valenciana

This work is licensed under the Creative Commons Attribution-Share Alike 3.0
Unported License. To view a copy of this license, visit
http://creativecommons.org/licenses/by-sa/3.0/

Pre-requisites
==============

To start to develop gvNIX and extend its features you need:

* Last Spring Roo distribution (http://spring.io/projects/spring-roo)
* JDK 7 or above ( http://www.oracle.com/technetwork/es/java/javase/downloads/index.html)
* Maven 3.0.5 or above ( http://maven.apache.org/download.html ) 
* Internet access so that Maven can download required dependencies

Run gvNIX Roo Addon Suite
===========================

TBC

Developing within STS
==========================

STS can be used to develop gvNIX Roo Addon Suite. 

Every addon can be imported via *File > Import > Maven > Existing Maven Project*.

Documentation
=============

Documentation index
-------------------

* On each gvNIX project module you can find technical and user guides in the *module/docs/* folder in reStructuredText format and English:

  * td-module.rst: Technical design
  * ug-module.rst: User guide

* gvNIX work guides are placed at src/site/docbook/ in docbook format and Spanish (deprecated):

  * reference: Working guide about projects development with gvNIX.
  * developer: Working guide about gvNIX project development.

* gvNIX work guides are placed at src/site/asciidoc/ in AsciiDoc format and Spanish:

  * reference: Working guide about projects development with gvNIX.
  * developer: Working guide about gvNIX project development.

Need more info ?
----------------

For more information generate and read the *gvNIX Developer Guide* (Spanish).

Run the following command from the root checkout location:

   bash:~/gvnix$ mvn site

This will create the guide in the "target/site/developer" directory (in several formats):

    target
    |-- docbkx
    |	`-- pdf
    |		`-- index.pdf (reference guide)
    `-- site
    	|-- index.html
        |-- developer
        |   |-- html
        |   |   |-- index.html
        |   |   `-- ...
        |   `-- html-single
        |       `-- index.html
        `-- reference
            |-- html
            |   |-- index.html
            |   `-- ...
            `-- html-single
                `-- index.html

The *gvNIX Reference Guide* (Spanish) is the documentation for developing projects with the framework.

And will create a site with the project summary (target/site/index.html).


Write doc
---------

* Download and install XMLmind XML Editor Personal Edition ( http://www.xmlmind.com/xmleditor/download.shtml )
* Use the previous editor to open ``src/site/docbook/developer/index.xml`` and contribute with your knowledge.

gvNIX documentation is moving to AsciiDoc. These docs have the suffix .ad, .adoc or .asciidoc. To learn more about how to convert AsciiDoc to PDF, HTML5, etc go to http://asciidoc.org/ or http://asciidoctor.org/


Contribute to gvNIX Project
==============================

Do you want to contribute to gvNIX Project? :D

Create an issue
-----------------
Create a new issue on gitHub using the following link https://github.com/gvSIGAssociation/gvnix/issues/new

Send your Pull Requests
------------------------

Fork gvNIX project and implement your own features or bug fixes

Send your Pull Requests with your applied changes

gvNIX team will validate your changes and merge your Pull Request


Contact us ?
------------

* http://www.gvnix.org
* http://www.disid.com
* https://github.com/gvSIGAssociation/gvnix
* If you use Twitter, you are encouraged to follow @gvNIX and we appreciate your mentions.



