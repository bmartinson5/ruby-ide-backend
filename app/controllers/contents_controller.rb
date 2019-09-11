class ContentsController < ApplicationController
  def index
    json_response("")
  end

  def create
    content = Content.create!(content_params)
    $stdout = File.new('console.out', 'w')
    $stdout.sync = true
    # content = eval(File.read 'test.rb')
    # code = "5.times do p 'hi' end"
    code = ""
    blocks = content_params[:content]["blocks"]
    blocks.each do |block, index|
      code << block[:text]
    end

    eval(code)
    textOutput = File.read('console.out')
    json_response(textOutput)
  end

  def show
    content = Content.create!(content_params)
    json_response(content)
  end

  def find_problem
    content = Content.where(problem_index: params[:problem_index])
    json_response(content)
  end

  private
   def content_params
     params.permit(:problem_index, content: [entityMap: {}, blocks: [:key, :text, :type, :depth, inlineStyleRanges: [], entityRanges: [], data: {}]])
   end

end
