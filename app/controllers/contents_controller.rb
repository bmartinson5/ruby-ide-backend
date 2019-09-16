class ContentsController < ApplicationController
  def index
    json_response("")
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
    content = Content.where(problem_index: params[:problem_index])
    json_response(content)
  end

  def create_tests(function_name, initial_code, problem_index)
    test_params = [["3", "4", "5"], ["2", "1"]]
    tests = []
    test_params[problem_index].each do |param|
      test = initial_code.dup
      test << function_name
      test << "("
      test << param
      test << ")"
      test << "\n"
      tests.push(test)
    end

    return tests

  end

  def run_code
    function_name = content_params[:function_name]
    # content = eval(File.read 'test.rb')
    # code = "5.times do p 'hi' end"
    code = ""
    blocks = content_params[:content]["blocks"]
    blocks.each do |block, index|
      code << block[:text]
      code << "\n"
    end
    tests = create_tests(function_name,code, 1)

    test_output = []
    tests.each_with_index do |test, index|
      $stdout = File.new("test#{index+1}.out", 'w')
      $stdout.sync = true
      begin
        eval(test)
      rescue Exception => e
        puts e
      end
      test_output = File.read('test2.out')
    end

    textOutput = File.read('test2.out')
    # json_response(code)
    json_response(textOutput)
  end

  private
   def content_params
     params.permit(:function_name, :problem_index, content: [entityMap: {}, blocks: [:key, :text, :type, :depth, inlineStyleRanges: [], entityRanges: [], data: {}]])
   end

end
