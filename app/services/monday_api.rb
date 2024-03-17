require 'graphlient'
require 'json'

class MondayAPI
  attr_reader :client

  def initialize
    @client = Graphlient::Client.new(ENV['MONDAY_BASE_URL']) do |query|
      query.headers['Content-Type'] = 'application/json'
      query.headers['Authorization'] = ENV['MONDAY_API_KEY']
      query.headers['API-Version'] = ENV['MONDAY_API_VERSION']
    end
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
