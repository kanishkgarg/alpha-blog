class ArticlesController < ApplicationController
    def new
    @articles = Article.new
    end
    
    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.save
        rederict_to_articles_show(@article)
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
end