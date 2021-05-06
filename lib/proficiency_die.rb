# frozen_string_literal: true

require_relative 'outcome'

# 12-sided proficiency die
class ProficiencyDie
  OUTCOMES = [
    Outcome.new,
    Outcome.new(success: 1),
    Outcome.new(success: 1),
    Outcome.new(success: 2),
    Outcome.new(success: 2),
    Outcome.new(advantage: 1),
    Outcome.new(success: 1, advantage: 1),
    Outcome.new(success: 1, advantage: 1),
    Outcome.new(success: 1, advantage: 1),
    Outcome.new(advantage: 2),
    Outcome.new(advantage: 2),
    Outcome.new(success: 1, triumph: 1) # only has triumph on die, but counts as success
  ].freeze

  # @return [Outcome]
  def roll
    OUTCOMES.sample
  end
end
