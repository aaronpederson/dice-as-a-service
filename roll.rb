#!/usr/bin/env ruby

require 'highline/import'

dice = ARGV[0].to_i
sides = ARGV[1].to_i

# dice = ask 'How many dice should we roll? ', Integer
# sides = ask 'How many sides per die? ', Integer

puts "You asked for #{ dice } dice with #{ sides } sides."

def roll(dice, sides)
  rolls = []

  dice.times do
    roll = rand 1..sides
    puts roll
    rolls << roll
  end

  return rolls
end

rolls = roll dice, sides

puts "Total rolled was #{ rolls.reduce :+ }"
