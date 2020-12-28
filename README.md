* Nexus 3
    ```shell script
    mvn org.apache.maven.plugins:maven-dependency-plugin:3.0.0:copy -Dartifact=com.rsupport.remotemeeting:web:2.16.1-SNAPSHOT:war -DoutputDirectory=/Users/jihwankim/temp -Dmdep.useBaseVersion=true
    mvn -s settings.xml org.apache.maven.plugins:maven-dependency-plugin:3.0.0:copy -Dartifact=com.rsupport.remotemeeting-solution:api:3.0.0-SNAPSHOT:war -DoutputDirectory=/Users/jihwankim/temp -Dmdep.useBaseVersion=true
    ```

* Nexus 2
    ```shell script
    curl -L "http://build.rsupport.com:8081/service/local/artifact/maven/redirect?r=public&g=com.rsupport.remotemeeting&a=web&v=2.16.1-SNAPSHOT&p=war" -o temp/web.war
    ```
