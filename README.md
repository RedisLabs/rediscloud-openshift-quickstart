Redis Cloud on OpenShift in 5 Minutes
-------------------------------------

This git repository helps you easily integrate the Redis Cloud service into your OpenShift apps.

###Create your application###

1. Create an account at http://openshift.redhat.com/ and set up you local machine with the client tools.
2. Sign up for a free account at http://redis-cloud.com
3. Create a redis instance, noting the connection details
4. Clone and Deploy on OpenShift, supplying your redis host, port, and password as application configuration details.  

```
    rhc app create rediscloud ruby-1.9 \
      --from-code http://github.com/ryanj/rediscloud-sinatra-quickstart.git \
      --env REDISCLOUD_URL=YOUR_REDISCLOUD_HOSTNAME \
      --env REDISCLOUD_PORT=YOUR_REDISCLOUD_DB_PORT \
      --env=REDISCLOUD_PASSWORD=YOUR_REDISCLOUD_DB_PASS
```

The above example uses "rediscloud" as the application name. It also includes an application source url, and several application configuration details.
If the `--from-code` option is not recognized, update your `rhc` gem.

If you failed to include your own Redis Cloud keys when creating your application, *don't worry* - There are notes on how to reconfigure your application in the next section.

When the command completes you should have your own clone of the application source code in a folder named after your app (`rediscloud`), and a live copy of your application running at `http://rediscloud-$yournamespace.rhcloud.com`.

### Using Environment Variables
Use `rhc` to set the following environment variables for your OpenShift app (substituting in your own values for the provided key names):

    rhc env set REDISCLOUD_URL=YOUR_REDIS_CLOUD_HOSTNAME -a rediscloud
    rhc env set REDISCLOUD_PORT=YOUR_REDIS_CLOUD_PORT -a rediscloud
    rhc env set REDISCLOUD_PASSWORD=YOUR_REDIS_CLOUD_PASSWORD -a rediscloud

Then, run the following to restart your application (reloading it's Redis DB configuration):

    rhc app restart rediscloud

You can review your application's full list configuration keys by typing:

    rhc env list rediscloud

### Local Development
You can run the same code in a local development environment by populating the required environment variables in your local development stage:

    export REDISCLOUD_URL=YOUR_REDIS_CLOUD_HOSTNAME
    export REDISCLOUD_PORT=YOUR_REDIS_CLOUD_PORT
    export REDISCLOUD_PASSWORD=YOUR_REDIS_CLOUD_PASSWORD

Then start your local server with:

    ruby app.rb

You may need to run `bundle install` before starting your local server to in order to make sure that your application has access to all of it's dependencies.
Next, you can edit your local source to start experimenting with your new Redis-powered application.  

When you're ready to deploy an update to OpenShift, `git add`, `git commit`, and `git push` can allow you to update your remote OpenShift example application using [a standard code development workflow](https://www.openshift.com/developers/deploying-and-building-applications).

More Information
----------------------------

For Redis-Clouds's developer resources visit http://redis-cloud.com/redis/developers

For general information about using redis see http://redis.io

For info on using redis with other programming languages visit: http://redis.io/clients

For more information on Redis-Cloud visit http://redis-cloud.com

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/ce7d0e7ab42dee42c060d09d1c655869 "githalytics.com")](http://githalytics.com/GarantiaData/rediscloud-openshift-quickstart)
