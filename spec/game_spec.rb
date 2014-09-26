require 'game'
require 'player'
require 'ship'
require 'board'

describe Game do 
	
		let(:game) {Game.new}
		let(:player1) {double :player1, Class: Player}
		let(:battleship) {double :battleship, name: :battleship}
		let(:STDIN) {double :STDIN}
 
	context "Upon initialize" do	

		it "should start with player 1" do
			expect(game.player1.class).to eq(Player)
		end

		it "should start with player 2" do
			expect(game.player2.class).to eq(Player)
		end
	end

	context "at beginning of game" do

		it "should ask player to place battleship" do
		allow(battleship).to receive(:name).with ("battleship")
		expect(game.ask_player_place_ship(game.player1, battleship)).to eq("player1, where do you want to place your battleship (e.g. 'A1') ")
		end	

		it "should receive user input for ship coordinate" do
			allow(STDIN).to receive(:gets).and_return('A1')
			expect(game.coordinates).to eq("A1")
		end

	end

	
end

# def place_ship(ship, coordinate, direction)