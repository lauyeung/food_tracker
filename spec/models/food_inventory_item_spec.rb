require 'spec_helper'

describe FoodInventoryItem do
  it { should_not have_valid(:title).when(nil,'') }
  it { should_not have_valid(:description).when(nil,'') }
  it { should_not have_valid(:quantity).when(nil,'') }

end
