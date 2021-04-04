class RequestForwardingJob < ApplicationJob
  queue_as :default

  def perform(request, webhook_url)
    # uri = URI(webhook_url)
    uri = URI('http://localhost:3000/rq/f1c96a85') # hardcoding this for testing
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = request.payload
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end
end
