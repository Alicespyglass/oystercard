require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#initialze' do
    it 'has an initial balance of zero' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do

    it 'adds top-up value to the balance' do
      expect{ oystercard.top_up(20)}.to change{ oystercard.balance }.by 20
    end

    it 'raises an error if top_up makes balance exceed limit' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      expect{ oystercard.top_up(maximum_balance+1)}.to raise_error "Top up unsuccessful, balance cannot exceed limit of #{maximum_balance}"
    end
  end

  describe '#deduct' do

    it 'deducts fare from balance' do
      oystercard.top_up(20)
      expect{ oystercard.deduct 5 }.to change{ oystercard.balance }.by -5
    end
  end

  describe '#touch_in' do
    it 'changes card journey state to in transit when touching in' do
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end
  end

  describe '#in_journey?' do
    it {is_expected.to respond_to :in_journey?}
  end

  describe '#touch_out' do
    it 'changes card journey state to journey ended when touching out' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq false
    end
  end



end
