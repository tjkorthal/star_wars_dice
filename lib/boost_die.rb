# frozen_string_literal: true

require_relative 'outcome'

# 6-sided boost die
class BoostDie
  OUTCOMES = [
    Outcome.new,
    Outcome.new,
    Outcome.new(success: 1),
    Outcome.new(success: 1, advantage: 1),
    Outcome.new(advantage: 2),
    Outcome.new(advantage: 1)
  ].freeze

  # @return [Outcome]
  def roll
    OUTCOMES.sample
  end
end
