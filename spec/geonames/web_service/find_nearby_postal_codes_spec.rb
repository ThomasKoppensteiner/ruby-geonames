require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearby_postal_codes" do
      subject { described_class.find_nearby_postal_codes(criteria) }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/findNearbyPostalCodes?a=a&lang=en&placename=Oshawa" }
      let(:fixture_folder) { "find_nearby_postal_codes" }
      let(:fixture_file)   { "oshawa.xml" }

      context "lookup by place name" do
        let(:criteria) { Geonames::PostalCodeSearchCriteria.new(place_name: "Oshawa") }

        it { should be_a_kind_of(Array) }

        it "returns PostalCode instances" do
          subject.each do |element|
            element.should be_a_kind_of PostalCode
          end
        end
      end
    end
  end
end
