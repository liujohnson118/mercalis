require "rails_helper"

RSpec.describe FiniteStateMachine do
  subject do
    described_class.
      new(
        states: states,
        input_alphabets: input_alphabets,
        initial_state: :A,
        final_states: final_states,
        transitions: transitions
      )
  end

  let(:states) do
    Set.new([
      :A,
      :B,
      :C
    ])
  end
  let(:input_alphabets) do
    Set.new([
      "x",
      "y"
    ])
  end
  let(:initial_state) { :A }
  let(:transitions) do
    {
      A: { "x" => :B, "y" => :C },
      B: { "x" => :C, "y" => :A },
      C: { "x" => :A, "y" => :B }
    }
  end
  let(:final_states) { double("final_states") }

  shared_examples "successful state transitions" do
    it { expect(subject.call("x")) .to eq(:B) }
    it { expect(subject.call("y")) .to eq(:C) }
    it { expect(subject.call("xy")) .to eq(:A) }
    it { expect(subject.call("yx")) .to eq(:A) }
    it { expect(subject.call("xyx")) .to eq(:B) }
  end

  describe "#call" do
    include_examples "successful state transitions"

    context "without final_states" do
      subject do
        described_class.
          new(
            states: states,
            input_alphabets: input_alphabets,
            initial_state: :A,
            transitions: transitions
          )
      end

      include_examples "successful state transitions"
    end
  end
end
