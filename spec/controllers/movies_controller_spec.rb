require "rails_helper"
RSpec.describe MoviesController do
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
end
