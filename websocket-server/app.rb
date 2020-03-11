require 'em-websocket'
require 'bunny'
require 'json'

EventMachine.run do
  @clients = []
  conn = Bunny.new('amqp://guest:guest@rabbitmq:5672')
  conn.start
  ch = conn.create_channel

  q = ch.queue('data-update')
  puts "WEBSOCKET STARTED"
  q.subscribe do |delivery_info, properties, payload|
    puts "WEBSOKCET INCOMING MESSAGE = #{payload}"
    @clients.each do |socket|
      socket.send(payload.to_json)
    end
  end

  EM::WebSocket.start(:host => '0.0.0.0', :port => '3006') do |ws|
    ws.onopen do |handshake|
      @clients << ws
      ws.send "Connected to #{handshake.path}."
    end

    ws.onclose do
      ws.send 'Closed.'
      @clients.delete ws
    end

    ws.onmessage do |msg|
      puts "Received Message: #{msg}"
      @clients.each do |socket|
        socket.send msg
      end
    end
  end
end







