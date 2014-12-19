#!/usr/bin/env ruby

require 'ffi-rzmq'

context = ZMQ::Context.new
subscriber = context.socket ZMQ::SUB
subscriber.connect 'tcp://localhost:5556'
subscriber.setsockopt ZMQ::SUBSCRIBE, ''

puts 'Silently creeping your rolls.'

loop do
  message = ''
  subscriber.recv_string message
  puts message
end
