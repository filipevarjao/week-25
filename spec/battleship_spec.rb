require File.join(File.dirname(__FILE__), "spec_helper")

describe Battleship do

    subject { Battleship.new }


  xit "should include 2 players" do
    subject.add_player "frank"
    subject.add_player "ivan"
    subject.players.should == ["frank", "ivan"]

  end

  xit "should include place ship" do
    subject.add_player "frank"
    subject.add_player "ivan"
    subject.place_ship 'frank', :tugboat, :horizontal, 1, 1
    subject.place_ship 'ivan', :carrier, :vertical, 1, 1

    subject.ship_positions.should == {"ivan"=>{:carrier=>[[1, 1], [1, 2], [1, 3]]}, "frank"=>{:tugboat=>[[1, 1], [2, 1]]}}
  end

  xit "shoot shoot player" do
    subject.add_player "frank"
    subject.add_player "ivan"
    subject.place_ship 'frank', :tugboat, :horizontal, 1, 1
    subject.place_ship 'ivan', :carrier, :vertical, 1, 1

    subject.shoot 'frank', 1, 1
  end
end
