require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearby_place_name" do
      subject { described_class.find_nearby_place_name(latitude, longitude) }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/findNearbyPlaceName?lang=en&lat=#{latitude}&lng=#{longitude}"}
      let(:fixture_folder) { "find_nearby_place_name" }
      let(:fixture_file)   { "oshawa.xml" }

      it { should be_a_kind_of(Array) }

      it "returns Toponym instances" do |example|
        subject.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end
  end
end
