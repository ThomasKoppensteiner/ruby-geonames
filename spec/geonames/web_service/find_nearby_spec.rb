require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearby" do
      subject { described_class.find_nearby(latitude, longitude) }

      let(:latitude)  { +37.501707 }
      let(:longitude) { -122.468838 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/findNearby?lang=en&lat=37.501707&lng=-122.468838" }
      let(:fixture_folder) { "find_nearby" }
      let(:fixture_file)   { "wilkinson.xml" }

      it { should be_a_kind_of(Array) }

      it "returns Toponym instances" do
        subject.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end

    describe ".find_nearby with full-style" do
      subject { described_class.find_nearby(latitude, longitude, style: 'FULL') }

      let(:latitude)  { 48.18 }
      let(:longitude) { 14.11 }

      include_context "when geonames is called"

      let(:geonames_url)   { "http://api.geonames.org/findNearby?lang=en&lat=48.18&lng=14.11&style=FULL" }
      let(:fixture_folder) { "find_nearby" }
      let(:fixture_file)   { "marchtrenk.xml" }

      it "return full Toponym instance" do
        subject.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end
  end
end
