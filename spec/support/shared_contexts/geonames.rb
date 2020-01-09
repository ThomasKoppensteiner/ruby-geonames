shared_context "when geonames is called" do
  let(:response_body) do
    File.read File.join(File.dirname(__FILE__), '..', '..', 'fixtures', fixture_folder, fixture_file)
  end

  before do
    stub_request(:get, geonames_url)
      .to_return(status: 200, body: response_body, headers: {})
  end
end
