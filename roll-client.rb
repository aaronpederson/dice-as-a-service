#!/usr/bin/env ruby

require 'highline/import'
require 'commander'
require 'ffi-rzmq'

context = ZMQ::Context.new
client = context.socket ZMQ::REQ
client.connect 'tcp://localhost:5555'

client.send_string '2d20'
response = ''
client.recv_string response
puts "Got #{ response } from server."
