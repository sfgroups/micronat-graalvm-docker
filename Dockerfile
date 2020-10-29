FROM oracle/graalvm-ce:20.2.0-java11
RUN gu install native-image && \
    yum install -y unzip zip && \
     curl -s "https://get.sdkman.io" | bash; \
        source "$HOME/.sdkman/bin/sdkman-init.sh"; \
        sdk install gradle

RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && gradle --version
RUN native-image --version

ENV PATH=$JAVA_HOME/bin:$PATH
RUN mkdir /home/application

COPY . /home/application
WORKDIR /home/application
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && gradle --no-daemon nativeImage --stacktrace

FROM centos:8

COPY --from=0 "/home/application/build/native-image/application" "/application"

CMD ["/application"]
