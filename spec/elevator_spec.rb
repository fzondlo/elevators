require_relative "../elevator"
require_relative 'spec_helper'

describe Elevator, "Move floors" do
  context "defaulted" do
    let(:subject) { described_class.new(1) }

    it "has a default floor to eq 1" do 
      expect(subject.current_floor).to eq 1
    end
  end

  context "skyscraper with 20 floors" do
    let(:subject) { described_class.new(20) }

    it "has a top floor and a bottom floor" do 
      expect(subject.top_floor).to eq 20
      expect(subject.bottom_floor).to eq 1
    end

    it "initally has no destination" do
      expect(subject.next_stop).to be_nil 
    end

    describe "#add_destination" do
      it "allows you to set a destination" do 
        subject.add_destination(3)
        expect(subject.next_stop).to eq 3
      end
    end

    describe "#move" do 
      it "it stays on the same floor without a destination" do
        subject.move
        expect(subject.current_floor).to eq 1
      end

      it "moves one floor up towards destination" do
        subject.add_destination(3)
        subject.move
        expect(subject.current_floor).to eq 2
      end

      it "moves one floor down towards destination" do
        subject = Elevator.new(5, 1, 3)
        subject.add_destination(1)
        subject.move
        expect(subject.current_floor).to eq 2
      end

      it "stops at destination" do
        subject.add_destination(3)
        3.times{subject.move}
        expect(subject.current_floor).to eq(3)
        expect(subject.next_stop).to be_nil
      end

      it "waits one move at each destination" do
        subject.add_destination(3)
        subject.add_destination(1)
        moves = []
        7.times{moves << subject.move}
        expect(moves).to eq([2,3,3,2,1,1,nil])
      end
    end

    describe "#call_elevator" do
      it "comes to called floor when it has no destinations" do
        subject.call_to(4, :up)
        4.times{subject.move}
        expect(subject.current_floor).to eq 4
      end

      it "stops on it's way to another destination" do
        subject.add_destination(10)
        subject.call_to(2, :up)
        moves = []
        3.times{moves << subject.move}
        expect(moves).to eq([2,2,3])
      end
    end

    #make multiple stops in teh right direction after multiple moves

    #description "#distance_to_floor" do
      #it "calculates the distance to a given floor" do
      #end
    #end
  end
end
