require 'spec_helper'

module Geonames
  describe WebService do
    describe ".country_code" do
      subject { described_class.country_code(latitude, longitude) }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/countrycode?a=a&lang=en&lat=#{latitude}&lng=#{longitude}&maxRows=1&radius=0&type=xml" }
      let(:fixture_folder) { "country_code" }
      let(:fixture_file)   { "canada.xml" }

      it { should be_a_kind_of(Array) }

      it "returns Toponym instances" do
        subject.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end
  end
end
