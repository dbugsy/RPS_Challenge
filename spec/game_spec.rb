require 'game'

describe Game do

  subject(:game){ described_class.new(player_one: player, player_two: computer) }
  let(:player){ double :player }
  let(:computer){ double :computer }

  specify 'player can win' do
    allow(player).to receive(:defeats?).with(computer).and_return(true)

    expect(game.winner).to eq(player)
  end

  specify 'player can lose' do
    allow(player).to receive(:defeats?).with(computer).and_return(false)
    allow(computer).to receive(:defeats?).with(player).and_return(true)

    expect(game.winner).to eq(computer)
  end

  specify 'there is no winner' do
    allow(player).to receive(:defeats?).with(computer).and_return(false)
    allow(computer).to receive(:defeats?).with(player).and_return(false)

    expect(game.winner).to be_nil
  end
end
