class Backend::ArticlesController < ApplicationController
  http_basic_authenticate_with name: "123", password: "123"

  before_action :get_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @action_path = backend_articles_path
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @action_path = edit_backend_article_path(@article)
  end

  def update
    if @article.update(article_params)
      redirect_to backend_article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy if @article
    redirect_to backend_articles_path
  end

  private
    def get_article
      @article = Article.find_by(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end

end
