class HomesController < ApplicationController
end


  def create
    @post = Post.new(content:params[:content])
    @post.save
  end