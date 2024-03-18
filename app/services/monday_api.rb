require 'graphlient'
require 'json'

class MondayApi
  attr_reader :client

  MONDAY_BASE_URL = ENV['MONDAY_BASE_URL']
  MONDAY_API_KEY = ENV['MONDAY_API_KEY']
  MONDAY_API_VERSION = ENV['MONDAY_API_VERSION']

  def initialize
    @client = Graphlient::Client.new(
      MONDAY_BASE_URL,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => MONDAY_API_KEY,
        'API-Version' => MONDAY_API_VERSION
      }
    )
  end

  # TODO: maybe weird mapping issues between item keys & board col names.
  # Might be a good idea to create some validation layer here, or at least
  # check to see if board schema maps to expected item type.
  def create_item(board_id, item = {})
    query_variables = {
      board_id: board_id,
      item_name: "Order: #{item[:first_name]} #{item[:last_name]}"
      column_values: item.to_json
    }

    client.query(item_query, query_variables)
  end

  def item_query
    <<-GRAPHQL
      mutation ($board_id: ID!, $item_name: String!) {
        create_item (board_id: $board_id, item_name: $item_name) {
          id
        }
      }
    GRAPHQL
  end
end
