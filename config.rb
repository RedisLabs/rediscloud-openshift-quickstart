def get_client
  ### Set the host, port and (optional) password of your Redis Cloud instance ###
  config = {
     host: 'redis-cloud-host', # Replace with your redis cloud db's hostname
     port: 6379,               # Replace 6379 with your redis cloud db's port
     password: 'foobared'      # Comment this line if no password set for your db
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
