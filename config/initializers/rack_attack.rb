class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 

  throttle('api/ip', limit: 2, period: 2.minutes) do |req|
    req.ip
  end
end