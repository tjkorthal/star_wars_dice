#!/usr/bin/env ruby

# frozen_string_literal: true

require 'optparse'
require_relative '../lib/dice_pool'

options = {
  difficulty: 0,
  ability: 0,
  boost: 0,
  setback: 0,
  proficiency: 0,
  challenge: 0
}
OptionParser.new do |opts|
  opts.banner = 'Usage: roll.rb [options]'

  opts.on('-d DICE', '--difficulty DICE', 'Set number of difficulty dice') do |difficulty|
    options[:difficulty] = difficulty
  end

  opts.on('-a DICE', '--ability DICE', 'Set number of ability dice') do |ability|
    options[:ability] = ability
  end

  opts.on('-b DICE', '--boost DICE', 'Set number of boost dice') do |boost|
    options[:boost] = boost
  end

  opts.on('-s DICE', '--setback DICE', 'Set number of setback dice') do |setback|
    options[:setback] = setback
  end

  opts.on('-p DICE', '--proficiency DICE', 'Set number of proficiency dice') do |proficiency|
    options[:proficiency] = proficiency
  end

  opts.on('-c DICE', '--challenge DICE', 'Set number of challenge dice') do |challenge|
    options[:challenge] = challenge
  end

  opts.on('-v', '--verbose', 'Log the result of each roll') do
    options[:verbose] = true
  end
end.parse!

puts DicePool.new(
  difficulty: options[:difficulty],
  ability: options[:ability],
  boost: options[:boost],
  setback: options[:setback],
  proficiency: options[:proficiency],
  challenge: options[:challenge],
  verbose: options[:verbose]
).roll.net
