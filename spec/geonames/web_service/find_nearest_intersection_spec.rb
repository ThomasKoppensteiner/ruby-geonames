require 'spec_helper'

module Geonames
  describe WebService do
    describe ".find_nearest_intersection" do
      subject { described_class.find_nearest_intersection(latitude, longitude) }

      let(:latitude)  { +43.900120387 }
      let(:longitude) { -78.882869834 }

      include_context "when geonames is called"
      let(:geonames_url)   { "http://api.geonames.org/findNearestIntersection?a=a&lang=en&lat=43.900120387&lng=-78.882869834" }
      let(:fixture_folder) { "find_nearest_intersection" }
      let(:fixture_file)   { "park_ave_and_e_51st_st.xml" }

      it { should be_a_kind_of(Intersection) }
    end
  end
end
