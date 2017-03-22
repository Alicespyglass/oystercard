require 'station'

describe Station do

  subject(:station) { described_class.new('Whitechapel',2)}

it { is_expected.to respond_to(:name) }
it { is_expected.to respond_to(:zone) }

describe '#name' do
  it 'shows us a name' do
  expect(station.name).to eq 'Whitechapel'
  end
end

describe '#zone' do
  it 'shows us a zone' do
  expect(station.zone).to eq 2
  end
end

end 
