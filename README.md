ACS Load Testing is a simple Dockerized application to perform load
testing against a web application. It is especially useful for
leveraging the power of Azure Container Service to provide significant
scalability in your testing.

It utilizes Apache JMeter and Ruby-JMeter to builld containers that
will load test your applications.

# Getting Started

Lets get started by doing a load test against a blog hosted on
github.io.

```
docker run rgardler/acs-load rgardler.github.io
```

Depending on the configuration of your test this command may take some
time to run. The output of this command will look something like:

```
timeStamp,elapsed,label,responseCode,responseMessage,threadName,dataType,success,bytes,grpThreads,allThreads,Latency
2016/02/29 09:38:47.671,207,rgardler.github.io,200,OK,ThreadGroup 1-1,text,true,17330,1,1,206
2016/02/29 09:38:48.858,5,rgardler.github.io,200,OK,ThreadGroup 1-1,text,true,17328,1,1,5
2016/02/29 09:38:50.371,5,rgardler.github.io,200,OK,ThreadGroup 1-1,text,true,17328,1,1,5
```

You can save this output to a file with the following command:

```
docker run rgardler/acs-load rgardler.github.io jmeter.jtl
```

This output can be processed in a number of ways, including loading
into a listener in the JMeter GUI or processing with command line
tools.

# Building the Container

```
docker build -t rgardler/acs-load .
```
