require './spec_helper'

describe Weapon do

  before :each do
    # Create a weapon with a name, weight, and damage
    @weapon = Weapon.new("power_shock", 10, 45, 1)
  end

  it "should be an item" do
    expect(@weapon).to be_an(Item)
  end

  it "should have name 'power_shock'" do
    expect(@weapon.name).to eq("power_shock")
  end

  it "should have weight 10" do
    expect(@weapon.weight).to eq(10)
  end

  it "should have damage 45" do
    expect(@weapon.damage).to eq(45)
  end

  describe "#hit" do
    before :each do
      @robot = double("robot")
    end

    it "hurts robot" do
      expect(@robot).to receive(:wound).with(45)
      @weapon.hit(@robot)
    end
  end
end
