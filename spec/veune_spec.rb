require("spec_helper")

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

  it("will capitalize the first letter of venue name") do
    test_venue = Venue.create({ :name => "valentines" })
    expect(test_venue.name()).to(eq("Valentines"))
  end

  it("will validate the presence of a venue name") do
    test_venue = Venue.new({ :name => "" })
    expect(test_venue.save()).to(eq(false))
  end
end
