
## Run all integration tests from console and form jenkins integration system daily.
## Run example:
##  ${WORKSPACE}/code/src/test/resources/integration.sh ${BINARY_PATH} ${SOURCE_PATH}
## Where input parameters are:
##  * BINARY_PATH: Path to gvNIX distribution bin folder with which execute the tests 
##  * SOURCE_PATH: Path to gvNIX root source folder for access the test scripts
## Output execution tests will be available at /tmp/gvnixtest folder

##
## Initial
##
	
	## Start graphic environment emulator to start firefox for selenium integration tests
	startx -- `which Xvfb` :1 -screen 0 1024x768x24 2>&1 >/dev/null &
	export DISPLAY=:1
	
	## Remove old potential temporal folder of previous test, create new one and go into
	rm -rf /tmp/gvnixtest
	mkdir /tmp/gvnixtest
	cd /tmp/gvnixtest

##
## Roo
##
	
	## bikeshop
    echo "======================================================"
    echo "------------------------------------------------------"
	echo bikeshop start
	mkdir bikeshop
	cd bikeshop
	$1/gvnix.sh script --file bikeshop.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true
	cd .. 
	echo bikeshop end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## clinic
    echo "======================================================"
    echo "------------------------------------------------------"
	echo clinic start
	mkdir clinic
	cd clinic
	$1/gvnix.sh script --file clinic.roo --lineNumbers true
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo clinic end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## embedding
    echo "======================================================"
    echo "------------------------------------------------------"
	echo embedding start
	mkdir embedding
	cd embedding
	$1/gvnix.sh script --file embedding.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo embedding end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## expenses
   # echo "======================================================"
    #echo "------------------------------------------------------"
	#echo expenses start
	#mkdir expenses
	#cd expenses
	#$1/gvnix.sh script --file expenses.roo --lineNumbers true
	#mvn test tomcat:run -Dmaven.tomcat.fork=true 
	#cd ..
	#echo expenses end
  #  echo "------------------------------------------------------"
   # echo "======================================================"
    #echo .

	## gae-expenses
  #  echo "======================================================"
  #  echo "------------------------------------------------------"
	#echo gae-expenses start
	#mkdir gae-expenses
	#cd gae-expenses
	#$1/gvnix.sh script --file gae-expenses.roo --lineNumbers true
	#mvn test tomcat:run -Dmaven.tomcat.fork=true 
	#cd ..
	#echo gae-expenses end
  #  echo "------------------------------------------------------"
  #  echo "======================================================"
  #  echo .

	## multimodule
    echo "======================================================"
    echo "------------------------------------------------------"
	echo multimodule start
	mkdir multimodule
	cd multimodule
	$1/gvnix.sh script --file multimodule.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo multimodule end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## pizzashop
    echo "======================================================"
    echo "------------------------------------------------------"
	echo pizzashop start
	mkdir pizzashop
	cd pizzashop
	$1/gvnix.sh script --file pizzashop.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo pizzashop end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## vote
    echo "======================================================"
    echo "------------------------------------------------------"
	echo vote start
	mkdir vote
	cd vote
	$1/gvnix.sh script --file vote.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo vote end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## wedding
    echo "======================================================"
    echo "------------------------------------------------------"
	echo wedding start
	mkdir wedding
	cd wedding
	$1/gvnix.sh script --file wedding.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo wedding end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX binding add-on
##
	
	## binding
    echo "======================================================"
    echo "------------------------------------------------------"
	echo binding start
	mkdir binding
	cd binding
	$1/gvnix.sh script --file $2/code/addon-web-mvc-binding/src/main/resources/binding.roo --lineNumbers true
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo binding end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX cit security add-on DEPRECATED
##

	## cit-security
  #  echo "======================================================"
  #  echo "------------------------------------------------------"
	#echo cit-security start
	#mkdir cit-security
	#cd cit-security
	#$1/gvnix.sh script --file $2/code/addon-cit-security/src/test/resources/cit-security.roo --lineNumbers true
	#mvn test tomcat:run &
	#mkdir target
	# Get login page when accessing a not allowed page and login in es and en languages
	#wget --retry-connrefused -O target/loginredirect.html http://localhost:8080/petclinic/pets
	#wget --retry-connrefused -O target/logines.html http://localhost:8080/petclinic/login?lang=es
	#wget --retry-connrefused -O target/loginen.html http://localhost:8080/petclinic/login?lang=en
   # MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
   # kill -9 $MVN_TOMCAT_PID
	#cd ..
	#echo cit-security end
  #  echo "------------------------------------------------------"
  #  echo "======================================================"
  #  echo .

##
## gvNIX configuration add-on
##
	
	## configuration
    echo "======================================================"
    echo "------------------------------------------------------"
	echo configuration start
	mkdir configuration
	cd configuration
	$1/gvnix.sh script --file $2/code/addon-dynamic-configuration/src/main/resources/configuration.roo --lineNumbers true
	# Start application with both configurations
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true -Pdev
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true -Ppro -Ddatabase.password=
	cd ..
	echo configuration end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX datatables add-on
##
	
	## datatables
    echo "======================================================"
    echo "------------------------------------------------------"
	echo datatables start
	mkdir datatables
	cd datatables
	$1/gvnix.sh script --file $2/code/addon-web-mvc-datatables/src/main/resources/datatables.roo --lineNumbers true
	mkdir target
    # Get datatable list pages
	#wget --retry-connrefused -O target/pets.html http://localhost:8080/petclinic/pets &
	#wget --retry-connrefused -O target/owners.html http://localhost:8080/petclinic/owners &
	#wget --retry-connrefused -O target/visits.html http://localhost:8080/petclinic/visits &
	#wget --retry-connrefused -O target/vets.html http://localhost:8080/petclinic/vets &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo datatables end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## datatables-multimodule
    echo "======================================================"
    echo "------------------------------------------------------"
	echo datatables-multimodule start
	mkdir datatables-multimodule
	cd datatables-multimodule
	$1/gvnix.sh script --file $2/code/addon-web-mvc-datatables/src/test/resources/datatables-multimodule.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
    # Get datatable list pages
	#wget --retry-connrefused -O target/pets.html http://localhost:8080/mvc/pets
	#wget --retry-connrefused -O target/owners.html http://localhost:8080/mvc/owners
	#wget --retry-connrefused -O target/visits.html http://localhost:8080/mvc/visits
	#wget --retry-connrefused -O target/vets.html http://localhost:8080/mvc/vets
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo datatables-multimodule end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## datatables-test
    echo "======================================================"
    echo "------------------------------------------------------"
	echo datatables-test start
	mkdir datatables-test
	cd datatables-test
	$1/gvnix.sh script --file $2/code/addon-web-mvc-datatables/src/test/resources/datatables-test.roo --lineNumbers true
	mkdir target
    # Get datatable list pages
	#wget --retry-connrefused -O target/pets.html http://localhost:8080/petclinic/pets &
	#wget --retry-connrefused -O target/owners.html http://localhost:8080/petclinic/owners &
	#wget --retry-connrefused -O target/visits.html http://localhost:8080/petclinic/visits &
	#wget --retry-connrefused -O target/vets.html http://localhost:8080/petclinic/vets &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo datatables-test end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## datatables-pkc
    echo "======================================================"
    echo "------------------------------------------------------"
	echo datatables-pkc start
	mkdir datatables-pkc
	cd datatables-pkc
	$1/gvnix.sh script --file $2/code/addon-web-mvc-datatables/src/test/resources/datatables-pkc.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
    # Get datatable list pages
	#wget --retry-connrefused -O target/cars.html http://localhost:8080/displayRelationsTable/cars
	#wget --retry-connrefused -O target/people.html http://localhost:8080/displayRelationsTable/people
	#wget --retry-connrefused -O target/horses.html http://localhost:8080/displayRelationsTable/horses
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo datatables-pkc end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX loupe add-on
##
	
	## loupefield
    echo "======================================================"
    echo "------------------------------------------------------"
	echo loupefield start
	mkdir loupefield
	cd loupefield
	$1/gvnix.sh script --file $2/code/addon-web-mvc-loupefield/src/main/resources/loupe.roo --lineNumbers true
	mkdir target
    # Get page with loupe fields
	#wget --retry-connrefused -O target/visits.html http://localhost:8080/petclinic/visits?form
	cd ..
	echo loupefield end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX dialog add-on
##
	
	## dialog
    echo "======================================================"
    echo "------------------------------------------------------"
	echo dialog start
	mkdir dialog
	cd dialog
	$1/gvnix.sh script --file $2/code/addon-web-dialog/src/main/resources/dialog.roo --lineNumbers true
	mkdir target
    # Get no entities dialog message in es and en languages
	#wget --retry-connrefused -O target/petses.html http://localhost:8080/petclinic/pets?lang=es&page=1&size=10 &
	#wget --retry-connrefused -O target/petsen.html http://localhost:8080/petclinic/pets?lang=en&page=1&size=10 &	
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo dialog end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX flex add-on
##
	
	## basic-flex-scaffold-test
    echo "======================================================"
    echo "------------------------------------------------------"
	echo basic-flex-scaffold-test start
	mkdir basic-flex-scaffold-test
	cd basic-flex-scaffold-test
	$1/gvnix.sh script --file $2/code/addon-flex/src/test/resources/basic-flex-scaffold-test.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
	# Request the main html with the flash 
	#wget --retry-connrefused -O target/flexrocks_scaffold.html http://localhost:8080/flexrocks/flexrocks_scaffold.html
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo basic-flex-scaffold-test end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## remoting-scaffold-all-test
    echo "======================================================"
    echo "------------------------------------------------------"
	echo remoting-scaffold-all-test start
	mkdir remoting-scaffold-all-test
	cd remoting-scaffold-all-test
	$1/gvnix.sh script --file $2/code/addon-flex/src/test/resources/remoting-scaffold-all-test.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
	# Request the main html with the flash 
	#wget --retry-connrefused -O target/flexrocks_scaffold.html http://localhost:8080/flexrocks/flexrocks_scaffold.html
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo remoting-scaffold-all-test end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## flex
    echo "======================================================"
    echo "------------------------------------------------------"
	echo flex start
	mkdir flex
	cd flex
	$1/gvnix.sh script --file $2/code/addon-flex/src/main/resources/flex.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
	# Request the main html with the flash 
	#wget --retry-connrefused -O target/flexrocks_scaffold.html http://localhost:8080/flexrocks/flexrocks_scaffold.html
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo flex end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## rootunes
    echo "======================================================"
    echo "------------------------------------------------------"
	echo rootunes start
	mkdir rootunes
	cd rootunes
	$1/gvnix.sh script --file $2/code/addon-flex/src/main/resources/rootunes.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
	# Request the main html with the flash 
	#wget --retry-connrefused -O target/rootunes_scaffold.html http://localhost:8080/rootunes/rootunes_scaffold.html
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo rootunes end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX i18n add-on
##
	
	## es-i18n
    echo "======================================================"
    echo "------------------------------------------------------"
	echo es-i18n start
	mkdir es-i18n
	cd es-i18n
	$1/gvnix.sh script --file $2/code/addon-web-i18n/src/main/resources/es-i18n.roo --lineNumbers true
	mkdir target
	# Request the main pages in ca and es languages (home, create, list and find)
	#wget --retry-connrefused -O target/langca.html http://localhost:8080/petclinic/?lang=ca &
	#wget --retry-connrefused -O target/petsformca.html http://localhost:8080/petclinic/pets?form&lang=ca &
	#wget --retry-connrefused -O target/ownersca.html http://localhost:8080/petclinic/owners?lang=ca&page=1&size=10 &
	#wget --retry-connrefused -O target/visitsfindca.html http://localhost:8080/petclinic/visits?form&find=ByDescriptionAndVisitDate&lang=ca &
	#wget --retry-connrefused -O target/langes.html http://localhost:8080/petclinic/?lang=es &
	#wget --retry-connrefused -O target/petsformes.html http://localhost:8080/petclinic/pets?form&lang=es &
	#wget --retry-connrefused -O target/ownerses.html http://localhost:8080/petclinic/owners?lang=es&page=1&size=10 &
	#wget --retry-connrefused -O target/visitsfindes.html http://localhost:8080/petclinic/visits?form&find=ByDescriptionAndVisitDate&lang=es &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo es-i18n end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX menu add-on
##
	
	## menu
    echo "======================================================"
    echo "------------------------------------------------------"
	echo menu start
	mkdir menu
	cd menu
	$1/gvnix.sh script --file $2/code/addon-web-menu/src/main/resources/menu.roo --lineNumbers true
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo menu end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## base
    echo "======================================================"
    echo "------------------------------------------------------"
	echo base start
	mkdir base
	cd base
	$1/gvnix.sh script --file $2/code/addon-web-menu/src/test/resources/base.roo --lineNumbers true
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo base end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX occ add-on
##
	
	## occ
    echo "======================================================"
    echo "------------------------------------------------------"
	echo occ start
	mkdir occ
	cd occ
	$1/gvnix.sh script --file $2/code/addon-occ/src/main/resources/occ.roo --lineNumbers true
	# Create new pet
	#wget --retry-connrefused -O target/petcreate.html http://localhost:8080/petclinic/pets --post-data 'name=a&weight=1&type=Dog' &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo occ end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX jpa add-on
##
	
	## jpa-audit-test
    echo "======================================================"
    echo "------------------------------------------------------"
	echo jpa-audit-test start
	mkdir jpa-audit
	cd jpa-audit
	$1/gvnix.sh script --file $2/code/addon-jpa/src/test/resources/jpa-audit-test.roo --lineNumbers true
	# Create new pet
	#wget --retry-connrefused -O target/petcreate.html http://localhost:8080/petclinic/pets --post-data 'name=a&weight=1&type=Dog' &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo jpa-audit-test end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## jpa-audit-envers
    echo "======================================================"
    echo "------------------------------------------------------"
	echo jpa-audit-envers start
	mkdir jpa-audit-envers
	cd jpa-audit-envers
	$1/gvnix.sh script --file $2/code/addon-jpa/src/test/resources/jpa-audit-envers.roo --lineNumbers true
	# Create new pet
	#wget --retry-connrefused -O target/petcreate.html http://localhost:8080/petclinic/pets --post-data 'name=a&weight=1&type=Dog' &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo jpa-audit-envers end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX pattern add-on
##
	
	## pattern
    echo "======================================================"
    echo "------------------------------------------------------"
	echo pattern start
	mkdir pattern
	cd pattern
	$1/gvnix.sh script --file $2/code/addon-web-pattern/src/main/resources/pattern.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	$1/gvnix.sh hint
	mvn test tomcat:run & 
	sleep 30
	#mvn selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo pattern end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## test-script-pkc
    echo "======================================================"
    echo "------------------------------------------------------"
	echo test-script-pkc start
	mkdir test-script-pkc
	cd test-script-pkc
	$1/gvnix.sh script --file $2/code/addon-web-pattern/src/test/resources/test-script-pkc.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	$1/gvnix.sh hint
	mvn test tomcat:run &
	sleep 30
	#mvn selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo test-script-pkc end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## test-script-pkc2
    echo "======================================================"
    echo "------------------------------------------------------"
	echo test-script-pkc2 start
	mkdir test-script-pkc2
	cd test-script-pkc2
	$1/gvnix.sh script --file $2/code/addon-web-pattern/src/test/resources/test-script-pkc2.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	$1/gvnix.sh hint
	mvn test tomcat:run &
	sleep 30
	#mvn selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo test-script-pkc2 end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## test-script-pkc3
    echo "======================================================"
    echo "------------------------------------------------------"
	echo test-script-pkc3 start
	mkdir test-script-pkc3
	cd test-script-pkc3
	$1/gvnix.sh script --file $2/code/addon-web-pattern/src/test/resources/test-script-pkc3.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	$1/gvnix.sh hint
	mvn test tomcat:run &
	sleep 30
	#mvn selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo test-script-pkc3 end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## test-script-manytomany
    echo "======================================================"
    echo "------------------------------------------------------"
	echo test-script-manytomany start
	mkdir test-script-manytomany
	cd test-script-manytomany
	$1/gvnix.sh script --file $2/code/addon-web-pattern/src/test/resources/test-script-manytomany.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	$1/gvnix.sh hint
	mvn test tomcat:run &
	sleep 30
	#mvn selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo test-script-manytomany end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX report add-on
##
	
	## report
    echo "======================================================"
    echo "------------------------------------------------------"
	echo report start
	mkdir report
	cd report
	$1/gvnix.sh script --file $2/code/addon-web-report/src/main/resources/report.roo --lineNumbers true
	# Start tomcat, wait to start and execute selenium tests to insert data
	mvn test tomcat:run &
	sleep 30
	#mvn selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true
	mkdir target
	# Request report form and report generation URLs for en and es languages
	#wget --retry-connrefused -O target/reportformen.html "http://localhost:8080/petclinic/pets/reports/petlist?form&lang=en"
	#wget --retry-connrefused -O target/reporten.pdf "http://localhost:8080/petclinic/pets/reports/petlist?format=pdf&lang=en"
	#wget --retry-connrefused -O target/reporten.xls "http://localhost:8080/petclinic/pets/reports/petlist?format=xls&lang=en"
	#wget --retry-connrefused -O target/reporten.html "http://localhost:8080/petclinic/pets/reports/petlist?format=html&lang=en"
	#wget --retry-connrefused -O target/reporten.csv "http://localhost:8080/petclinic/pets/reports/petlist?format=csv&lang=en"
	#wget --retry-connrefused -O target/reportformes.html "http://localhost:8080/petclinic/pets/reports/petlist?form&lang=es"
	#wget --retry-connrefused -O target/reportes.pdf "http://localhost:8080/petclinic/pets/reports/petlist?format=pdf&lang=es"
	#wget --retry-connrefused -O target/reportes.xls "http://localhost:8080/petclinic/pets/reports/petlist?format=xls&lang=es"
	#wget --retry-connrefused -O target/reportes.html "http://localhost:8080/petclinic/pets/reports/petlist?format=html&lang=es"
	#wget --retry-connrefused -O target/reportes.csv "http://localhost:8080/petclinic/pets/reports/petlist?format=csv&lang=es"
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo report end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## gvnix-test-report
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-test-report start
	mkdir gvnix-test-report
	cd gvnix-test-report
	$1/gvnix.sh script --file $2/code/addon-web-report/src/test/resources/gvnix-test-report.roo --lineNumbers true
	mkdir target
	# Request report form and report generation URLs (en language by default)
	#wget --retry-connrefused -O target/reportform.html http://localhost:8080/webreport-test/people/reports/personlist?form &
	#wget --retry-connrefused -O target/report.html http://localhost:8080/webreport-test/people/reports/personlist?format=pdf &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo gvnix-test-report end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX service add-on
##
	
	## bing
    echo "======================================================"
    echo "------------------------------------------------------"
	echo bing start
	mkdir bing
	cd bing
	$1/gvnix.sh script --file $2/code/addon-service/src/main/resources/bing.roo --lineNumbers true
	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo bing end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## service
    echo "======================================================"
    echo "------------------------------------------------------"
	echo service start
	mkdir service
	cd service
	$1/gvnix.sh script --file $2/code/addon-service/src/main/resources/service.roo --lineNumbers true
	# Get services summary page and available WSDLs
	#wget --retry-connrefused -O target/services.html http://localhost:8080/petclinic/services/ &
	#wget --retry-connrefused -O target/petservice.wsdl http://localhost:8080/petclinic/services/PetService?wsdl &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo service end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .


	## gvnix-test-no-jpa-no-web
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-test-no-jpa-no-web start
	mkdir gvnix-test-no-jpa-no-web
	cd gvnix-test-no-jpa-no-web
	$1/gvnix.sh script --file $2/code/addon-service/src/test/resources/gvnix-test-no-jpa-no-web.roo --lineNumbers true
	mvn test package
	cd ..
	echo gvnix-test-no-jpa-no-web end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## gvnix-test-no-jpa
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-test-no-jpa start
	mkdir gvnix-test-no-jpa
	cd gvnix-test-no-jpa
	$1/gvnix.sh script --file $2/code/addon-service/src/test/resources/gvnix-test-no-jpa.roo --lineNumbers true
	# Error #5832 pending from ROO-770 and SPR-6819 resolution
#	mvn test tomcat:run -Dmaven.tomcat.fork=true 
	cd ..
	echo gvnix-test-no-jpa end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## gvnix-test-no-web
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-test-no-web start
	mkdir gvnix-test-no-web
	cd gvnix-test-no-web
	$1/gvnix.sh script --file $2/code/addon-service/src/test/resources/gvnix-test-no-web.roo --lineNumbers true
	mvn test package
	cd ..
	echo gvnix-test-no-web end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## gvnix-test
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-test start
	mkdir gvnix-test
	cd gvnix-test
	$1/gvnix.sh script --file $2/code/addon-service/src/test/resources/gvnix-test.roo --lineNumbers true
	# Get services summary page and available WSDLs
	#wget --retry-connrefused -O target/services.html http://localhost:8080/service-layer-test/services/ &
	#wget --retry-connrefused -O target/clase.wsdl http://localhost:8080/service-layer-test/services/Clase?wsdl &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo gvnix-test end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## gvnix-test-security
  ## DISABLED temporaly as ACCV service is down
	#echo gvnix-test-security start
	#mkdir gvnix-test-security
	#cd gvnix-test-security
	#$1/gvnix.sh script --file $2/code/addon-service/src/test/resources/gvnix-test-security.roo --lineNumbers true
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	#cd ..
	#echo gvnix-test-security end

	## gvnix-test-entity
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-test-entity start
	mkdir gvnix-test-entity
	cd gvnix-test-entity
	$1/gvnix.sh script --file $2/code/addon-service/src/test/resources/gvnix-test-entity.roo --lineNumbers true
	mkdir target
	# Get services summary page and available WSDLs
	#wget --retry-connrefused -O target/services.html http://localhost:8080/petclinic/services/ &
	#wget --retry-connrefused -O target/pet.wsdl http://localhost:8080/petclinic/services/Pet?wsdl &
	#wget --retry-connrefused -O target/visit.wsdl http://localhost:8080/petclinic/services/Visit?wsdl &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo gvnix-test-entity end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX typicalsecurity add-on
##
	
	## typicalsecurity
    echo "======================================================"
    echo "------------------------------------------------------"
	echo typicalsecurity start
	mkdir typicalsecurity
	cd typicalsecurity
	$1/gvnix.sh script --file $2/code/addon-web-mvc-typicalsecurity/src/main/resources/typicalsecurity.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
	# Get login page when accessing a not allowed page and login in es and en languages
	#wget --retry-connrefused -O target/loginredirect.html http://localhost:8080/petclinic/pets
	#wget --retry-connrefused -O target/logines.html http://localhost:8080/petclinic/login?lang=es
	#wget --retry-connrefused -O target/loginen.html http://localhost:8080/petclinic/login?lang=en
	# Get forgotpassword and signup pages in es and en languages
	#wget --retry-connrefused -O target/forgotpasswordes.html http://localhost:8080/petclinic/forgotpassword/index?lang=es
	#wget --retry-connrefused -O target/signupes.html http://localhost:8080/petclinic/signup?form&lang=es
	#wget --retry-connrefused -O target/forgotpassworden.html http://localhost:8080/petclinic/forgotpassword/index?lang=en
	#wget --retry-connrefused -O target/signupen.html http://localhost:8080/petclinic/signup?form&lang=en
	# Log in with default user
	#wget --retry-connrefused -O target/loged.html http://localhost:8080/petclinic/resources/j_spring_security_check --post-data 'j_username=admin&j_password=admin'
	# Get logout URL
	#wget --retry-connrefused -O target/logout.html http://localhost:8080/petclinic/resources/j_spring_security_logout
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo typicalsecurity end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

##
## gvNIX theme add-on
##
	
	## theme
    echo "======================================================"
    echo "------------------------------------------------------"
	echo theme start
	mkdir theme
	cd theme
	$1/gvnix.sh script --file $2/code/addon-web-theme/src/main/resources/theme.roo --lineNumbers true
	mkdir target
	# Get home a non home pages in es and en languages
	#wget --retry-connrefused -O target/homees.html http://localhost:8080/petclinic/?lang=es &
	#wget --retry-connrefused -O target/petses.html http://localhost:8080/petclinic/pets?lang=es &
	#wget --retry-connrefused -O target/homeen.html http://localhost:8080/petclinic/?lang=en &
	#wget --retry-connrefused -O target/petsen.html http://localhost:8080/petclinic/pets?lang=en &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo theme end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## theme-gvnix
    echo "======================================================"
    echo "------------------------------------------------------"
	echo theme-gvnix start
	mkdir theme-gvnix
	cd theme-gvnix
	$1/gvnix.sh script --file $2/code/addon-web-theme/src/test/resources/theme-gvnix.roo --lineNumbers true
	mkdir target
	# Get home pages in es and en languages
	#wget --retry-connrefused -O target/homees.html http://localhost:8080/petclinic/?lang=es &
	#wget --retry-connrefused -O target/homeen.html http://localhost:8080/petclinic/?lang=en &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo theme-gvnix end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .


##
## gvNIX monitoring add-on
##
	
	## monitoring
    echo "======================================================"
    echo "------------------------------------------------------"
	echo monitoring start
	mkdir monitoring
	cd monitoring
	$1/gvnix.sh script --file $2/code/addon-monitoring/src/main/resources/monitoring.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo monitoring end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .


##
## gvNIX add-ons
##
	
	## gvnix-sample
    echo "======================================================"
    echo "------------------------------------------------------"
	echo gvnix-sample start
	mkdir gvnix-sample
	cd gvnix-sample
	$1/gvnix.sh script --file $2/code/src/main/resources/gvnix-sample.roo --lineNumbers true
	# Get services summary page and available WSDLs
	#wget --retry-connrefused -O target/services.html http://localhost:8080/sample/services/ &
	#wget --retry-connrefused -O target/claseservicio.wsdl http://localhost:8080/sample/services/ClaseServicio?wsdl &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo gvnix-sample end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## script
    echo "======================================================"
    echo "------------------------------------------------------"
	echo script start
	mkdir script
	cd script
	$1/gvnix.sh script --file $2/code/src/main/resources/script.roo --lineNumbers true
	# Request the home URL
	#wget --retry-connrefused -O target/home.html http://localhost:8080/petclinic/ &
	# Get home a non home pages in ca language
	#wget --retry-connrefused -O target/homeca.html http://localhost:8080/petclinic/?lang=ca &
	#wget --retry-connrefused -O target/petsca.html http://localhost:8080/petclinic/pets?lang=ca &
	# Get services summary page and available WSDLs
	#wget --retry-connrefused -O target/services.html http://localhost:8080/petclinic/services/ &
	#wget --retry-connrefused -O target/clase.wsdl http://localhost:8080/petclinic/services/Clase?wsdl &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo script end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .
	
	## gvnix-multimodule
##  echo gvnix-multimodule start
##  mkdir gvnix-multimodule
##  cd gvnix-multimodule
##  $1/gvnix.sh script --file $2/code/src/main/resources/gvnix-multimodule.roo --lineNumbers true
##  # Request the home URL
##  wget --retry-connrefused -O target/home.html http://localhost:8080/petclinic/ &
##  # Get home a non home pages in ca language
##  wget --retry-connrefused -O target/homeca.html http://localhost:8080/petclinic/?lang=ca &
##  wget --retry-connrefused -O target/petsca.html http://localhost:8080/petclinic/pets?lang=ca &
##  # Get services summary page and available WSDLs
##  wget --retry-connrefused -O target/services.html http://localhost:8080/petclinic/services/ &
##  wget --retry-connrefused -O target/clase.wsdl http://localhost:8080/petclinic/services/Clase?wsdl &
##  mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
##  cd ..
##  echo gvnix-multimodule end
	
	## tiendavirtual
   echo "======================================================"
    echo "------------------------------------------------------"
	echo tiendavirtual start
	mkdir tiendavirtual
	cd tiendavirtual
	$1/gvnix.sh script --file $2/code/src/main/resources/tiendavirtual.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	$1/gvnix.sh hint
	# Request the home URL
	#wget --retry-connrefused -O target/home.html "http://localhost:8080/tiendavirtual/" &	
    # Get no entities dialog message
	#wget --retry-connrefused -O target/dialog.html "http://localhost:8080/tiendavirtual/pedidoes?gvnixform&gvnixpattern=pedido&index=1" &
	# Request report form and report generation URLs in ca language
	#wget --retry-connrefused -O target/reportformca.html "http://localhost:8080/tiendavirtual/pedidoes/reports/informepedidos?form&lang=ca" &
	#wget --retry-connrefused -O target/reportpdfca.html "http://localhost:8080/tiendavirtual/pedidoes/reports/informepedidos?lang=ca&format=pdf" &
	#wget --retry-connrefused -O target/reportxlsca.html "http://localhost:8080/tiendavirtual/pedidoes/reports/informepedidos?lang=ca&format=xls" &
	#wget --retry-connrefused -O target/reporthtmlca.html "http://localhost:8080/tiendavirtual/pedidoes/reports/informepedidos?lang=ca&format=html" &
	#wget --retry-connrefused -O target/reportcsvca.html "http://localhost:8080/tiendavirtual/pedidoes/reports/informepedidos?lang=ca&format=csv" &
	# Get pattern urls of 3 patterns (one of each type) in ca and en languages
	#wget --retry-connrefused -O target/patternregistroca.html "http://localhost:8080/tiendavirtual/productoes?gvnixform&gvnixpattern=ficha&index=1&lang=ca" &
	#wget --retry-connrefused -O target/patterntabularca.html "http://localhost:8080/tiendavirtual/clientes?gvnixpattern=clientes&lang=ca" &
	#wget --retry-connrefused -O target/patternregistrotabularca.html "http://localhost:8080/tiendavirtual/pedidoes?gvnixform&gvnixpattern=pedido&index=1&lang=ca" &
	#wget --retry-connrefused -O target/patternregistroen.html "http://localhost:8080/tiendavirtual/productoes?gvnixform&gvnixpattern=ficha&index=1&lang=en" &
	#wget --retry-connrefused -O target/patterntabularen.html "http://localhost:8080/tiendavirtual/clientes?gvnixpattern=clientes&lang=en" &
	#wget --retry-connrefused -O target/patternregistrotabularen.html "http://localhost:8080/tiendavirtual/pedidoes?gvnixform&gvnixpattern=pedido&index=1&lang=en" &
	#mvn test tomcat:run selenium:xvfb selenium:selenese -Dmaven.tomcat.fork=true 
	cd ..
	echo tiendavirtual end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .


	## safe 
    echo "======================================================"
    echo "------------------------------------------------------"
	echo safe start
	mkdir safe
	cd safe
	$1/gvnix.sh script --file $2/code/src/test/resources/security-safe.roo --lineNumbers true
	mvn test tomcat:run &
	mkdir target
	# Request the home URL
	#wget --retry-connrefused -O target/home.html http://localhost:8080/safe-trunk/
    MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
    kill -9 $MVN_TOMCAT_PID
	cd ..
	echo safe end
    echo "------------------------------------------------------"
    echo "======================================================"
    echo .

	## aplusu (database required)
  #  echo "======================================================"
  #  echo "------------------------------------------------------"
	# echo aplusu start
	# mkdir aplusu
	# cd aplusu
	# $1/gvnix.sh script --file $2/code/src/test/resources/aplusu.roo --lineNumbers true
	# mvn test tomcat:run &
	# mkdir target
	# Request the home URL
	#wget --retry-connrefused -O target/home.html http://localhost:8080/aplusu-trunk/
  #  MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
  #  kill -9 $MVN_TOMCAT_PID
	#cd ..
	#echo aplusu end
  #  echo "------------------------------------------------------"
  #  echo "======================================================"
  #  echo .

	## regproy (database required)
  #  echo "======================================================"
  #  echo "------------------------------------------------------"
	# echo regproy start
	# mkdir regproy
	# cd regproy
	# $1/gvnix.sh script --file $2/code/src/test/resources/regproy.roo --lineNumbers true
##  Reopen shell to generate pending pattern resources
	# $1/gvnix.sh hint
	# mvn test tomcat:run & 
	# mkdir target
	# Request the home URL
	#wget --retry-connrefused -O target/home.html http://localhost:8080/registro_proyectos/
  #  MVN_TOMCAT_PID=`ps -eo "%p %c %a" | grep Launcher | grep tomcat:run | cut -b "1-6" | sed "s/ //g"`
  #  kill -9 $MVN_TOMCAT_PID
  #  cd ..
	#echo regproy end
  #  echo "------------------------------------------------------"
  #  echo "======================================================"
  #  echo .
