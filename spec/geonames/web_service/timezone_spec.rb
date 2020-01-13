require 'spec_helper'

module Geonames
  describe WebService do
    describe ".timezone" do
      subject { described_class.timezone(latitude, longitude) }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/timezone?lang=en&lat=43.900120387&lng=-78.882869834" }
      let(:fixture_folder) { "timezone" }
      let(:fixture_file)   { "america_toronto.xml" }

      it { should be_a_kind_of(Timezone) }

      it "should have the raw offset set" do
        subject.raw_offset.should == -5.0
      end
    end
  end
end
