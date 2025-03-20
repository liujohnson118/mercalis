require "rails_helper"

RSpec.describe ModThreeFsm do
  describe "#call" do
    it { expect(ModThreeFsm.call("0")).to eq(0) }
    it { expect(ModThreeFsm.call("1")).to eq(1) }
    it { expect(ModThreeFsm.call("10")).to eq(2) }
    it { expect(ModThreeFsm.call("11")).to eq(0) }
    it { expect(ModThreeFsm.call("100")).to eq(1) }
    it { expect(ModThreeFsm.call("1000")).to eq(2) } # 8 % 3 = 2
    it { expect(ModThreeFsm.call("1001")).to eq(0) } # 9 % 3 = 0
    it { expect(ModThreeFsm.call("1010")).to eq(1) } # 10 % 3 = 1
    it { expect(ModThreeFsm.call("1011")).to eq(2) } # 11 % 3 = 2
    it { expect(ModThreeFsm.call("1100")).to eq(0) } # 12 % 3 = 0
    it { expect(ModThreeFsm.call("1101")).to eq(1) } # 13 % 3 = 1
    it { expect(ModThreeFsm.call("1110")).to eq(2) } # 14 % 3 = 2
    it { expect(ModThreeFsm.call("1111")).to eq(0) } # 15 % 3 = 0
  end
end
