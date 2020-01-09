require 'spec_helper'

module Geonames
  describe WebService do
    describe ".make_request" do
      subject { WebService.make_request '/foo?a=a' }

      let(:expected_request) do
        stub_request(:get, "http://api.geonames.org/foo?a=a&lang=en").
          with(
            headers: {
              'User-Agent'=>'geonames ruby webservice client 0.3.5'
            }
          ).to_return(status: 200, body: "", headers: {})
      end

      before do
        expected_request # stub request
      end

      it "uses a custom User-Agent header" do
        subject

        expect(expected_request).to have_been_made
      end
    end
  end
end
