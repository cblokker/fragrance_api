require 'graphlient' # https://github.com/ashkan18/graphlient
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

  # TODO: potential of weird mapping issues between item keys & board col names.
  # Might be a good idea to create some validation layer here, or at least
  # check to see if board schema maps to expected item type. (OR lock board columns to ensure linkage)
  def create_items(board_id:, item_name: '', dropdown_values: '', quantity: 1)
    client.query(item_query, {
        board_id: board_id,
        item_name: item_name,
        column_values: {
          dropdown: { labels: dropdown_values }
        }.to_json
      }
    )
  end

  # creator_id
  def item_query
    <<-GRAPHQL
      mutation ($board_id: ID!, $item_name: String!, $column_values: JSON) {
        create_item (board_id: $board_id, item_name: $item_name, column_values: $column_values, create_labels_if_missing: true) {
          id
        }
      }
    GRAPHQL
  end
end
