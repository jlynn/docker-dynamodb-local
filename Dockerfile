FROM java:7-jre

RUN mkdir /opt/aws
RUN mkdir /opt/aws/data
RUN mkdir /opt/aws/dynamodb
RUN mkdir /opt/aws/data/dynamodb

WORKDIR /opt/aws/dynamodb
RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz
RUN tar xvzf /opt/aws/dynamodb/dynamodb_local_latest.tar.gz

VOLUME ["/opt/aws/data"]
EXPOSE 5000

ENTRYPOINT ["java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/opt/aws/data/dynamodb", "-port", "5000"]
