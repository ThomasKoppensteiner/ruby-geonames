require 'spec_helper'

module Geonames
  describe WebService do

    describe ".search Marchtrenk with full-style" do
      subject { described_class.search(ToponymSearchCriteria.new(q: query, style: 'FULL')) }

      let(:query)  { "Marchtrenk" }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/search?a=a&lang=en&q=Marchtrenk&style=FULL" }
      let(:fixture_folder) { "search" }
      let(:fixture_file)   { "marchtrenk.xml" }

      it "return full Toponym instance" do
        subject.toponyms.each do |element|
          element.should be_a_kind_of Toponym
        end
      end
    end

    describe ".search Upper Austria with full-style" do
      subject { described_class.search(ToponymSearchCriteria.new(q: query, style: 'FULL', max_rows: "1")).toponyms.first }

      let(:query)  { "Upper Austria" }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/search?a=a&lang=en&maxRows=1&q=Upper%20Austria&style=FULL" }
      let(:fixture_folder) { "search" }
      let(:fixture_file)   { "upper_austria.xml" }

      it "return full Toponym instance" do
        subject.should be_a_kind_of Toponym
        subject.alternate_names.count.should == 7
      end
    end

    describe ".search Austria with full-style" do
      subject { described_class.search(ToponymSearchCriteria.new(q: query, country_code: country_code, style: 'FULL', max_rows: "1")).toponyms.first }

      let(:query)         { "Austria" }
      let(:country_code)  { "AT" }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/search?a=a&country=AT&lang=en&maxRows=1&q=Austria&style=FULL" }
      let(:fixture_folder) { "search" }
      let(:fixture_file)   { "austria.xml" }

      it "return full Toponym instance" do
        subject.should be_a_kind_of Toponym
        subject.alternate_names.count.should == 105
        subject.timezone.should == "Europe/Vienna"
      end
    end
  end
end
