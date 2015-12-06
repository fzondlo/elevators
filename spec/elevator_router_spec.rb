require 'pry'
require_relative '../elevator_router'
require_relative 'spec_helper'

describe ElevatorRouter, "Manage Elevators" do

  context "defaulted with 5 floors" do
    let(:subject) { described_class.new(5) }
    it "has a top floor" do
      expect(subject.top_floor).to eq 5
    end

    it "has a bottom floor" do
      expect(subject.bottom_floor).to eq 1
    end

    describe "#elevator_count" do
      it "counts the number of elevators" do
        expect(subject.elevator_count).to eq 1
      end
    end

    describe "#elevator_locations" do
      it "shows you elevator location" do
        expect(subject.elevator_locations).to eq({0=>1})
      end
    end

    describe "#move" do
      it "moves elevator" do
        subject.add_destination(2)
        subject.move
        expect(subject.elevator_locations).to eq({0=>2})
      end

      #it "moves to multiple destinations" do
      #end
    end

  end

  context "highrise (5 elevators)" do

  end

end
