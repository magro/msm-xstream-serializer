# Generated by Buildr 1.3.3, change to your liking
# Standard maven2 repository
require 'etc/checkstyle'

repositories.remote << 'http://repo2.maven.org/maven2'
repositories.remote << 'http://www.ibiblio.org/maven2'
repositories.remote << 'http://thimbleware.com/maven'
repositories.remote << 'http://repository.jboss.com/maven2'

SERVLET_API = 'javax.servlet:servlet-api:jar:2.5'
TC_CATALINA = 'org.apache.tomcat:catalina:jar:6.0.18'
TC_COYOTE = 'org.apache.tomcat:coyote:jar:6.0.18'
TC_LOGGING = transitive( 'org.apache.tomcat:juli:jar:6.0.18' )
MEMCACHED = artifact('spy.memcached:spymemcached:jar:2.4.2').from(file('lib/memcached-2.4.2.jar'))
MSM = artifact( 'de.javakaffee.web:memcached-session-manager:jar:1.1' ).from(file('lib/memcached-session-manager-1.1.jar'))
XSTREAM = transitive( 'com.thoughtworks.xstream:xstream:jar:1.3.1' )

# Testing
CLANG = 'commons-lang:commons-lang:jar:2.4'

desc 'msm-xstream-serializer'
define 'msm-xstream-serializer' do
  project.group = 'de.javakaffee.web.msm.serializer'
  project.version = '1.1'
  
  compile.with( SERVLET_API, TC_CATALINA, TC_COYOTE, TC_LOGGING, MEMCACHED, MSM, XSTREAM )
  compile.using( :source=>'1.5', :target=>'1.5' )
  
  test.with( compile.dependencies, CLANG )
  test.using :testng
  
  package :jar, :id => 'msm-xstream-serializer'
  package :sources
  package :javadoc

  checkstyle.config 'etc/checkstyle-checks.xml'
  checkstyle.style 'etc/checkstyle.xsl'

end
