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
    test_params = [
        ["[3, 3, 1], 6", "[-4, 6, -8, 1], -3", "[-3, -2, -1, -9], -10"],
        ["\"tower\"", "\"hannah\"", "\"A man, a plan, a canal: Panama\"" ],
        ["\"eroh\", \"hero\"", "\"HleOl\", \"HellO\"", "\"not\", \"aword\""],
        ["[1,2,3]", "[1, 8, 6, 4]", "[-1, -2, -3]"]
      ]

    tests = []
    test_params[problem_index].each do |param|
      test = initial_code.dup
      test << "p "
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
    tests = create_tests(function_name,code, content_params[:problem_index].to_i)
    test_output = []
    old_stdout = $stdout.dup
    tests.each_with_index do |test, index|
      $stdout = File.new("test#{index+1}.out", 'w')
      $stdout.sync = true
      begin
        eval(test)
      rescue Exception => e
        puts e
      end
      test_output.push(File.read("test#{index+1}.out"))
    end
    $stdout = old_stdout
    test_output.each_with_index do |output, index|
      test_output[index] = output.gsub(/\n/, '')
    end

    # json_response(code)
    json_response(test_output)
  end

  private
   def content_params
     params.permit(:function_name, :problem_index, content: [entityMap: {}, blocks: [:key, :text, :type, :depth, inlineStyleRanges: [], entityRanges: [], data: {}]])
   end

end
