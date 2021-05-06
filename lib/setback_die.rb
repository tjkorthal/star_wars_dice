# frozen_string_literal: true

require_relative 'outcome'

# 6-sided setback die
class SetbackDie
  OUTCOMES = [
    Outcome.new,
    Outcome.new,
    Outcome.new(failure: 1),
    Outcome.new(failure: 1),
    Outcome.new(threat: 1),
    Outcome.new(threat: 1)
  ].freeze

  # @return [Outcome]
  def roll
    OUTCOMES.sample
  end
end
