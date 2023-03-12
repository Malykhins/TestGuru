class GistQuestionService
  Result = Struct.new(:html_url) do
    def success?
      html_url.present?
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = question.test
    @client = client
  end

  def call
    Result.new(@client.create_gist(gist_params).html_url)
  end

  private

  def default_client
    Octokit::Client.new(:access_token => ENV.fetch('GIT_ACCESS_TOKEN'))
  end

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
