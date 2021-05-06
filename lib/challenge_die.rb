# frozen_string_literal: true

require_relative 'outcome'

# 12-sided challenge die
class ChallengeDie
  OUTCOMES = [
    Outcome.new,
    Outcome.new(failure: 1),
    Outcome.new(failure: 1),
    Outcome.new(failure: 2),
    Outcome.new(failure: 2),
    Outcome.new(threat: 1),
    Outcome.new(threat: 1),
    Outcome.new(failure: 1, threat: 1),
    Outcome.new(failure: 1, threat: 1),
    Outcome.new(threat: 2),
    Outcome.new(threat: 2),
    Outcome.new(failure: 1, despair: 1) # only has despair on die, but counts as success
  ].freeze

  # @return [Outcome]
  def roll
    OUTCOMES.sample
  end
end
