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

```xml
<?xml version="1.0" encoding="UTF-8"?>
<testResults version="1.2">
<httpSample t="332" lt="290" ts="1456740775219" s="true" lb="rgardler.github.io" rc="200" rm="OK" tn="ThreadGroup 1-1" dt="text" by="17329" ng="1" na="1"/>
<httpSample t="57" lt="57" ts="1456740775562" s="true" lb="rgardler.github.io" rc="200" rm="OK" tn="ThreadGroup 1-1" dt="text" by="17328" ng="1" na="1"/>
<httpSample t="55" lt="55" ts="1456740775620" s="true" lb="rgardler.github.io" rc="200" rm="OK" tn="ThreadGroup 1-1" dt="text" by="17328" ng="1" na="1"/>

</testResults>
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
