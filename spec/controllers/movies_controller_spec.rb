require "rails_helper"
RSpec.describe MoviesController do

  let(:a_movie_test) { Movie.create(title: "Spec Movie", description: "spec descritpopn") }
  let(:create_list_of_movies) { 10.times {Movie.create(title: Faker::Ancient.god, description: Faker::Lorem.sentence)}}

  context "GET index" do 

    before(:each) do 
      get :index
      create_list_of_movies
    end

    it "renders index" do  
      expect(response.request.filtered_parameters).to eql({"controller"=>"movies", "action"=>"index"}) 
      expect(response.status).to eql(200) 
    end

    it "assigns @all_movies" do 
      expect(create_list_of_movies).to eq(10)
      expect(Movie.all.length).to eq(10)
      expect(assigns(:all_movies)).to eq(Movie.all)
    end
  end

  context "GET show" do 

    before(:example) do 
      a_movie_test
      get :show, params: { id: a_movie_test.id }
    end

    it "renders show" do 
      expect(response.request.filtered_parameters).to eq({"id"=>"1", "controller"=>"movies", "action"=>"show"})
      expect(response.status).to eq(200)
    end

    it "assigns @a_movie" do 
      expect(assigns(:a_movie)).to eq(a_movie_test)
    end
  end
end
