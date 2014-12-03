#!/usr/bin/env ruby

require 'highline/import'
require 'commander'

def roll(dice, sides)
  rolls = []

  dice.times do
    roll = rand 1..sides
    puts roll
    rolls << roll
  end

  return rolls
end

Commander.configure do
  program :name, 'Roll'
  program :version, '0.1.0'
  program :description, 'It rolls dice.'

  default_command :roll

  command :roll do |command|
    command.option '--dice INTEGER', Integer, 'Number of dice to roll'
    command.option '--sides INTEGER', Integer, 'Number of sides per die'
    command.action do |_args, options|
      dice = options.dice || ask('How many dice should we roll? ', Integer)
      sides = options.sides || ask('How many sides per die? ', Integer)

      puts "You asked for #{ dice } dice with #{ sides } sides."
      rolls = roll dice, sides
      puts "Total rolled was #{ rolls.reduce :+ }"
    end
  end
end
