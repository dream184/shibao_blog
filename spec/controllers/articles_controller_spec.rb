require "rails_helper"

RSpec.describe ArticlesController, type: :controller do
  describe "GET /index" do
    it "assigns @articles and render template" do
      article1 = FactoryBot.create(:article)
      article2 = FactoryBot.create(:article)

      get :index

      expect(assigns[:articles]).to eq([article1, article2])
    end

    it "render template" do 
      article1 = FactoryBot.create(:article)
      article2 = FactoryBot.create(:article)

      get :index

      expect(response).to render_template("index")
    end 
  end

  describe "GET article show" do
    it "assigns @article" do 
      article = FactoryBot.create(:article)
    
      get :show, params: { id: article.id }

      expect(assigns[:article]).to eq(article)
    end

    it "render template" do 
      article = FactoryBot.create(:article)
 
      get :show, params: { id: article.id }

      expect(response).to render_template("show")
    end





  end
end