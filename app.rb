require 'sinatra'
require 'redis'
load 'config.rb'

get '/' do
  @redis = get_redis
  @res= ''

  begin
    case params[:a]
      when 'set'
        @res = @redis.set('lunch', 'hummus, chips, salad')
      when 'get'
        @res = @redis.get('lunch')
      when 'info'
        @redis.info.each { |k, v| 
          @res += "#{k}: #{v}<br />" 
        }
      when 'flush'
        @res = @redis.flushall
    end

    @size = @redis.dbsize
  rescue Redis::BaseConnectionError => e
    puts e.message
    @res = nil
  rescue SocketError => e
    puts e.message
    @res = nil
  end

  erb :index
end


