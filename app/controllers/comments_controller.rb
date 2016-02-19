class CommentsController < ApplicationController
end
def index
  @comments = Comment.all
  @comments = Comment.new
end
