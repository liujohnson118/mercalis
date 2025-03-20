class FiniteStateMachine
  def self.call(...)
    new(...).call
  end

  def initialize(
    states:,
    input_alphabets:,
    initial_state:,
    final_states: [],
    transitions:
  )
    @states = states
    @input_alphabets = input_alphabets
    @initial_state = initial_state
    @final_states = final_states
    @transitions = transitions
    @current_state = initial_state
  end

  def call(input)
    input.chars.each do |char|
      @current_state = transitions[@current_state][char]
    end
    current_state
  end

  private

  attr_reader :states, :input_alphabets, :initial_state, :final_states, :transitions, :current_state
end
