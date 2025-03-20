class FiniteStateMachine
  # @override
  def self.call(...)
    new(...).call
  end

  # Initializes finite state machine (FSM)
  # @param states [Set] Set containing all available states of FSM.
  # @param input_alphabets [Set] Set containing all input alphabets of FSM
  # @param initial_state [Symbol] Initial state of FSM
  # @param final_states [Set] Optional. Required for acceptors. Optional for transducers/classifiers
  # @param transitions [Hash] Hash for mapping current state to next state using input
  #   @example Mod Three FSM:
  #     {
  #       S0: { "0" => :S0, "1" => :S1 },
  #       S1: { "0" => :S2, "1" => :S0 },
  #       S2: { "0" => :S1, "1" => :S2 }
  #     }
  #
  # @return [Void]
  def initialize(
    states:,
    input_alphabets:,
    initial_state:,
    final_states: nil,
    transitions:
  )
    @states = states
    @input_alphabets = input_alphabets
    @initial_state = initial_state
    @final_states = final_states
    @transitions = transitions
    @current_state = initial_state
  end

  # Computes final state after transitioning of all characters of input
  # @param input [String] input to FSM
  #
  # @return [Symbol] Final state after transitioning of all characters of input
  def call(input)
    input.chars.each do |char|
      @current_state = transitions[current_state][char]
    end
    current_state
  end

  private

  attr_reader :current_state,
    :final_states,
    :initial_state,
    :input_alphabets,
    :states,
    :transitions
end
