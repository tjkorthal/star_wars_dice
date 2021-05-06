# frozen_string_literal: true

require_relative 'outcome'

# 8-sided difficulty die
class DifficultyDie
  OUTCOMES = [
    Outcome.new,
    Outcome.new(failure: 1),
    Outcome.new(failure: 2),
    Outcome.new(threat: 1),
    Outcome.new(threat: 1),
    Outcome.new(threat: 1),
    Outcome.new(threat: 2),
    Outcome.new(failure: 1, threat: 1)
  ].freeze

  # @return [Outcome]
  def roll
    OUTCOMES.sample
  end
end
