require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearby_wikipedia" do
      subject { described_class.find_nearby_wikipedia({ :lat => latitude, :long => longitude }) }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/findNearbyWikipedia?a=a&lang=en&lat=43.900120387&lng=-78.882869834" }
      let(:fixture_folder) { "find_nearby_wikipedia" }
      let(:fixture_file)   { "general_motors_centre.xml" }

      context "lookup by latitude and longitude" do
        it { should be_a_kind_of(Array) }

        it "returns WikipediaArticle instances" do
          subject.each do |element|
            element.should be_a_kind_of WikipediaArticle
          end
        end
      end
    end
  end
end
