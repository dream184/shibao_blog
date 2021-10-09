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

    context "when article doesn't have a title" do
      it "doesn't create a record" do 
        expect do 
          post :create, params: { article: { :body => "bar" } }
        end.to change { Article.count }.by(0) 
      end

      it "render new template" do
        post :create, params: { article: { :body => "bar" } }

        expect(response).to render_template("new")
      end
    end

    context "when article have a title" do 
      it "create a new article record when article has title" do
        article = FactoryBot.build(:article)

        expect do
          post :create, params: { article: FactoryBot.attributes_for(:article) }
        end.to change { Article.count }.by(1)
      end

      it "redirects to articles_path" do 
        article = FactoryBot.build(:article)

        post :create, params: { article: FactoryBot.attributes_for(:article) }

        expect(response).to redirect_to articles_path
      end
    end


  end

  describe "GET edit" do 
    it "assign article" do 
      article = FactoryBot.create(:article)

      get :edit, params: { id: article.id }

      expect(assigns[:article]).to eq(article)
    end

    it "render template" do
      article = FactoryBot.create(:article)

      get :edit, params: { id: article.id }

      expect(response).to render_template("edit")
    end
  end

  describe "PUT update" do
    context "when article has title" do
      it "assign @article" do 
        article = FactoryBot.create(:article)

        put :update, params: { id: article.id, article: { title: "title", body: "xxxzzz", categories: "astrocamp", tag: "rails"} }

        expect(assigns[:article]).to eq(article)
      end

      it "changes value" do
        article = FactoryBot.create(:article)
        
        put :update, params: { id: article.id, article: { title: "title", body: "xxxzzz", categories: "astrocamp", tag: "rails"} }

        expect(assigns[:article].title).to eq("title")
        expect(assigns[:article].body).to eq("xxxzzz")
      end

      it "redirects to article_path" do 
        article = FactoryBot.create(:article)

        put :update, params: { id: article.id, article: { title: "title", body: "xxxzzz", categories: "astrocamp", tag: "rails"} }

        expect(response).to redirect_to article_path(article)
      end
    end

    context "when article doesn't have title" do
      it "doesn't update a record" do
        article = FactoryBot.create(:article)

        put :update, params: { id: article.id, article: { title: "", body: "xxxzzz"} }

        expect(article.body).not_to eq("xxxzzz")
      end

      it "renders edit template" do 
        article = FactoryBot.create(:article)

        put :update, params: { id: article.id, article: { title: "", body: "xxxzzz"} }

        expect(response).to render_template("edit")
      end
    end





  end

  describe "DELETE destroy" do 
    it "assigns @article" do 
      article = FactoryBot.create(:article)

      delete :destroy, params: { id: article.id }

      expect(assigns[:article]).to eq(article)
    end

    it "delete a record" do 
      article = FactoryBot.create(:article)

      expect { delete :destroy, params: { id: article.id } }.to change { Article.count }.by(-1)
    end

    it "redirects to articles_path" do
      article = FactoryBot.create(:article)

      delete :destroy, params: { id: article.id }

      expect(response).to redirect_to articles_path
    end
  end


end