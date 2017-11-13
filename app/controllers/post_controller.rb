class PostController < ApplicationController
  def index  #게시글 다 보여주는 페이지
    @posts = Post.all
  end

  def new   #게시글 작성 form 페이지
  end

  def create   #작성된 게시물 db에 넣는 액션
    Post.create(
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end
  def show   #한개의 게시글 보는 페이지
    @post = Post.find(params[:id])
    #@comments = Comment.where(post_id: params[:id]) 이렇게 구구절절 안써도 된다. show.erb확인!
  end
  
  def create_comment    #해당하는 글에 댓글다는 액션
    Comment.create(
        content: params[:content],
        post_id: params[:id]
    )
    redirect_to :back
  end
  
end
