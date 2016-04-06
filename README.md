#SERVERSPEC USAGE DEMO

###OVERIVEW
The below code example will help you understand serverspec usage/functionality. There are 3 folders under the main folder which demonstrate different ways to use serverspec to do the infrastructure testing
```
hosts_setup          - shows how to write tests targetted for hosts
roles_setup          - shows how to write tests as role and apply for multiple hosts
roles_setup_external - shows how to write tests as role with externalized properties file as yaml

```
**Note:** roles setup has a viewer inbuilt which can be accessed via starting the webserver `start_web.sh` in the viewer folder

###USAGE:
```
rake -T              - displays available options in rake file
USER=root rake spec  - runs the rake task as root user
rake spec            - runs the rake task as logged in user
```
Please note that you need to setup a vm and add the fake ips `use provided add_fakeip_route.sh` and then you would be able to test it. 

###DEMOPAGE:
[Checkout the demo page
here](http://htmlpreview.github.io/?https://github.com/tuxfight3r/serverspec_demo/blob/master/viewer/reports/index.html#/file/specresults-2016-04-05T12-17-04.json)

[viewer script credit goes to vincent bernat](https://github.com/vincentbernat/serverspec-example)

