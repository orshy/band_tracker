require("spec_helper")

describe(Band) do
  it { should have_and_belong_to_many(:venues) }

  it("will capitalize the first letter of each band name") do
    test_band = Band.create({ :name => "the rolling beatles" })
    expect(test_band.name()).to(eq("The rolling beatles"))
  end

  it("will validate the presence of a band name") do
    test_band = Band.new({ :name => "" })
    expect(test_band.save()).to(eq(false))
  end
end
