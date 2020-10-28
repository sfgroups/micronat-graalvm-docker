# micronat-graalvm-docker

mn create-cli-app tools-cli --lang groovy --features http-client 

  mn create-app my-app -l groovy -f http-client,jdbc-tomcat
  cd my-app/
  mn create-controller  HelloController 
  ./gradlew run
