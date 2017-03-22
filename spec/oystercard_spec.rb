require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  let(:exit_station) { double :station }

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

  describe '#touch_in' do
    it 'changes card journey state to in transit when touching in' do
      oystercard.top_up(20)
      oystercard.touch_in(station)
      expect(oystercard.in_journey?).to eq true
    end

    it 'raises an error if touch in with balance below minimum of £1' do
      expect{ oystercard.touch_in(station) }.to raise_error "Insufficient funds. £1 minimum needed to travel."
    end

    it 'remembers entry station after touch in' do
      oystercard.top_up(20)
      oystercard.touch_in(station)
      expect(oystercard.entry_station).to eq station
    end
  end

  describe '#in_journey?' do
    it {is_expected.to respond_to :in_journey?}
  end

  describe '#touch_out' do

    before do
      oystercard.top_up(20)
      oystercard.touch_in(station)
    end

      it { is_expected.to respond_to(:touch_out).with(1).argument }

    it 'changes card journey state to journey ended when touching out' do
      oystercard.touch_out(exit_station)
      expect(oystercard.in_journey?).to eq false
    end

    it 'deducts correct fare amount on card touch out' do
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by (-Oystercard::MINIMUM_TRAVEL_BALANCE)
    end
  end

  describe '#journey_log' do
    it 'shows journey log' do
      oystercard.top_up(20)
      oystercard.touch_in(station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey_log).to eq [ {entry_station: station, exit_station: exit_station} ]
    end


  end


end
