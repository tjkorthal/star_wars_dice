# frozen_string_literal: true

class Outcome
  attr_reader :success, :failure, :advantage, :threat, :triumph, :despair, :outcome

  def initialize(success: 0, failure: 0, advantage: 0, threat: 0, triumph: 0, despair: 0)
    @success = success
    @failure = failure
    @advantage = advantage
    @threat = threat
    @triumph = triumph
    @despair = despair
  end

  # @return [Integer]
  def advantage_total
    total = advantage - threat
    total.positive? ? total : 0
  end

  # @return [Integer]
  def failure_total
    total = failure - success
    total.positive? ? total : 0
  end

  # @return [Integer]
  def success_total
    total = success - failure
    total.positive? ? total : 0
  end

  # @return [Integer]
  def threat_total
    total = threat - advantage
    total.positive? ? total : 0
  end

  # @return [Outcome]
  def net
    Outcome.new(
      success: success_total,
      failure: failure_total,
      advantage: advantage_total,
      threat: threat_total,
      triumph: triumph,
      despair: despair
    )
  end

  # @return [Outcome]
  def +(other)
    raise ArgumentError, 'Cannot add non-Outcome object' unless other.is_a?(Outcome)

    Outcome.new(
      success: success + other.success,
      failure: failure + other.failure,
      advantage: advantage + other.advantage,
      threat: threat + other.threat,
      triumph: triumph + other.triumph,
      despair: despair + other.despair
    )
  end

  # @return [String]
  def to_s
    array = []
    array << "Success: #{success}" unless success.zero?
    array << "Failure: #{failure}" unless failure.zero?
    array << "Advantage: #{advantage}" unless advantage.zero?
    array << "Threat: #{threat}" unless threat.zero?
    array << "Triumph: #{triumph}" unless triumph.zero?
    array << "Despair: #{despair}" unless despair.zero?

    array.join(', ')
  end
end
