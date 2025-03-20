class ModThreeFsm < FiniteStateMachine
  # Available states of FSM
  STATES = Set.new(
    [
      :S0,
      :S1,
      :S2
    ]
  ).freeze
  # Input alphabets for FSM
  INPUT_ALPHABETS = Set.new(
    [
      "0",
      "1"
    ]
  ).freeze
  # Transition functions of FSM
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
  # Data for mapping final state to remainder
  STATES_MAP = {
    S0: 0,
    S1: 1,
    S2: 2
  }.freeze

  # @param input [String] input binary string to calculate mod 3 for
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

  # Calculate mod 3 of a binary string
  # @param input [String] input binary string to calculate mod 3 for
  #
  # @return [Integer] Remainder of binary string after division by 3
  def call(input)
    STATES_MAP[super(input)]
  end
end
