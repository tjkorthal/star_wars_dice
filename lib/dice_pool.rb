# frozen_string_literal: true

require_relative 'difficulty_die'
require_relative 'ability_die'
require_relative 'boost_die'
require_relative 'setback_die'
require_relative 'proficiency_die'
require_relative 'challenge_die'
require_relative 'outcome'

# calculates outcome of a check in Star Wars TTRPGs
class DicePool
  attr_accessor :difficulty, :ability, :boost, :setback, :proficiency, :challenge, :verbose

  def initialize(difficulty: 0, ability: 0, boost: 0, setback: 0, proficiency: 0, challenge: 0, verbose: false)
    @difficulty = difficulty
    @ability = ability
    @boost = boost
    @setback = setback
    @proficiency = proficiency
    @challenge = challenge
    @verbose = verbose
  end

  # @return [Outcome]
  def roll
    roll_for(:difficulty) +
      roll_for(:ability) +
      roll_for(:boost) +
      roll_for(:setback) +
      roll_for(:proficiency) +
      roll_for(:challenge)
  end

  private

  def die_class(type)
    # :ability => 'Ability'
    name = type.to_s.slice(0).upcase + type.to_s.slice(1..-1)
    Object.const_get("#{name}Die")
  end

  def roll_for(type)
    dice_count = send(type).to_i
    return Outcome.new if dice_count.zero?

    puts "#{type}:" if verbose

    Array.new(dice_count) { die_class(type).new.roll }
         .each { |outcome| puts "  #{outcome}" if verbose }
         .reduce(Outcome.new, :+)
  end
end
