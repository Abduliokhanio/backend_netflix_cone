require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "testing movies CRUD functionality" do
    let(:movie1) {Movie.create(title:"test movie 1", description: "test description")}

    it "should return empty if no movies are saved" do 
      expect(Movie.all.length).to eq(0) 
    end

    it "should be able to save a movie" do 
      movie1
      expect(Movie.all.length).to eq(1) 
    end

  end
end
