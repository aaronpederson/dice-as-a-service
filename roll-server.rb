#!/usr/bin/env ruby

require 'highline/import'
require 'commander'
require 'ffi-rzmq'

def roll(dice, sides)
  rolls = []

  dice.times do
    roll = rand 1..sides
    puts roll
    rolls << roll
  end

  rolls.reduce(:+).to_s
end

def listen
  context = ZMQ::Context.new
  server = context.socket ZMQ::REP
  server.bind 'tcp://*:5555'

  publisher = context.socket ZMQ::PUB
  publisher.bind 'tcp://*:5556'
  
  puts 'Dice Server Awaiting Orders!'
  loop do
    request = ''
    server.recv_string request
    dice, sides = request.split(/d/)

    rolled = roll(dice.to_i, sides.to_i)
    
    server.send_string rolled
    publisher.send_string "roll #{ rolled }"
  end
end

listen
