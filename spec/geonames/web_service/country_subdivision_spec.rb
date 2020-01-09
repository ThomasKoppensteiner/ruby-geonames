require 'spec_helper'

module Geonames
  describe WebService do
    describe ".country_subdivision" do
      subject { described_class.country_subdivision(latitude, longitude) }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/countrySubdivision?a=a&lang=en&lat=#{latitude}&lng=#{longitude}&maxRows=1&radius=0&type=xml" }
      let(:fixture_folder) { "country_subdivision" }
      let(:fixture_file)   { "ontario.xml" }

      it { should be_a_kind_of(Array) }

      it "returns CountrySubdivision instances" do
        subject.each do |element|
          element.should be_a_kind_of CountrySubdivision
        end
      end

      # TODO add compare method

      # let(:expected_subdivisions) do
      #   [
      #     Geonames::CountrySubdivision.new.tap do |csd|
      #       csd.code_fips    = "08"
      #       csd.admin_name_1 = "Ontario"
      #       csd.admin_code_1 = "08"
      #       csd.code_iso     = "ON"
      #       csd.country_name = "Canada"
      #       csd.country_code = "CA"
      #     end
      #   ]
      # end
      #
      # it { expect(subject).to match expected_subdivisions }
    end
  end
end
