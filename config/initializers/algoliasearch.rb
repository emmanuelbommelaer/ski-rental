AlgoliaSearch.configuration = {
  application_id: 'JD2V2YE8DN',
  api_key: ENV["ALGOLIA_API_KEY"],
  index: ENV["ALGOLIA_INDEX"],
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}
