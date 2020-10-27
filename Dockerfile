FROM oracle/graalvm-ce:20.2.0-java11
RUN gu install native-image

ENV PATH=$JAVA_HOME/bin:$PATH
RUN mkdir /home/application

COPY . /home/application
WORKDIR /home/application
RUN ./gradlew --no-daemon nativeImage --stacktrace
CMD ["/home/application/build/native-image/application"]
