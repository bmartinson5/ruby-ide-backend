class ContentsController < ApplicationController
  def index
    @contents = Content.all
    json_response(@contents)
  end

  def create
    content = Content.create!(content_params)
    json_response(content)
  end

  def show
    content = Content.create!(content_params)
    json_response(content)
  end

  def find_problem
    byebug
    content = Content.where(problem_index: params[:problem_index])
    json_response(content)
  end

  private
   def content_params
     params.permit(:problem_index, content: [entityMap: {}, blocks: [:key, :text, :type, :depth, inlineStyleRanges: [], entityRanges: [], data: {}]])
   end

end
