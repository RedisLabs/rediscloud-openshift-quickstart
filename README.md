
Redis Cloud on OpenShift in 5 Minutes
-------------------------------------

This git repository helps you easily integrate the Redis Cloud service into your OpenShift apps.

###Step 1. Create OpenShift App###

Create an account at http://openshift.redhat.com/ and set up you local machine with the client tools.

Create a ruby-1.9 application (you can call your application whatever you want)
```
    rhc app create rediscloud ruby-1.9 --from-code git://github.com/openshift-quickstart/rediscloud-openshift-quickstart.git
```
If `--from-code` is not recognized, update your `rhc` gem.

###Step 2. Configure Redis Cloud###

1. Sign up for a free account at http://redis-cloud.com
2. Create a redis instance
3. Retrieve your instance's url
4. Enter the url in <strong>config.rb</strong>

```
  config = {
    url: 'redis://url_to_your_redis_cloud_instance_goes_here'
  }
```

###Step 3. Deploy your app###

```
    git add .
    git commit -m "my first commmit"
    git push
```

###Step 4. View your app!###

```
    http://rediscloud-$yournamespace.rhcloud.com
```


More Information
----------------------------

For Redis-Clouds's developer resources visit http://redis-cloud.com/redis/developers

For general information about using redis see https://redis.io

For info on using redis with other programming languages visit: http://redis.io/clients

For more information on Redis-Cloud visit http://redis-cloud.com
