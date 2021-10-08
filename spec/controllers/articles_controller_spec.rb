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

  describe "GET new" do 
    it "assign @course" do
      course = FactoryBot.build(:article)

      get :new

      expect(assigns(:article)).to be_a_new(Article)
    end

    it "render template" do 
      article = FactoryBot.build(:article)

      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST create" do 
    it "create a new article" do
      article = FactoryBot.build(:article)

      expect do 
        post :create, params: { :article => FactoryBot.attributes_for(:article) }
      end.to change{ Article.count }.by(1)
    end

    it "redirects to articles_path" do
      article = FactoryBot.build(:article)

      post :create, params: { :article => FactoryBot.attributes_for(:article) }

      expect(response).to redirect_to articles_path
    end

    # 如果沒打標題，則不能儲存
    it "doesn't create a record when article doesn't have a title" do 
      expect do 
        post :create, params: { article: { :body => "bar" } }
      end.to change { Article.count }.by(0) 
    end

    it "render new template when article doesn't have title" do
      post :create, params: { article: { :body => "bar" } }

      expect(response).to render_template("new")
    end

    it "create a new article record when article has title" do
      article = FactoryBot.build(:article)

      expect do
        post :create, params: { article: FactoryBot.attributes_for(:article) }
      end.to change { Article.count }.by(1)
    end

    it "redirects to articles_path when article has title" do 
      article = FactoryBot.build(:article)

      post :create, params: { article: FactoryBot.attributes_for(:article) }

      expect(response).to redirect_to articles_path
    end

    


  end






end