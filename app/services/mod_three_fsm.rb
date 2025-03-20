class ModThreeFsm < FiniteStateMachine
  STATES = Set.new(
    [
      :S0,
      :S1,
      :S2
    ]
  ).freeze
  INPUT_ALPHABETS = Set.new(
    [
      "0",
      "1"
    ]
  ).freeze
  TRANSITIONS = {
    S0: {
      "0" => :S0,
      "1" => :S1
    },
    S1: {
      "0" => :S2,
      "1" => :S0
    },
    S2: {
      "0" => :S1,
      "1" => :S2
    }
  }.freeze
  STATES_MAP = {
    S0: 0,
    S1: 1,
    S2: 2
  }.freeze

  def self.call(input)
    new.call(input)
  end

  def initialize
    super(
      states: STATES,
      input_alphabets: INPUT_ALPHABETS,
      initial_state: :S0,
      transitions: TRANSITIONS
    )
  end

  def call(input)
    STATES_MAP[super(input)]
  end
end
