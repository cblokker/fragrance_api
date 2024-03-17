require 'graphlient'
require 'json'

class MondayApi
  attr_reader :client

  def initialize
    @client = Graphlient::Client.new(
      ENV['MONDAY_BASE_URL'],
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => ENV['MONDAY_API_KEY'],
        'API-Version' => ENV['MONDAY_API_VERSION']
      }
    )
  end

  def create_item(board_id, item = {})
    # response = client.query do
    #   mutation do
    #     create_item
    #       input: {
    #         board_id: board_id,
    #         item_name: item,
    #         column_values: JSON.stringify(item)
    #       }
    #     do
    #       id
    #     end
    #   end
    # end

    # response.data
  end
end
