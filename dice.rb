#!/usr/bin/env ruby

puts 'How many dice should we roll?'
requested_dice = gets.chomp.to_i

puts 'How many sides per die?'
requested_sides = gets.chomp.to_i

puts "You asked for #{ requested_dice } dice with #{ requested_sides } sides."

def roll(dice, sides)
  rolls = []

  dice.times do
    roll = rand 1..sides
    puts roll
    rolls << roll
  end

  return rolls
end

rolls = roll requested_dice, requested_sides

puts "Total rolled was #{ rolls.reduce :+ }"
