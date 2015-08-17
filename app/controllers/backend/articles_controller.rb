class Backend::ArticlesController < ApplicationController
  http_basic_authenticate_with name: "123", password: "123"

  before_action :get_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Backend::Article.all
  end

  def new
    @article = Backend::Article.new
  end

  def create
    @article = Backend::Article.new(article_params)
    if @article.save
      redirect_to backend_article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
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
      @article = Backend::Article.find(params[:id])
    end

    def article_params
      params.require(:backend_article).permit(:title, :content)
    end

end
