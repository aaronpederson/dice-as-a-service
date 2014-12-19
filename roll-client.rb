#!/usr/bin/env ruby

require 'highline/import'
require 'commander'
require 'ffi-rzmq'

context = ZMQ::Context.new
client = context.socket ZMQ::REQ
client.connect 'tcp://localhost:5555'

Commander.configure do
  program :name, 'Roll'
  program :version, '0.1.0'
  program :description, 'It rolls dice.'

  default_command :roll

  command :roll do |command|
    command.option '--dice INTEGER', Integer, 'Number of dice to roll'
    command.option '--sides INTEGER', Integer, 'Number of sides per die'
    command.option '--channel STRING', String, 'Channel for this roll'
    command.action do |_args, options|
      dice = options.dice || ask('How many dice should we roll? ', Integer)
      sides = options.sides || ask('How many sides per die? ', Integer)
      options.default channel: 'public'

      puts "You asked for #{ dice } dice with #{ sides } sides."

      client.send_string "#{ dice },#{ sides },#{ options.channel }"
      response = ''
      client.recv_string response
      puts "Got #{ response } from server."
    end
  end
end
