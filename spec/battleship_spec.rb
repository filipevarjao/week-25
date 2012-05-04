require File.join(File.dirname(__FILE__), "spec_helper")

describe Battleship do

  subject { Battleship.new }

  def full
    battleship = Battleship.new
    battleship.add_player 'frank'
    battleship.add_player 'ivan'
    battleship.place_ship 'frank', :tugboat, :horizontal, 1, 1
    battleship.place_ship 'ivan', :carrier, :vertical, 1, 1
    battleship.shoot 'frank', 1, 1

    battleship.add_player 'brandon'
    battleship.place_ship 'brandon', :destroyer, :horizonal, 1, 3
    battleship.shoot 'frank', 1, 1
    battleship.shoot 'frank', 2, 1
    battleship.shoot 'frank', 2, 1
    battleship
  end

  it "should include 2 players" do
    subject.add_player "frank"
    subject.add_player "ivan"
    subject.players.should == ["frank", "ivan"]

  end

  it "should include place ship" do
    subject.add_player "frank"
    subject.add_player "ivan"
    subject.place_ship 'frank', :tugboat, :horizontal, 1, 1
    subject.place_ship 'ivan', :carrier, :vertical, 1, 1

    subject.ship_positions.should == {"ivan"=>{:carrier=>[[1, 1], [1, 2], [1, 3]]}, "frank"=>{:tugboat=>[[1, 1], [2, 1]]}}
  end

  it "shoot shoot player" do
    b = Battleship.new
    b.add_player 'frank'
    b.add_player 'ivan'
    b.place_ship 'frank', :tugboat, :horizontal, 1, 1
    b.place_ship 'ivan', :carrier, :vertical, 1, 1
    b.shoot 'frank', 1, 1

    b.add_player 'brandon'
    b.place_ship 'brandon', :destroyer, :horizonal, 1, 3
    b.shoot 'frank', 1, 1
    b.shoot 'frank', 2, 1
    b.shoot 'frank', 2, 1

    b.ship_positions.should == full.ship_positions
  end

end
