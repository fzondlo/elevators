require_relative "../elevator.rb"

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

      it "moves one floor towards destination" do
        subject.add_destination(3)
        subject.move
        expect(subject.current_floor).to eq 2
      end
    end

    #it "can accept a destination"

    #it "takes 5 stops to make it from floor 0 to floor 5" do
      #elevator.call_from(5)
      #10.times { elevator.move }
      #expect 
    #end



  end



  

end
