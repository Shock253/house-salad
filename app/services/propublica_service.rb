class PropublicaService
  def members_of_house(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_KEY"]
    end
  end
end
