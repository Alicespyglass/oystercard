require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
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
    it 'raises an error if touch in with balance below minimum of £1' do
      expect{ oystercard.touch_in(entry_station) }.to raise_error "Insufficient funds. £1 minimum needed to travel."
    end

  end

  describe '#touch_out' do
    before do
      oystercard.top_up(20)
    end

    it { is_expected.to respond_to(:touch_out).with(1).argument }

    it 'deducts correct fare amount (£1) from card on valid journey' do
      oystercard.touch_in(entry_station)
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by (-Journey::TRAVEL_FARE)
    end

    it 'deducts penalty fare if touch out without touch in station' do
      expect { oystercard.touch_out(exit_station)}.to change{ oystercard.balance }.by (-Journey::PENALTY_FARE)
    end

    it 'deducts penalty fare if touch in without touchout station' do
      expect { oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by (-Journey::PENALTY_FARE)
    end
  end

  describe '#journey_log' do
    it 'shows journey log' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey_log).to eq [ {entry_station: entry_station, exit_station: exit_station} ]
    end
  end


end
