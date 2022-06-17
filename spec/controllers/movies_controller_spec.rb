require "rails_helper"
RSpec.describe MoviesController do

  let(:a_movie_test) { Movie.create(title: "Spec Movie", description: "spec descritpopn") }

  context "GET index" do 
    it "renders index" do
      get :index
      expect(response.request.filtered_parameters).to eql({"controller"=>"movies", "action"=>"index"}) 
      expect(response.status).to eql(200) 
    end

    it "assigns @all_movies" do 
      get :index
      all_movies_test = Movie.create(title: "Spec Movie", description: "spec descritpopn")
      expect(assigns(:all_movies)).to eq([all_movies_test])
    end
  end

  context "GET show" do 

    before(:example) do 
      a_movie_test
    end

    it "renders show" do 
      get :show, params: { id: a_movie_test.id }
      expect(response.request.filtered_parameters).to eq({"id"=>"1", "controller"=>"movies", "action"=>"show"})
      expect(response.status).to eq(200)
    end

    it "assigns @a_movie" do 
      get :show, params: { id: a_movie_test.id }
      expect(assigns(:a_movie)).to eq(a_movie_test)
    end
  end
end
