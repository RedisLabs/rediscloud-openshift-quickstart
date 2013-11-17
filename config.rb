def get_client
  ### Set the host, port and (optional) password of your Redis Cloud instance ###
  redis_host = ENV['REDISCLOUD_URL']
  redis_port = ENV['REDISCLOUD_PORT']
  redis_password = ENV['REDISCLOUD_PASSWORD']
  config = {
     host: redis_host,
     port: redis_port,
     password: redis_password
  }
  @redis ||= Redis.new(config)
end

def get_redis
  begin
    @redis = get_client
  rescue
    erb :index
    return
  end
end
