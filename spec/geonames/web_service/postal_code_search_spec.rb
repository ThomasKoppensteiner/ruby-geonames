require 'spec_helper'

module Geonames
  describe WebService do
    describe ".postal_code_search" do
      subject { described_class.postal_code_search(criteria) }

      context "lookup by place name" do
        let(:criteria) { Geonames::PostalCodeSearchCriteria.new(place_name: "Oshawa") }

        include_context "when geonames is called"
        let(:geonames_url)   { "http://api.geonames.org/postalCodeSearch?a=a&lang=en&placename=Oshawa" }
        let(:fixture_folder) { "postal_code_search" }
        let(:fixture_file)   { "oshawa.xml" }

        it { should be_a_kind_of(Array) }

        it "returns PostalCode instances" do
          subject.each do |element|
            element.should be_a_kind_of PostalCode
          end
        end
      end

      context "lookup by latitude and longitude" do
        let(:criteria) { Geonames::PostalCodeSearchCriteria.new(latitude:  47, longitude: 9) }

        include_context "when geonames is called"
        let(:geonames_url)   { "http://api.geonames.org/postalCodeSearch?a=a&lang=en&lat=47&lng=9" }
        let(:fixture_folder) { "postal_code_search" }
        let(:fixture_file)   { "lat_lng.xml" }

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
